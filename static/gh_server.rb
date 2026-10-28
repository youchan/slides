# Serves the built site under /slides, the same way GitHub Pages does.
#
#   ruby static/gh_server.rb [DIR]   # DIR defaults to ./docs
require 'webrick'

dir = ARGV[0] || 'docs'
server = WEBrick::HTTPServer.new(Port: 9161)
server.mount '/slides', WEBrick::HTTPServlet::FileHandler, dir

trap('INT') { server.shutdown }
server.start
