# frozen_string_literal: true

# Static site for GitHub Pages, built by hand into docs/ and committed
# (Settings -> Pages -> Deploy from a branch: main, /docs).
#
#   rake engine:release VERSION=v1        # docs/js/slide_v1.{js,css} from the current engine
#   rake engine:release VERSION=v1 FORCE=1  # overwrite an existing version
#   rake engine:list                      # released versions
#   rake build SLIDE=RubyKaigi2026        # build talks (SLIDE=a,b for several) + index.html
#   rake build ALL=1                      # rebuild every talk, each with its own engine_version
#   rake build:index                      # regenerate docs/index.html only
#
# Each talk names its engine in slides/<name>/meta.toml:  engine_version = 'v1'
# OUTPUT_DIR=dir builds somewhere else (relative to where rake was run).

def static_build(*args)
  sh 'bundle check > /dev/null || bundle install'

  cmd = ['bundle', 'exec', 'ruby', File.join(__dir__, 'static/build.rb')]
  cmd += ['--output', File.expand_path(ENV['OUTPUT_DIR'], Rake.original_dir)] if ENV['OUTPUT_DIR']
  sh(*cmd, *args, chdir: __dir__)
end

# "a,b" or "a b" -> ["a", "b"]
def list_from_env(name)
  ENV.fetch(name, '').split(/[\s,]+/).reject(&:empty?)
end

namespace :engine do
  desc 'Snapshot the current engine as docs/js/slide_VERSION.{js,css} (VERSION=name [FORCE=1])'
  task :release, [:version] do |_t, args|
    version = args[:version] || ENV['VERSION']
    abort 'usage: rake engine:release VERSION=name [FORCE=1]' if version.nil? || version.empty?

    static_build('release', version, *('--force' if ENV['FORCE']))
  end

  desc 'List released engine versions'
  task :list do
    static_build('versions')
  end
end

desc 'Build talks into docs/ and update docs/index.html (SLIDE=name[,name...] or ALL=1)'
task :build do |_t, args|
  if ENV['ALL']
    static_build('build', '--all')
  else
    names = args.to_a + list_from_env('SLIDE')
    abort 'usage: rake build SLIDE=name[,name...]   (or ALL=1 for every talk)' if names.empty?

    static_build('build', *names)
  end
end

namespace :build do
  desc 'Regenerate docs/index.html from the talks already built'
  task :index do
    static_build('index')
  end
end
