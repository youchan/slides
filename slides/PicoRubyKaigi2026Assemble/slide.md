# PicoRubyで作るPicoRuby開発環境{#cover}

%author: youchan
![icon](images/youchan_square.jpeg)

## About Me

- youchan
- ANDPAD Inc.
  - PicoRubyKaigi 2026 Assembly suponsor
- Author of [Gibier2](https://github.com/youchan/gibier2)
- Member of
  - Asakusa.rb
  - PicoPicoRuby

# PicoRubyKaigi 2026 Assembly  🎉

# みんなー！</br>PicoRuby(FemtoRuby)をビルドしてるかーい？

## ビルドしたことあるひと～ :raise_hand:

## なぜビルドが必要なのか？

みなさんマイコンの開発したことあります？
Rubyだけでマイコンの開発をできるのがPicoRubyのよさ
でも世の中そんなに甘くはないのだよ
誰かが用意してくれたエコシステムに乗るのはよいこと
でも、いろいろなものが繋がるのがマイコンの醍醐味でもある
PicoRubyのコミュニティがさまざまなmrbgemsを開発していて、今すぐ使えるデバイスも沢山あります。
でも世の中には沢山のデバイスが転がっている(デバイスが沢山ある写真や図を参照)
インタフェースによってRubyだけで使えるものもあるけど、C言語で開発する必要がある場合もあります。
また、タイミングのシビアなデバイスの場合はC言語でドライバを書く必要があることもあります。
そしてそれがマイコンの醍醐味でもあります。

PicoRubyではmrbgemsがC言語との橋渡し
ちょうどCRubyにおけるC-extensionのようなもの
でも、CRubyと違うのはPicoRubyではC言語での開発が必要になるケースがよくあるということ

(例として学習リモコンがいい)

そして、mrbgemsをC言語で開発するにはビルドが必要なのだよ

## でもビルドは結構面倒

まず、ボードによってビルド環境が異なる Raspberry-PI pico/ESP-32
gccやMakeなどの言語処理系、ビルドエコシステムのインストールが必要
ボード毎のライブラリや開発環境が必要(ESP-32の場合、espressif)
それらのバージョン違いなどでビルドが失敗することもよくある

## PicoRubyの開発のマナーも覚える必要があるよ！

じゃあ、mrbgemsどうやって開発するの？
(実演)

知ってしまえば簡単なんだけど、初心者にはやさしくないね

## これまでのPicoRubyのエコシステム

- PicoRuby ESP-32 Installer
- WebTerminal
- Installer for raspberry-pi
- debugger (now!)

## PicoRIDE

**PicoR**uby **I**ntegrated **D**evelopment **E**nvironment

## PicoRIDEにできること

- PicoRubyプロジェクトの管理
  - PicoRubyプロジェクトとしてフォーマット化されている
- PicoRubyのビルド
- PicoRubyのデバイスへのインストール(ESP-32)
  - RaspPI picoはイメージの作成

## Demo

## 後半はfunicularについて

後半はfunicularについて話すよ。というかPicoRIDEがfunicularでどう実装されているかという話

## funicular

まずはfunicularについて話すよ
funicularというのはWeb Frameworkなんだけど、PicoRuby.wasmで動くように出来ている

つまり、PicoRIDEはPicoRubyで作られているのです！

## 自分の開発スタイル

当然、AIエージェント(Claude code)を利用して開発していて正直PicoRIDEもAIに書かせたものなのでfunicularについて語れる立場ではない。
でも、AIエージェントで開発しても人間が読み書きできる、メンテナンスできる状態は維持したいと思っていて、
AIが開発したものに目を通しているし、リファクタなどを適宜行なっているのでその中で得た知見を披露したい。

## AIに対する自分のスタンス(ちょっと脱線)

AIがいついなくなるかは分からない
例えば、AIが人類を滅ぼすと言われています。人類を滅ぼすとまで言わなくてもAIに対して強い規制が入る可能性もないとは言えない。AIの将来とはそれくらい未知数だということ
これは持論だけど、AIのコストはどんどん上がっていくだろうと思う。どんどんトークンを消費して開発できるのは今がピークかもしれない。なぜなら、AIプラットフォームはエネルギーを奪い合っていて、AIがなくても深刻なエネルギー問題がさらに深刻化するのは目に見えている
いま安く使えているのもAIの普及のためのディスカウントが働いているからというのもある
(これは現在のトランスフォーマー/GPTに対する見解。GPTが量が質を凌駕したからこその現在のLLMなのでその方式から脱却すれば状況は変わるだろう)

