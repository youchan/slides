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

## Introduction

My name is ledsun, a Rubyist who enjoys running Ruby in the browser using ruby.wasm as a hobby.
Last year at RubyKaigi, I gave a talk on this topic.
https://rubykaigi.org/2024/presentations/ledsun.html#day3
If you saw my talk last year, thank you! If not, don't worry—this year’s talk builds on it, but stands on its own.

This year, by coincidence, I was working on the same theme as youchan.
I decided to borrow part of youchan's presentation time to share my work.
We each took different approaches to achieve the same goal.
I hope you enjoy seeing the differences between our approaches.

dRuby can be run on any network protocol by implementing a module called a protocol.
By implementing a protocol module that uses WebSocket, dRuby can be run in the browser.

Up to this point, the approach is the same as youchan's.

## ledsun's approach

What did I do to run dRuby in the browser?

I created a library that abstracts WebSocket communications.
It's a library that allows you to use WebSocket communication with the same interface from both CRuby and Ruby running in the browser.

It's called Wands.
https://rubygems.org/gems/wands


## Wands Features

The key feature of Wands is that it provides the same interface for WebSocket communication in both CRuby and the browser.
It has an API similar to TCPSocket, which is commonly used in Ruby.


```ruby
socket = Wands::WebSocket.open('localhost', 2345)
socket.puts("Hello World!")
puts socket.gets
socket.close
```

This code works the same way in both CRuby and the browser.

## Wands in Action (Simulated)

For example, here's the kind of communication that's possible:

CRuby Server (localhost:2345)

```ruby
#server.rb
require "wands/web_socket_server"

server = Wands::WebSocketServer.open("localhost", 2345)
socket = server.accept
puts socket.gets  # => "Hello from the browser!"
socket.puts "Hello from CRuby!"
```

Browser Client (ruby.wasm)

```ruby
# client.rb
require "wands/web_socket"

socket = Wands::WebSocket.open('localhost', 2345)
socket.puts "Hello from the browser!"
puts socket.gets  # => "Hello from CRuby!"
```

Thus, WebSocket communication is possible between the browser and CRuby.Moreover, the code you write is ordinary TCPSocket-like.

## What's the benefit?

With Wands, you can run WebSocket code written in CRuby in the browser without any changes. For example, you can confirm that an algorithm works in CRuby or irb and then run it in the browser.

## Technical Challenges

Differences between CRuby and JavaScript WebSockets
The message receiving APIs in particular differ between synchronous and asynchronous approaches.

```ruby
# Ruby
puts socket.gets
```

```javascript
// JavaScript
ws.onmessage = function(event) {
  console.log(event.data);
};
```

Wands bridges this gap. It provides an API similar to Ruby's TCPSocket, which is familiar to Rubyists.

## Wands Architecture

How is this possible?

```
++=======================================++
||       Ruby TCPSocket like API         ||
++---------------------------------------++
||       WebSocket Implementaiton        ||
|| +-----------------------------------+ ||
|| | Ruby impl          | JS API impl  | ||
|| +---------------------------------- + ||
++=======================================++
|| Ruby TCPSocket class |   Browser      ||
++---------------------------------------++
||                 OS                    ||
++=======================================++
```

## Switching between CRuby and JavaScript

When running Wands in the browser, it depends on the JS gem. This allows us to switch WebSocket implementations based on whether the JS constant is defined or not. Specifically, we switch between CRuby and JavaScript using prepend.

```ruby
# We dynamically override methods by prepending a module when running in browser.
prepend JavaScript::WebSocket if defined? JS
```

##  Waiting for Asynchronous APIs

This is a very interesting aspect that's characteristic of Ruby in the browser. The JS gem in ruby.wasm has a feature called Promise Scheduler. This allows you to wait for a Promise to complete. If you can call Promise.resolve method from the callback function of an asynchronous API, you can wait for the asynchronous API to complete.

In a generalized form, it looks like this:

```ruby
def pop
  resolve = nil
  promise = JS.global[:Promise].new { resolve = it }
  @resolve = resolve
  promise.await # wait for promise
end

def push(message)
  @resolve.apply message # resolve promise
end
```

## Unit Testing

When writing a library for Ruby in the browser, one challenging aspect is how to run unit tests.
You can't run them using only CRuby.
On the other hand, launching a browser to execute tests is too cumbersome.

In Wands, I run tests for JavaScript environment features using Node.js's Node WASI.This mechanism was referenced from ruby.wasm's unti test code. After building the test execution environment myself, I was amazed that this mechanism was created during the ruby.wasm debut three years ago.

## What Wands Abstracts

Wands abstracts WebSocket communication in its implementation. Conceptually, it can also be said to abstract TCP sockets.

With Wands, you can run socket programming code written in CRuby in your browser, although you will need to replace the TCPSocket class.

Wands provides a new concept called **Socket programming in the browser**.

Since you can do socket programming in the browser, dRuby can definitely run there too. However, this is limited to the client side.

## Conclusion

By the way, the name Wands is derived from Web + And + Socket = WANDS.
but it also means "Magic Wand".

Imagine writing your usual TCPSocket code and just... running it in the browser. That’s the kind of _magic Wands_ enables.

I hope Wands inspires you to try socket programming in your browser with Ruby! Thank you!
