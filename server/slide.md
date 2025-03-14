# ruby.wasmのはじめかた {#cover}

youchan

![youchan](images/youchan_square.jpeg)

## 今日のはなし

- ruby.wasmってなに？
- 超かんたんruby.wasmのはじめかた
- もっとruby.wasm

## Who am I

- youchan
- ANDPAD Inc.
- Author of [Gibier](https://github.com/youchan/gibier)
- RubyKaigi 2015～2017
  - Writing web application in Ruby (2015)
  - Isomorphic web programming in Ruby (2016)
  - dRuby on Browser (2017)

## RubyKaigi 2025 {#rubykaigi2025}

"dRuby on Browser Again!"

## ruby.wasmってなに？ {#whats_ruby_wasm}

![What's ruby.wasm](images/whats_ruby.wasm.png)

## wasmはブラウザで動く

![wasm VM](images/wasm_vm.png)

## CRubyのコンパイル

![compile ruby](images/compile_ruby.png)

## Rubyがブラウザで動く

![Ruby on Browser](images/ruby_on_browser.png)

## 超かんたんruby.wasmのはじめかた

```html
<html>
  <script src="https://cdn.jsdelivr.net/npm/@ruby/3.4-wasm-wasi@2.7.1/dist/browser.script.iife.js"></script>
  <script type="text/ruby">
    require "js"
    JS.global[:document].write "Hello, world!"
  </script>
</html>
```

## その他の方法

- [TryRuby](https://try.ruby-lang.org/playground/#code=puts+RUBY_DESCRIPTION&engine=cruby-3.3.0)
- [P5.rb](https://p5rb.ongaeshi.me/editor/?q=CYUwZgBAziAuCuAHAUBCBjATiAhrEAwjgHYBuOUAFAOwCMADADQQAs99AlKhPgB6wBlAJYAvEJQBMnbn1iUASgFUAQgE0A%2BgBEAogILyAkgAUAKgYDyAOWZMIDZtXZcQxYMiA)
- [irb.wasm](https://irb-wasm.vercel.app/)

## wasmtimeで実行する

https://github.com/ruby/ruby.wasm

```
$ gem install ruby_wasm
# Download a prebuilt Ruby release
$ curl -LO https://github.com/ruby/ruby.wasm/releases/latest/download/ruby-3.4-wasm32-unknown-wasip1-full.tar.gz
$ tar xfz ruby-3.4-wasm32-unknown-wasip1-full.tar.gz

# Extract ruby binary not to pack itself
$ mv ruby-3.4-wasm32-unknown-wasip1-full/usr/local/bin/ruby ruby.wasm

# Put your app code
$ mkdir src
$ echo "puts 'Hello'" > src/my_app.rb

# Pack the whole directory under /usr and your app dir
$ rbwasm pack ruby.wasm --dir ./src::/src --dir ./ruby-3.4-wasm32-unknown-wasip1-full/usr::/usr -o my-ruby-app.wasm

# Run the packed scripts
$ wasmtime my-ruby-app.wasm /src/my_app.rb
Hello
```

## prebuiltのruby.wasmをブラウザで実行する

```html
<html>
  <script type="module">
    import { DefaultRubyVM } from "https://cdn.jsdelivr.net/npm/@ruby/wasm-wasi@2.7.1/dist/browser/+esm";
    const response = await fetch("ruby.wasm");
    const module = await WebAssembly.compileStreaming(response);
    const { vm } = await DefaultRubyVM(module);

    vm.eval(`
      require "js"
      JS.global[:document].write "Hello, world!"
    `);
  </script>
</html>
```

## {#think}

![think](images/think.png)

## もっとruby.wasm
- スタンダードライブラリが使えない(cdnのもの)
- prebuiltのruby.wasmがブラウザで使えない
  - 自分で書いたソースファイルを添付(pack)できない
- gemを使えるとうれしい

## ruby.wasmのビルド

```
$ bundle init
$ bundle add ruby_wasm

# Build a ruby.wasm
$ bundle exec rbwasm build -o ruby.wasm
```

## wasmtimeで実行する

```
$ wasmtime ruby.wasm -e 'puts "Hello"'
Hello
```

## JS gemを追加する

```
$ bundle add js

# Re-build the ruby.wasm
$ bundle exec rbwasm build -o ruby.wasm
```

## ブラウザで実行できました！ {#tada}

![tada](images/tada.png)

## gemを追加してみる

```
$ bundle add redcarpet

# Re-build the ruby.wasm
$ bundle exec rbwasm build -o ruby.wasm
```

## まとめ

- ruby.wasmとは何か？を解説しました。
- 超かんたんな入門方法を紹介しました。
- wasmtimeでcli上でruby.wasmを実行したり、スクリプトファイルを同梱したり、好きなgemを組み込んだruby.wasmを作ったりして遊びました。

## {#lets_enjoy}
Let's enjoy ruby.wasm!
