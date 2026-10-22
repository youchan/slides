# Serves the built site under /slides, the same way GitHub Pages does.
#
#   cd static
#   bundle exec ruby build.rb --base-path /slides
#   ruby gh_server.rb [DIR]        # DIR defaults to public
require 'webrick'

dir = ARGV[0] || 'public'
server = WEBrick::HTTPServer.new(Port: 9161)
server.mount '/slides', WEBrick::HTTPServlet::FileHandler, dir

trap('INT') { server.shutdown }
server.start
