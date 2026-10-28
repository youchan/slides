#!/usr/bin/env ruby
# frozen_string_literal: true

# Static site generator for GitHub Pages (served from docs/ on main).
# Usually run through rake from the repository root:
#
#   rake engine:release VERSION=v1     # snapshot the engine as docs/js/slide_v1.{js,css}
#   rake build SLIDE=RubyKaigi2026     # build one talk (or several: SLIDE=a,b)
#   rake build ALL=1                   # rebuild every talk, each with its own engine
#   rake build:index                   # regenerate docs/index.html only
#   rake engine:list                   # released engine versions
#
# or directly (Opal comes from the :static group of the root Gemfile):
#
#   bundle exec ruby static/build.rb [-o DIR] release VERSION [--force]
#   bundle exec ruby static/build.rb [-o DIR] build NAME... | --all
#   bundle exec ruby static/build.rb [-o DIR] index
#   bundle exec ruby static/build.rb [-o DIR] versions
#
# Engine versions
#   An engine is slide.js (static/slide.rb.erb + lib/gibier/client/, compiled
#   with Opal) plus its stylesheet (assets/css/highlight.css + application.css).
#   `release` writes them as <out>/js/slide_<VERSION>.js and .css and never
#   overwrites an existing version unless --force is given. Each talk picks
#   its engine with `engine_version = '<VERSION>'` in slides/<name>/meta.toml,
#   so a new engine never changes a talk that was built with an older one.
#
# Output (<out> defaults to docs/ in the repository root):
#   index.html            talk list: every talk built into <out>
#   .nojekyll             serve files as they are (no Jekyll on GitHub Pages)
#   js/slide_<V>.{js,css} released engines
#   images/               assets/images/ (used by the engine stylesheet)
#   <name>/               a talk: slide.md, css/, images/, ... and index.html
#
# All URLs in the output are relative, so it works under any base path.

require 'erb'
require 'fileutils'
require 'optparse'

Encoding.default_external = Encoding::UTF_8 # meta.toml may contain Japanese

TOOL_DIR = __dir__                      # static/
ROOT = File.expand_path('..', TOOL_DIR) # repository root
LIB_DIR = File.join(ROOT, 'lib')        # Opal load path (gibier/client/)
SLIDES_DIR = File.join(ROOT, 'slides')
ASSETS_DIR = File.join(ROOT, 'assets')
ENGINE_CSS = %w[css/highlight.css css/application.css].freeze # concatenated in this order
VERSION_FORMAT = /\A[0-9A-Za-z][\w.-]*\z/
NAME_FORMAT = /\A[\w.-]+\z/

$LOAD_PATH.unshift(LIB_DIR)
require 'gibier/meta'

def fail!(message)
  abort "build: #{message}"
end

options = { output: File.join(ROOT, 'docs'), force: false, all: false }
parser = OptionParser.new do |opts|
  opts.banner = <<~TEXT
    Usage: ruby build.rb [options] release VERSION
           ruby build.rb [options] build NAME... | --all
           ruby build.rb [options] index
           ruby build.rb [options] versions
  TEXT
  opts.on('-o', '--output DIR', 'Output directory (default: docs/ in the repository)') { |v| options[:output] = v }
  opts.on('-f', '--force', 'release: overwrite an existing version') { options[:force] = true }
  opts.on('-a', '--all', 'build: every talk in slides/') { options[:all] = true }
end
parser.parse!

OUT_DIR = File.expand_path(options[:output])
JS_DIR = File.join(OUT_DIR, 'js')

protected_dirs = [ROOT, TOOL_DIR, LIB_DIR, SLIDES_DIR, ASSETS_DIR, File.join(ROOT, '.git')]
if protected_dirs.any? { |d| OUT_DIR == d || d.start_with?("#{OUT_DIR}/") || OUT_DIR.start_with?("#{SLIDES_DIR}/") }
  fail! "refusing to build into #{OUT_DIR}: it contains sources"
end

def engine_files(version)
  %w[js css].to_h { |ext| [ext.to_sym, File.join(JS_DIR, "slide_#{version}.#{ext}")] }
end

def released_versions
  Dir.glob(File.join(JS_DIR, 'slide_*.js')).map { |f| File.basename(f, '.js').delete_prefix('slide_') }.sort
end

def prepare_output
  FileUtils.mkdir_p(OUT_DIR)
  nojekyll = File.join(OUT_DIR, '.nojekyll')
  File.write(nojekyll, '') unless File.exist?(nojekyll)
end

# --- release: compile the engine -----------------------------------------------

def compile_slide_js
  begin
    require 'opal'
  rescue LoadError
    fail! <<~MSG.chomp
      opal is not available. Run through rake (it uses the :static group of the root Gemfile):
        rake engine:release VERSION=...
    MSG
  end

  # The engine is location independent (it fetches ./slide.md), so the
  # template gets no base path.
  source = ERB.new(File.read(File.join(TOOL_DIR, 'slide.rb.erb'))).result_with_hash(base_path: '')
  builder = Opal::Builder.new
  builder.append_paths(LIB_DIR)
  builder.build('opal')
  builder.build_str(source, 'slide.rb')
  [builder.to_s, Opal::VERSION]
