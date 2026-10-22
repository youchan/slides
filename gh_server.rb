# Serves the built site under /slides, the same way GitHub Pages does.
#
#   ruby build.rb --base-path /slides
#   ruby gh_server.rb [DIR]        # DIR defaults to static
require 'webrick'

dir = ARGV[0] || 'static'
server = WEBrick::HTTPServer.new(Port: 9161)
server.mount '/slides', WEBrick::HTTPServlet::FileHandler, dir

trap('INT') { server.shutdown }
server.start
