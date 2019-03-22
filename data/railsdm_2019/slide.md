# OpalでつくるBrowserアプリケーション

%author: @youchan

%icon: ![](youchan.jpg)

---

%large: 覚えていますか？

---

%huge: 15年前

---

%large: それまではRubyはよくあるスクリプト言語の一つでした。

---

%large: Ruby on Rails が登場して

---

%large: RubyがWebで最もよく使われる言語(の一つ)になりました。

---

%large: ところが、近年は

---

%large: Web開発はフロントエンドが重要になってきました。

## who am i

* @youchan
* rubyist
* 株式会社レトリバ

## RubyKaigi

* <span {class:"yellow"}>「Writing web application in Ruby」(2015)</span>
* <span {class:"yellow"}>「Isomorphic web programming in Ruby」(2016)</span>
* <span {class:"yellow"}>「dRuby on Browser」(2017)</span>
* 「How to get the dark power from ISeq」(2018)
* <span {class:"yellow"}>「Ruby for NLP」(2019)</span>


## Rubyで出来ることを増やす活動

* Webのフロントエンド
* 
* 機械学習(深層学習)
* 自然言語処理

![opal](opal.png)

![rubykaigi](rubykaigi.png)

<!--
---

%large: なぜ？

---

%huge: Rubyが好きだから！

![heart](heart.png)

-->

## Opalでブラウザで動く将棋をつくる

* ユーザー管理などある程度の複雑さをもつWebアプリケーション
* ブラウザアプリケーションとしてUIが重要
* リアルタイムでの相互通信

## これらを実現するための機能

* Isomorphic Programming
* Vitual DOM
* dRubyのブラウザ実装(WebSocket)

## アジェンダ

* Opalってなに？
* Opalプロジェクトの作成
* Virutal DOM
* Isomorphic Programming
* dRuby on Browser(How to use WebSocket)
* デモ

## アジェンダ

* <span {class:"yellow"}>Opalってなに？</span>
* <span {class:"pink"}>Opalプロジェクトの作成</span>
* <span {class:"pink"}>Virutal DOM</span>
* <span {class:"pink"}>Isomorphic Programming</span>
* <span {class:"pink"}>dRuby on Browser(How to use WebSocket)</span>
* <span {class:"pink"}>デモ</span>

## Opalってなに？

![full](whats_opal.png)

## アジェンダ

* <span {class:"pink"}>Opalってなに？</span>
* <span {class:"yellow"}>Opalプロジェクトの作成</span>
* <span {class:"pink"}>Virutal DOM</span>
* <span {class:"pink"}>Isomorphic Programming</span>
* <span {class:"pink"}>dRuby on Browser(How to use WebSocket)</span>
* <span {class:"pink"}>デモ</span>

## CLI tool

```
$ gem install silica
$ silica new sample-app
```

Silica: https://github.com/youchan/silica

## アジェンダ

* <span {class:"pink"}>Opalってなに？</span>
* <span {class:"pink"}>Opalプロジェクトの作成</span>
* <span {class:"yellow"}>Virutal DOM</span>
* <span {class:"pink"}>Isomorphic Programming</span>
* <span {class:"pink"}>dRuby on Browser(How to use WebSocket)</span>
* <span {class:"pink"}>デモ</span>

## Virtual DOM

* フロントエンドで欠かせない存在
    - ex. React, Vue.js
* Virutal DOMをRubyで実装
    - Hyalite: https://github.com/youchan/hyalite

## Example

```ruby
class AppView
  include Hyalite::Component

  def render
    h2(nil, "Hi, #{@props[:name]}")
  end
end
Hyalite.render(Hyalite.create_element(AppView, {name: "John"}), $document['.content'])
```

## アジェンダ

* <span {class:"pink"}>Opalってなに？</span>
* <span {class:"pink"}>Opalプロジェクトの作成</span>
* <span {class:"pink"}>Virutal DOM</span>
* <span {class:"yellow"}>Isomorphic Programming</span>
* <span {class:"pink"}>dRuby on browser(How to use WebSocket)</span>
* <span {class:"pink"}>デモ</span>

## Isomorphic programming

一般的にIsomorphic programmingを採用する理由は2つある

* <span {class:"yellow"}>サーバーサイドレンダリング</span>
    - 初期表示のパフォーマンスを向上
    - SEOなど有利
* <span {class:"yellow"}>モデル定義の共有</span>
    * オブジェクトの透過的なアクセス

## オブジェクトの透過的なアクセス

![full](isomorphic.png)

## Menilite

* Isomorphic Programming フレームワーク
* モデルの定義をクライアント - サーバーで共有
* オブジェクトの透過的なアクセス
* APIをコードを書かなくてもよい

Menilite: https://github.com/youchan/menilite

## モデルの定義

```ruby
class User < Menilite::Model
  field :name
  field :password

  action :signup, on_create: true do |password|
    self.password =  BCrypt::Password.create(password)
    self.save
  end

  if_server do
    def auth(password)
      BCrypt::Password.new(self.password) == password
    end
  end
end
```

## コントローラー

```ruby
class ApplicationController < Menilite::Controller
  action :login do |username, password|
    user = User.find(name: username)
    if user && user.auth(password)
      session[:user_id] = user.id
    else
      raise 'auth error'
    end
  end
end

# Client code
ApplicationController.login("user1", "topsecret") do |user|
  # ...
end
```

## アジェンダ

* <span {class:"pink"}>Opalってなに？</span>
* <span {class:"pink"}>Opalプロジェクトの作成</span>
* <span {class:"pink"}>Virutal DOM</span>
* <span {class:"pink"}>Isomorphic Programming</span>
* <span {class:"yellow"}>dRuby on Browser(How to use WebSocket)</span>
* <span {class:"pink"}>デモ</span>

## dRuby

* Rubyの分散オブジェクトシステム
* [標準ライブラリ](https://docs.ruby-lang.org/en/2.5.0/DRb.html)
* IDLなどのインタフェースの記述が不要(Duck typing! 🦆)

## dRubyの使いかた

```ruby
# server-side
requrie "drb"
obj = []
DRb.start_service("druby://localhost:1234", obj)

# client-side
require "drb"
client_obj = DRbObject.new_with_uri("druby://localhost:1234")
```

## `DRb::DRbProtocol`

* dRubyにプロトコルを追加することができる
* `druby:`というプロトコルはTCP socket
* もちろんWebSocketを追加することもできる

## ブラウザでdRuby!

* WebSocketプロトコルの実装
    - drb-websocket: https://github.com/youchan/drb-websocket
* OpalにdRubyを実装
    - opal-drb: https://github.com/youchan/opal-drb

## アジェンダ

* <span {class:"pink"}>Opalってなに？</span>
* <span {class:"pink"}>Opalプロジェクトの作成</span>
* <span {class:"pink"}>Virutal DOM</span>
* <span {class:"pink"}>Isomorphic Programming</span>
* <span {class:"pink"}>dRuby on Browser(How to use WebSocket)</span>
* <span {class:"yellow"}>デモ</span>


## まとめ

* OpalでRubyでもVirtual DOM, Isomorphic programming, WebSocketといったモダンなブラウザアプリケーションの開発が可能になりました。
* OpalはWeb開発を変える力を持っています。
* みなさん使ってみませんか？