end

def release(version, force:)
  fail! "invalid version name #{version.inspect} (letters, digits, '.', '_', '-')" unless version.match?(VERSION_FORMAT)

  files = engine_files(version)
  if !force && files.values.any? { |f| File.exist?(f) }
    fail! "engine #{version} is already released (#{files[:js]}); pick another name, or --force (FORCE=1) to overwrite it"
  end

  js, opal_version = compile_slide_js
  css = ENGINE_CSS.map do |path|
    "/* #{path} */\n#{File.read(File.join(ASSETS_DIR, path))}\n"
  end.join("\n")

  prepare_output
  FileUtils.mkdir_p(JS_DIR)
  File.write(files[:js], "/* gibier engine #{version} (opal #{opal_version}) */\n#{js}\n")
  File.write(files[:css], "/* gibier engine #{version} */\n#{css}")

  # Shared images referenced by the engine stylesheet (../images/ from js/).
  # Added or updated, never removed, so older engines keep finding theirs.
  images = File.join(ASSETS_DIR, 'images')
  FileUtils.cp_r(File.join(images, '.'), File.join(OUT_DIR, 'images')) if Dir.exist?(images)

  puts "released engine #{version}: #{files[:js]} (opal #{opal_version}), #{files[:css]}"
end

# --- build: one talk -------------------------------------------------------------

# Editor droppings are not published (vim swap/backup files, .DS_Store, ...)
def skip_entry?(name)
  name.start_with?('.') || name.end_with?('~') || name.match?(/\.sw[a-p]\z/) || name == 'meta.toml'
end

def copy_tree(src, dest)
  FileUtils.mkdir_p(dest)
  Dir.children(src).each do |entry|
    next if skip_entry?(entry)

    from = File.join(src, entry)
    if File.directory?(from)
      copy_tree(from, File.join(dest, entry))
    else
      FileUtils.cp(from, File.join(dest, entry))
    end
  end
end

def slide_names
  Dir.glob(File.join(SLIDES_DIR, '*', 'slide.md')).map { |md| File.basename(File.dirname(md)) }.sort
end

def check_slide(name)
  dir = File.join(SLIDES_DIR, name)
  fail! "no such talk: slides/#{name}/slide.md" unless name.match?(NAME_FORMAT) && File.file?(File.join(dir, 'slide.md'))

  slide = Gibier::Meta.slide_info(dir)
  version = slide[:engine_version]
  if version.nil? || version.empty?
    fail! "slides/#{name}/meta.toml has no engine_version (released: #{released_versions.join(', ').then { |v| v.empty? ? 'none' : v }})"
  end

  missing = engine_files(version).values.reject { |f| File.exist?(f) }
  unless missing.empty?
    fail! "slides/#{name}: engine #{version} is not released (missing #{missing.join(', ')}); " \
          "run `rake engine:release VERSION=#{version}` first"
  end
  slide
end

def build(names)
  slides = names.map { |name| check_slide(name) } # validate everything before writing anything
  template = ERB.new(File.read(File.join(TOOL_DIR, 'templates/slide.html.erb')), trim_mode: '-')

  prepare_output
  slides.each do |slide|
    dest = File.join(OUT_DIR, slide[:name])
    FileUtils.rm_rf(dest)
    copy_tree(slide[:dir], dest)
    html = template.result_with_hash(
      slide: slide,
      engine_js: "../js/slide_#{slide[:engine_version]}.js",
      engine_css: ["../js/slide_#{slide[:engine_version]}.css"],
    )
    File.write(File.join(dest, 'index.html'), html)
    puts "built #{slide[:name]}/ (engine #{slide[:engine_version]})"
  end
end

# --- index: the talk list ----------------------------------------------------------

# Lists every talk built into the output that still has a source in slides/.
def build_index
  prepare_output
  slides = slide_names
           .select { |name| File.file?(File.join(OUT_DIR, name, 'index.html')) }
           .map { |name| Gibier::Meta.slide_info(File.join(SLIDES_DIR, name)) }
  template = ERB.new(File.read(File.join(TOOL_DIR, 'templates/index.html.erb')), trim_mode: '-')
  File.write(File.join(OUT_DIR, 'index.html'), template.result_with_hash(slides: Gibier::Meta.sort(slides), base_path: ''))
  puts "built index.html (#{slides.size} talks)"
end

# --- main ----------------------------------------------------------------------------

command = ARGV.shift
case command
when 'release'
  version = ARGV.shift or fail!("release needs a VERSION\n#{parser.banner}")
  release(version, force: options[:force])
when 'build'
  names = options[:all] ? slide_names : ARGV
  fail! "build needs talk names (or --all)\n#{parser.banner}" if names.empty?
  build(names)
  build_index
when 'index'
  build_index
when 'versions'
  puts released_versions
else
  abort parser.help
end
