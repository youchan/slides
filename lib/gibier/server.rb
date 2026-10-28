# frozen_string_literal: true

# Development server: serves the talks straight from the sources so edits
# show up without running `rake build`.
#
#   exe/gibier server            # http://localhost:9161/
#
# What it serves (the talks are laid out as in the static build, static/build.rb,
# but every talk uses the engine being developed rather than its engine_version):
#   /                      talk list (static/templates/index.html.erb)
#   /<name>/               a talk    (static/templates/slide.html.erb)
#   /<name>/<path>         slides/<name>/<path> (slide.md, css/, images/, ...)
#   /slide.js              static/slide.rb.erb + lib/gibier/client/, compiled with
#                          Opal in-process; recompiled only when they change
#   /<path>                assets/<path> (css/, images/)
#
# slide.md is fetched by the browser at runtime, so a Markdown edit only needs
# a reload, and the pages reload themselves when a watched file changes.

require 'erb'
require 'json'
require 'rack'
require_relative 'meta'

module Gibier
  class Server
    DEFAULT_ROOT = File.expand_path('../..', __dir__)
    STATUS_PATH = '/__gibier/status'
    NO_CACHE = { 'cache-control' => 'no-cache' }.freeze
    # Editor droppings that must not trigger a reload (vim swap/backup files, ...)
    IGNORED_FILE = /(\A\.|~\z|\.sw[a-p]\z|\A4913\z)/

    def self.start(host: 'localhost', port: 9161, server: nil, **options)
      require 'rackup'

      app = new(**options)
      url = "http://#{host}:#{port}#{app.base_path}/"
      warn "gibier: serving #{app.root} at #{url} (Ctrl-C to stop)"

      # One access log line per request, minus the once-a-second reload polls.
      logged = Rack::CommonLogger.new(app, $stderr)
      handler = ->(env) { env['PATH_INFO'].to_s.end_with?(STATUS_PATH) ? app.call(env) : logged.call(env) }
      Rackup::Server.start(app: handler, Host: host, Port: port, server: server,
                           environment: 'none', AccessLog: [])
    end

    attr_reader :root, :base_path

    # root:        the repository root (slides/, assets/, static/)
    # base_path:   URL prefix, e.g. "/slides" to mimic GitHub Pages
    # live_reload: reload open pages when a watched file changes
    def initialize(root: DEFAULT_ROOT, base_path: '', live_reload: true)
      @root = File.expand_path(root)
      @base_path = normalize_base_path(base_path)
      @live_reload = live_reload
      @tool_dir = File.join(@root, 'static')
      @slides_dir = File.join(@root, 'slides')
      @assets_dir = File.join(@root, 'assets')
      @lib_dir = File.join(@root, 'lib')                    # Opal load path
      @client_dir = File.join(@lib_dir, 'gibier', 'client') # Gibier::Client (runs in the browser)
      @slide_js = nil
      @slide_js_key = nil
      @compile_lock = Mutex.new

      %w[slides assets static/templates lib/gibier/client].each do |dir|
        next if Dir.exist?(File.join(@root, dir))

        raise ArgumentError, "#{@root} does not look like the slides repository (missing #{dir}/)"
      end
    end

    def call(env)
      request = Rack::Request.new(env)
      return text(405, 'method not allowed') unless request.get? || request.head?

      path = Rack::Utils.unescape_path(request.path_info)
      return text(400, 'bad request') unless path.valid_encoding?

      unless @base_path.empty?
        return redirect("#{@base_path}/") if path == '/' || path == @base_path
        return not_found(path) unless path.start_with?("#{@base_path}/")

        path = path.delete_prefix(@base_path)
      end

      route(request, env, path)
    rescue StandardError, ScriptError => e
      # e.g. a broken template or meta.toml: show it instead of a bare 500
      warn "gibier: #{e.class}: #{e.message}\n  #{e.backtrace.first(5).join("\n  ")}"
      text(500, "#{e.class}: #{e.message}\n\n#{e.backtrace.join("\n")}")
    end

    private

    def route(request, env, path)
      case path
      when '/', '/index.html'
        html(render_index)
      when '/slide.js'
        serve_slide_js
      when STATUS_PATH
        status(request.params['slide'])
      else
        name, rest = path.delete_prefix('/').split('/', 2)
        if slide?(name)
          serve_slide(env, name, rest)
        else
          serve_file(env, @assets_dir, path)
        end
      end
    end

    # --- talks ---------------------------------------------------------------

    def slide?(name)
      !name.nil? && name.match?(/\A[\w.-]+\z/) && File.file?(File.join(@slides_dir, name, 'slide.md'))
    end

    def slide_names
      Dir.glob(File.join(@slides_dir, '*', 'slide.md')).map { |md| File.basename(File.dirname(md)) }
    end

    def slide_info(name)
      Meta.slide_info(File.join(@slides_dir, name))
    end

    def serve_slide(env, name, rest)
      # "/<name>" -> "/<name>/": slide.js reads the talk name from a URL ending in "/".
      return redirect("#{@base_path}/#{name}/") if rest.nil?
      return html(render_slide(name)) if rest.empty? || rest == 'index.html'
      return not_found(rest) if rest == 'meta.toml'

      serve_file(env, File.join(@slides_dir, name), "/#{rest}")
    end

    def render_index
      sorted = Meta.sort(slide_names.map { |name| slide_info(name) })
      with_reload(template('index.html.erb').result_with_hash(slides: sorted, base_path: @base_path), nil)
    end

    def render_slide(name)
      # Always the engine being developed (meta.toml's engine_version is for the static build).
      html = template('slide.html.erb').result_with_hash(
        slide: slide_info(name),
        engine_js: "#{@base_path}/slide.js",
        engine_css: ["#{@base_path}/css/highlight.css", "#{@base_path}/css/application.css"],
      )
      with_reload(html, name)
    end

    def template(file)
      ERB.new(File.read(File.join(@tool_dir, 'templates', file), encoding: 'UTF-8'), trim_mode: '-')
    end

    # --- slide.js (Opal) -------------------------------------------------------

    def opal_sources
      [File.join(@tool_dir, 'slide.rb.erb'), *Dir.glob(File.join(@client_dir, '**', '*.rb'))].sort
    end

    def serve_slide_js
      js = @compile_lock.synchronize do
        key = [@base_path, *opal_sources.map { |f| [f, File.mtime(f).to_f] }]
        unless key == @slide_js_key
          @slide_js = compile_slide_js
          @slide_js_key = key
        end
        @slide_js
      end
      [200, { 'content-type' => 'text/javascript; charset=utf-8', **NO_CACHE }, [js]]
    rescue StandardError, ScriptError => e
      warn "gibier: failed to compile slide.js: #{e.class}: #{e.message}"
      js = "console.error(#{JSON.generate("gibier: failed to compile slide.js\n#{e.class}: #{e.message}")});\n"
      [500, { 'content-type' => 'text/javascript; charset=utf-8', **NO_CACHE }, [js]]
    end

    def compile_slide_js
      require 'opal'

      started = Process.clock_gettime(Process::CLOCK_MONOTONIC)
      source = ERB.new(File.read(File.join(@tool_dir, 'slide.rb.erb'), encoding: 'UTF-8'))
                  .result_with_hash(base_path: @base_path)
      builder = ::Opal::Builder.new
      builder.append_paths(@lib_dir)
      builder.build('opal')
      builder.build_str(source, 'slide.rb')
      js = "#{builder}\n#{builder.source_map.to_data_uri_comment}\n"
      elapsed = Process.clock_gettime(Process::CLOCK_MONOTONIC) - started
      warn format('gibier: compiled slide.js (opal %s, %.1fs)', ::Opal::VERSION, elapsed)
      js
    end

    # --- live reload -----------------------------------------------------------

    # A fingerprint of every file a page depends on; the page polls it and
    # reloads when it changes.
    def status(name)
      dirs = [@assets_dir, File.join(@tool_dir, 'templates'), @client_dir]
      files = [File.join(@tool_dir, 'slide.rb.erb')]
      if name && slide?(name)
        dirs << File.join(@slides_dir, name)
      else
        files.concat(Dir.glob(File.join(@slides_dir, '*', '{slide.md,meta.toml}')))
      end
      dirs.each do |dir|
        files.concat(Dir.glob(File.join(dir, '**', '*')).reject { |f| File.basename(f).match?(IGNORED_FILE) })
      end

      stamps = files.sort.filter_map do |f|
        stat = File.stat(f)
        "#{f}:#{stat.mtime.to_f}:#{stat.size}" if stat.file?
      rescue SystemCallError
        nil # deleted while we were looking
      end
      text(200, stamps.hash.to_s(36))
    end

    def with_reload(html, name)
      return html unless @live_reload

      url = "#{@base_path}#{STATUS_PATH}#{"?slide=#{Rack::Utils.escape(name)}" if name}"
      script = <<~HTML
        <script>
          // gibier dev server: reload when a source file changes
          (() => {
            let last = null;
            const poll = async () => {
              try {
                const res = await fetch(#{JSON.generate(url)}, { cache: 'no-store' });
                const stamp = await res.text();
                if (last !== null && stamp !== last) { location.reload(); return; }
                last = stamp;
              } catch (e) { /* server restarting */ }
              setTimeout(poll, 1000);
            };
            poll();
          })();
        </script>
      HTML
      html.sub(%r{</body>}i) { "#{script}</body>" }
    end

    # --- responses ---------------------------------------------------------------

    def serve_file(env, dir, path)
      return not_found(path) unless Dir.exist?(dir)

      # Rack::Files rejects ".." and serves ranges / 304s / content types.
      Rack::Files.new(dir, NO_CACHE).call(env.merge('PATH_INFO' => Rack::Utils.escape_path(path)))
    end

    def html(body)
      [200, { 'content-type' => 'text/html; charset=utf-8', **NO_CACHE }, [body]]
    end

    def text(status, body)
      [status, { 'content-type' => 'text/plain; charset=utf-8', **NO_CACHE }, [body]]
    end

    def redirect(location)
      [302, { 'location' => location, 'content-type' => 'text/plain; charset=utf-8' }, ["-> #{location}"]]
    end

    def not_found(path)
      text(404, "not found: #{path}")
    end

    def normalize_base_path(base_path)
      # "/slides/", "slides" -> "/slides"; "" or "/" -> ""
      base = base_path.to_s.strip.delete_suffix('/')
      base.empty? || base.start_with?('/') ? base : "/#{base}"
    end
  end
end
