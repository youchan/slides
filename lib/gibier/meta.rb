# frozen_string_literal: true

module Gibier
  # Minimal reader for the subset of TOML used by meta.toml:
  #   key = 'string' | "string" | ['a', "b", ...]   (# comments allowed)
  # Shared by static/build.rb and the development server.
  module Meta
    module_function

    def read(path)
      return {} unless File.exist?(path)

      File.readlines(path, chomp: true, encoding: 'UTF-8').each_with_object({}) do |line, meta|
        line = line.sub(/\s+#.*\z/, '').strip
        next if line.empty? || line.start_with?('#')

        key, value = line.split('=', 2).map(&:strip)
        raise "#{path}: cannot parse line: #{line}" unless key && value

        meta[key] =
          if value.start_with?('[')
            value.scan(/'([^']*)'|"([^"]*)"/).map { |a, b| a || b }
          else
            value[/\A'([^']*)'\z/, 1] || value[/\A"([^"]*)"\z/, 1] or
              raise "#{path}: unsupported value for #{key}: #{value}"
          end
      end
    end

    # The fields the templates use, with defaults.
    def slide_info(dir)
      name = File.basename(dir)
      meta = read(File.join(dir, 'meta.toml'))
      {
        name: name,
        title: meta['title'] || name,
        date: meta['date'] || '',
        fonts: meta['fonts'] || [],
        languages: meta['languages'] || ['ruby'],
        engine_version: meta['engine_version'],
        dir: dir,
      }
    end

    # newest first; talks without a date go last
    def sort(slides)
      dated, undated = slides.partition { |s| !s[:date].empty? }
      dated.sort_by { |s| s[:date] }.reverse + undated.sort_by { |s| s[:name] }
    end
  end
end
