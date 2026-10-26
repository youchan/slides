# Serves the built site under /slides, the same way GitHub Pages does.
#
#   rake build:static BASE_PATH=/slides
#   ruby static/gh_server.rb [DIR]   # DIR defaults to static/public
require 'webrick'

dir = ARGV[0] || File.join(__dir__, 'public')
server = WEBrick::HTTPServer.new(Port: 9161)
server.mount '/slides', WEBrick::HTTPServlet::FileHandler, dir

trap('INT') { server.shutdown }
server.start
