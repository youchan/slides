require 'webrick'

server = WEBrick::HTTPServer.new(Port: 9161)

# /slides へのアクセスを docs ディレクトリにマッピング
server.mount '/slides', WEBrick::HTTPServlet::FileHandler, 'docs'

trap('INT') { server.shutdown }
server.start
