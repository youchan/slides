# gibier2

A slide tool inspired [Rabbit](https://rabbit-shocker.org/en/usage/rabbit-slide.html).

This is a slide app using ruby.wasm.

## Setup

    $ git clone https://github.com/youchan/gibier2
    $ cd gibier2
    $ bundle install

Build ruby.wasm including necessary gems.

    $ bundle exec rbwasm build -o dist/ruby.wasm

Pack gibier2 source code into ruby.wasm

    $ bundle exec rbwasm pack dist/ruby.wasm --dir ./src::/src -o dist/app.wasm

Setup server-side

    $ cd server
    $ bundle install

## How to run

Run gibier server

    $ bundle exec rackup

Open http://localhost:9161 then you can see the sample slide.

