# frozen_string_literal: true

namespace :build do
  # Static site (GitHub Pages): runs static/build.rb under this Gemfile
  # (Opal is in the :static group).
  #
  #   rake build:static                                # -> ./dist/, no base path
  #   rake build:static BASE_PATH=/slides              # GitHub Pages style
  #   rake build:static OUTPUT_DIR=_site BASE_PATH=/slides
  #   rake build:static SKIP_OPAL=1                    # templates/assets only
  #
  # OUTPUT_DIR is relative to the directory rake was run from (default: dist).
  desc 'Build the static site (OUTPUT_DIR=dist BASE_PATH= SKIP_OPAL=)'
  task :static do
    sh 'bundle check > /dev/null || bundle install'

    # Rake chdirs to the Rakefile's directory; resolve against where it was run.
    output = File.expand_path(ENV.fetch('OUTPUT_DIR', 'dist'), Rake.original_dir)
    args = ['bundle', 'exec', 'ruby', File.join(__dir__, 'static/build.rb'), '--output', output]
    args += ['--base-path', ENV['BASE_PATH']] if ENV['BASE_PATH']
    args << '--skip-opal' if ENV['SKIP_OPAL']

    # build.rb also reads OUTPUT_DIR/BASE_PATH as fallbacks; they are passed
    # explicitly above, so drop them from the child's environment.
    sh({ 'OUTPUT_DIR' => nil, 'BASE_PATH' => nil }, *args, chdir: __dir__)
  end
end
