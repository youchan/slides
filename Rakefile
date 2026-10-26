# frozen_string_literal: true

namespace :build do
  # Static site (GitHub Pages): runs static/build.rb under this Gemfile
  # (Opal is in the :static group).
  #
  #   rake build:static                                # -> static/public/, no base path
  #   rake build:static BASE_PATH=/slides              # GitHub Pages style
  #   rake build:static OUTPUT_DIR=_site BASE_PATH=/slides
  #   rake build:static SKIP_OPAL=1                    # templates/assets only
  #
  # OUTPUT_DIR is relative to the project root (default: static/public).
  desc 'Build the static site (OUTPUT_DIR=static/public BASE_PATH= SKIP_OPAL=)'
  task :static do
    sh 'bundle check > /dev/null || bundle install'

    output = File.expand_path(ENV.fetch('OUTPUT_DIR', 'static/public'), __dir__)
    args = ['bundle', 'exec', 'ruby', File.join(__dir__, 'static/build.rb'), '--output', output]
    args += ['--base-path', ENV['BASE_PATH']] if ENV['BASE_PATH']
    args << '--skip-opal' if ENV['SKIP_OPAL']

    # build.rb also reads OUTPUT_DIR/BASE_PATH as fallbacks; they are passed
    # explicitly above, so drop them from the child's environment.
    sh({ 'OUTPUT_DIR' => nil, 'BASE_PATH' => nil }, *args, chdir: __dir__)
  end
end
