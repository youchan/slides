require 'js'
require 'wasm_drb'

class Pages
  def self.pages
    @pages ||= DRb::DRbObject.new_with_uri 'ws://127.0.0.1:9161'
  end
end

DRb.start_service("ws://127.0.0.1:9161/callback")
