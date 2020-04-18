# Vivliostyle Pub Progress

## 自己紹介

* 大崎 瑶(よう)
* @youchan
* Rubyist
* 趣味で技術同人誌を書いています。
* Vivliostyle Pubのバックエンド担当

## 著書(同人)

* 「Pragmatic Opal」
* 「iSeq 探訪」
* 「猫と森羅と日本語とRuby」
* 「マンガでわかるRuby」

## 「Pragmatic Opal」

![portlait-right](pragmatic-opal.jpg)

%left:

* はじめて書いた技術同人誌
* 日本初(おそらく世界でも)で唯一のOpalの本
* 商業誌化(インプレスR&D)
* Re:VIEWで執筆、組版

## Re:VIEW(LaTeX組版)からCSS組版へ

![portlait-right](css-book.jpg)

%left:

* はるさめさん(@spring\_rainnig)の本でCSS組版を知る

## 「猫と森羅と日本語とRuby」

![portlait-right](neko.png)

%left:

* Rubyで自然言語処理
* 表紙・イラストは湊川あいさん
* はじめてVivliostyleで組版に挑戦

---

![center](conversation.png)

## 「マンガでわかるRuby」

* 湊川あいさんと共著
* マンガと技術解説のハイブリッド

---

![center](manga-ruby.png)

---

%large: Vivliostyle Pub

## Viola

%small: はるさめさん(@spring\_rainnig)作のオンラインエディタ

![center](viola.png)

## Vivliostyle Pub 

* Violaのユーザー体験をもっと突き詰めたい
* Violaの課題であったコストの問題を解決したい
* Vivliostyleをもっと多くの人に使ってもらえるようなものになるようにユーザーフレンドリなサービスにしたい

## Vivliostyle Pubユーザー体験

* Markdownを書けるユーザーであればすぐに始められる
* HTMLやCSSを書ければカスタマイズができる
* プレビューの通りに印刷(PDFを生成)することができる

---

![w90](vivliostyle-pub.png)

## 開発方針

* サーバーレス
* GitHub連携

## サーバーレス

* サーバーの金銭的なコストを下げる
* サーバー運用の人的なコストをなくす

#### => 無理なく継続することのできるしくみ

## GitHub連携

* ユーザー認証をGitHubに委任
* ユーザーのドキュメントはGitHubのリポジトリに置く
    * ドキュメントはユーザーの管理下に

## サーバーレス

* Firebase
* Google Cloud Platform
    * Gooble Kubanetes Engine
    * Cloud Storage
* GitHub

## システム構成

![w90](system.png)

## デモ

* HTMLファイルの置いてあるGitHubリポジトリからPDFを出力します。
* Violaで生成したファイルでも作ってみましょう。

---

%huge: デモ

---

#### "Vivliostyle Pub" is in progress...

---

#### 一緒に開発してくれる人を募集しています。
