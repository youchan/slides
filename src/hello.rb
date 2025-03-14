require 'js'
require 'wasm_drb'

class Pages
  def self.pages
    @pages ||= DRb::DRbObject.new_with_uri 'ws://127.0.0.1:9161'
  end
end

page = JS.global[:document].getElementsByClassName('page-container')[0]
page[:innerHTML] = Pages.pages.page(0).await.to_html.await

DRb.start_service("ws://127.0.0.1:9161/callback")
