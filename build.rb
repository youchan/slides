#!/usr/bin/env ruby
# Builds everything under docs/ from its source templates:
#   - docs/*/index.html       from docs/*/index.html.erb
#   - docs/slide.js           from static/slide.rb.erb (compiled with Opal)
#
# BASE_PATH controls the prefix used for same-origin asset paths
# (css/slide.js/slide.md). Default is empty, for serving docs/ directly
# with a plain local HTTP server. GitHub Pages serves this repo under
# /slides/, so the deploy workflow builds with BASE_PATH=/slides.

require 'erb'
require 'fileutils'

base_path = ENV['BASE_PATH'] || ''

Dir.glob(File.join(__dir__, 'docs/*/index.html.erb')).sort.each do |template_path|
  output_path = template_path.sub(/\.erb\z/, '')
  erb = ERB.new(File.read(template_path))
  File.write(output_path, erb.result(binding))
  puts "built #{output_path} (BASE_PATH=#{base_path.inspect})"
end

static_dir = File.join(__dir__, 'static')
slide_rb = File.join(static_dir, 'slide.rb')
slide_js = File.join(__dir__, 'docs/slide.js')

erb = ERB.new(File.read(File.join(static_dir, 'slide.rb.erb')))
File.write(slide_rb, erb.result(binding))

begin
  system('opal', '-I.', '-c', 'slide.rb', chdir: static_dir, out: slide_js, exception: true)
  puts "built #{slide_js} (BASE_PATH=#{base_path.inspect})"
ensure
  FileUtils.rm_f(slide_rb)
end
