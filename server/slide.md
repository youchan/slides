# dRuby on Browser Again!

youchan

![youchan](images/youchan_square.jpeg)

## Who am I

- youchan
- ANDPAD Inc.
- Author of [Gibier](https://github.com/youchan/gibier)
- RubyKaigi 2015～2017
  - Writing web application in Ruby (2015)
  - Isomorphic web programming in Ruby (2016)
  - dRuby on Browser (2017)

## What's ruby.wasm

## What's dRuby

## Why dRuby with ruby.wasm

## Introduce drb-websocket/wasm_drb

- drb-websocket
  - dRuby WebSocket protocol
- wasm_drb
  - dRuby implementation for ruby.wasm

## drb-websocket

* WebSocket protocol plugin for dRuby.
* Using **faye-websocket**
* Standalone mode or Rack middleware mode

## Rack middleware mode

```ruby
app = Rack::Builder.app do
  server = Server.new(host: 'localhost')
  map '/' do
    use DRb::WebSocket::RackApp
    run server
  end
end
```

---

![large](protocol.png)

## wasm-drb

* dRuby client **and server** implementation in ruby.wasm

## Callbacks

```ruby
remote = DRbObject.new_with_uri 'ws://127.0.0.1:1234'
DRbObject.start_service # Run as server

remote.each do |x|
  x.do_something # This is running on client
end
```

## Callbacks

![large](callbacks.png)

## Demo

## Gibier2

## Async probrems
- JS <=> Ruby をまたがると問題多い
- Change the interfaces between marshalable or not
  - if it is not marshalable, the method returns Promise object.

## Async probrems(JS <=> Ruby)

TODO: 簡単な再現コード(イベントハンドラからawaitを呼ぶ)

