# Rubyでプログラミングの楽しさを知ろう！

%author: youchan

![icon](youchan.jpg)

%duration: 25

---

%large: 突然ですがアンケート✋

---

%large: Ruby書いていますか？

---

%large: Rubyが第１言語だという人？

%center: (プログラミング言語としてですよ！)

---

%large: Rails Girlsにガールズとして参加したことのある人？

---

%large: 千葉県にお住まいのかた？

## ご協力ありがとうございました。

%center: ![ojigi](ojigi.png)

## 自己紹介

* よう(@youchan)
* Rubyist
* ちば在住
* 株式会社レトリバ

## 最近の活動

* Rubyで機械学習や自然言語処理をできるようにする活動
* 仲間を増やす活動

## Rubyで出来ることを増やしたい！

* **Opal**: Ruby→JavaScriptコンパイラ
    - ブラウザ上でRubyが使える
* 自然言語処理

## Opalの活動

![portlait-right](pragmatic_opal.jpg)

%left:

* Opalで動く各種フレームワーク(Isomorphic Programmingなど)
* RubyKaigi 2015～2017
* 「Pragmatic Opal」(インプレスR&D)

## 自然言語処理

![portlait-right](neko.jpg)

%left:

* RedChainer(深層学習フレームワーク)の自然言語処理
* 「猫と森羅と日本語とRuby」(同人)
* RubyKaigi2019

## 仲間を増やす活動

![portlait-right](mwr.png)

%left:

* Rails Girls
* OSS Gate
* 「まんがでわかるRuby」(同人、技術書典6)
* いまここ！

---

%large: Rubyでプログラミングの楽しさを知ろう！

## Rubyのすきなところ

* 言語としての側面
* コミュニティとしての側面

---

%large: スペインではクリスマスに「ポルボロン」3回唱えると幸せがやってくるというおまじないがあるそうです。

%center: ![w10](polvoron.jpg)

## 「ポルボロン」と3回唱えてみる

```ruby
3.times do
  puts "ポルボロン"
end
```

## Rubyのすきなところ(言語としての側面)

* みんなオブジェクト
* ブロックはとてもよい割り切り

---

%large: みんなオブジェクト

## みんなオブジェクト

* 数値や範囲だってオブジェクト
* クラスだってオブジェクト

## 数値や範囲だってオブジェクト

```ruby
3.times do ... end
```

```ruby
(1..3).each do ... end
```

## クラスもオジェクト

```ruby
Integer.define_method(:degree) do
  self * Math::PI / 180
end
```

## オープンクラス

```ruby
class Integer
  def degree
    self * Math::PI / 180
  end
end
```

## オープンクラスを使った例

* `Prime`
* `ActiveSupport`

## `Prime`

```ruby
require "prime"

(2**31 - 1).prime?

277945762500.prime_division
```

## `ActiveSupport`

`ActiveSupport`このようなオープンクラスによる拡張の集大成

そのなかでもわたしのすきなやつ

```ruby
require "active_support/time"

Date.today + 47.day
```

---

%large: `time`も`day`も名詞(単位)

---

%large: 誰ですか？メソッドの名前は動詞(もしくは命令形)で書けなんて言ったのは？

(念のため言っておくと、あくまで原則は動詞で書けですからね！)

---

%huge: 圧倒的な自由！


## Rubyのすきなところ(言語的な側面)

* <span {class: "gray"}>みんなオブジェクト</span>
* ブロックはとてもよい割り切り

## 関数型言語

%large: 関数が第一級オブジェクトである

## 関数が第一級オブジェクト

%large: 関数の引数に関数を渡すことができる

## JavaScriptで書くなら

```javascript
array.reduce(function(acc, i) {
  return acc + i;
});
```

`function(acc, i)`は`(acc, i) =>`に置き換えてもよい

## Rubyならブロックをつかう

```ruby
array.reduce do |acc, i|
  acc + i
end
```

## ブロックと関数型の違い

* ブロックは引数の最後に1つだけ置くことができる
* ブロックの正体は`Proc`というクラスのオブジェクト

---

%large: 自由より書きやすさ読みやすさが優先される(？)

---

%large: ユースケースを想定して書きやすい/読みやすい方法を選べる

## TMTOWTDI

* There's More Than One Way To Do It

```ruby
array.reduce do |acc, i|
  acc + i
end

array.reduce(&:+)

array.sum
```
---

%huge: 圧倒的な自由！


## 他にも語り切れないほどたくさんの好きがある

* オープンクラスだけじゃないメタプログラミングの機能
* `Enumerable`などブロックについてももっと…
* RubyGemsやBundlerなどのエコシステム
* etc…

---

%large: 自由には責任が伴なう

---

%large: 大人の振舞いが求められる

## Rubyのすきなところ

* <span {class: "gray"}>言語としての側面</span>
* コミュニティとしての側面

## Rubyのコミュニティ

* 地域Rubyコミュニティ
  * Asakusa.rb
* Rails Girls
* RubyKaigi
  * 4/18 - 4/20 RubyKaigi2019
* こういうイベント

## 日本のRubyコミュニティの特徴

* Rubyが日本で作られているのでRubyを作っている人たち(コミッター)がいる
* コミッター以外にも技術的に尊敬できる人がたくさん
* Rubyが作られた頃からあるので歴史が長い
* 成熟している(印象)

## RubyKaigi

![middle](committers.jpg)

## 技術コミュニティのホモソーシャル性

![middle](homosocial.png)

## こういう状況ありますよね

![middle](homosocial2.png)

## もちろん女性だけでも起りうる

![middle](homosocial_girls.png)

## どうやって乗り越えるか？

* 気遣い・配慮という大人力
* 女性を増やす

---

%large: このようなイベントを開催してくれて圧倒的感謝！

## Rubyのコミュニティはどうか？

%large: 大人力によってこのようなことが少ないように感じる

---

%huge: 何故？

## Ruby自体が日本で作られているから

**昔からコミュニティ活動が盛ん**

* RubyKaigi2019 => 13回目
* Asakusa.rb => 去年で10周年
* Ruby => 26歳になりました

## まとめ

**私のRubyの好きなところ**

* みんなオブジェクト
* ブロックはとてもよい割り切り
* (ほんとはもっといっぱいいっぱいあるよ)
* 成熟したコミュニティ

