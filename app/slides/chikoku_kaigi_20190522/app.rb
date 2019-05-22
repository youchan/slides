require 'slide'
require 'page_base'
require 'slides/chikoku_kaigi_20190522/pages'
require 'opal/websocket'

Gibier.slide_name = 'chikoku_kaigi_20190522'
Gibier.gh_pages = `window.ghPages`
Gibier.assets_path = `window.assetsPath`

module App
  def self.render(ws)
    Hyalite.render(Hyalite.create_element(Gibier::Slide, {ws:ws}), $document['.gibier'])
  end
end

$document.ready do
  ws = Opal::WebSocket.new("ws://#{`window.location.host`}/push_notification/start/slide/chikoku_kaigi_20190522") unless Gibier.gh_pages

  $window.on(:resize) do
    App.render(ws)
  end

  App.render(ws)
end
