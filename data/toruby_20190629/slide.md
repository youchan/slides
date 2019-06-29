# ワンライナーで書く「Game of Life」

%author: youchan

![icon](youchan.jpg)

## Who am I

* youchan
* 株式会社レトリバ
* RubyKaigi(2015-2019)
* 技術書典(3～6)

## 「The Jonan Show」を知ってますか？

* RubyConf2017, RubyKaigi2018
* デカ外人(Jonan)によるリアルタイムキャスト
* Rubyistとペアプログラミングをして「Conway's Game of Life」を作る

## What's "Conway's Game of Life"

* 日本ではライフゲームと呼ばれている
* セルオートマトンと呼ばれるシミュレーションの一種
* <span {class:"red"}>1970年</span>にJohn Horton Conwayによって考案された

---

%large: 「Conway's Game of Life」のルール

---

2次元の格子状のフィールド上で展開される

![large](board.png)

---

各セルには生命が<span {class:"red"}>"生きている"</span>か<span {class:"red"}>"死んでいる"</span>かの2状態がある

![large](dead_live.png)

---

各セルは周囲の8つのセルの状態によって以下のルールに則って状態を変える

1. 周囲に生きているセルが1以下の場合はそのセルは死滅する
2. 周囲に生きているセルが2の場合はそのセルの状態は変わらない
3. 周囲に生きているセルが3の場合はそのセルに新しい生命が誕生する
4. 周囲に生きているセルが4以上の場合はそのセルは死滅する

---

![large](update_rule.png)

---

%huge: デモ

```
s=150;Array.new((s+2)*(s+2),0).tap{|g|4000.times{g[rand(1..s)*(s+2)+rand(1..s)]=1};100.times{s.times{|y|puts s.times.map{|x|g[x+s+3+y*(s+2)]==1??*:?.}.join};(s*s).times.map{|i|i+=i/s*2;[0,1,2,3,5,6,7,8].map{|c|g[i+c%3+c/3*2+c/3*s]}.sum.yield_self{|x|x==3?1:x==2?g[i+s+3]:0}}.tap{|n|(s*s).times{|i|g[i+s+3+i/s*2]=n[i]}};sleep(0.1);print"\e[#{s}A"}}
```

---

%large: いろいろなパターンがある

https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life

---

%huge: デジタル時計

https://copy.sh/life/

[digital watch](https://gist.githubusercontent.com/anonymous/9d7468755dd76a35d93beeb5c0a5bdcf/raw/3295717faf24e8911048bcb69d4b6c8505d24330/gistfile1.txt)

## ワンライナー

```ruby
s=30;Array.new((s+2)*(s+2),0).tap{|g|[100,133,163,164,165].each{|i|g[i]=1};100.times{s.times{|y|puts s.times.map{|x|g[x+s+3+y*(s+2)]==1??*:?.}.join};(s*s).times.map{|i|i+=i/s*2;[0,1,2,3,5,6,7,8].map{|c|g[i+c%3+c/3*2+c/3*s]}.sum.yield_self{|x|x==3?1:x==2?g[i+s+3]:0}}.tap{|n|(s*s).times{|i|g[i+s+3+i/s*2]=n[i]}};sleep(0.1);print"\e[#{s}A"}}
```

## s/;/^M/g

```ruby
s=30
Array.new((s+2)*(s+2),0).tap{|g|[100,133,163,164,165].each{|i|g[i]=1}
100.times{s.times{|y|puts s.times.map{|x|g[x+s+3+y*(s+2)]==1??*:?.}.join}
(s*s).times.map{|i|i+=i/s*2
[0,1,2,3,5,6,7,8].map{|c|g[i+c%3+c/3*2+c/3*s]}.sum.yield_self{|x|x==3?1:x==2?g[i+s+3]:0}}.tap{|n|(s*s).times{|i|g[i+s+3+i/s*2]=n[i]}}
sleep(0.1)
print"\e[#{s}A"}}
```

---

```ruby
s = 30
Array.new((s + 2) * (s + 2), 0).tap { |g|         # g: 盤面(?)
  [100, 133, 163, 164, 165].each{ |i| g[i] = 1 }  # グライダーを描く
  100.times {                                     # 100世代のループ
    s.times { |y|                                 # 行をスキャン
      puts s.times.map{ |x|                       # 行を表示
        g[x + s + 3 + y * (s + 2)] == 1 ? ?* : ?. # 謎のインデックスの計算
      }.join
    }
    (s * s).times.map { |i|                       # 盤面をスキャン
      i += i / s * 2                              # 謎の係数
      [0, 1, 2, 3, 5, 6, 7, 8].map{ |c|           # 周辺の8マス
        g[i + c % 3 + c / 3 * 2 + c / 3 * s]      # 謎のインデックスの計算
      }.sum.yield_self{ |x|                       # 合計
        x == 3 ? 1 : x == 2 ? g[i + s + 3] : 0    # 次の状態を決める
      }
    }.tap{ |n|                                    # n: 次の盤面
      (s*s).times{ |i|                            # 次の盤面をセット
        g[i + s + 3 + i / s * 2] = n[i]           # 謎のインデックスの計算
      }
    }
    sleep(0.1)
    print "\e[#{s}A"
  }
}
```

---

%large: 謎のインデックス計算？！

---

%large: 盤面？ `Array.new((s + 2) * (s + 2), 0)`

---

![w50](mergin.png)

---

![w30](convolution.png)


## コンボリューション演算

* Conway's Game of Lifeのように周辺のセルの状態から対象のセルの状態を計算するものを一般的コンボリューション演算といいます。
* 画像処理では一般的な手法でぼかし(平滑化)たり、エッジ抽出(鮮鋭化)したりするのによくつかいます。
* 深層学習を画像に適用するときにも、CNN(コンボリューションニューラルネットワーク)として応用されています。

---

![w50](mergin.png)

---

![w50](edge.png)

## 分岐の少ないプログラム

* CPUにとっては、演算よりも分岐のほうがコストが大きい

---

```ruby
    (s * s).times.map { |i|                       # 盤面をスキャン
      i += i / s * 2                              # 謎の係数
      [0, 1, 2, 3, 5, 6, 7, 8].map{ |c|           # 周辺の8マス
        g[i + c % 3 + c / 3 * 2 + c / 3 * s]      # 謎のインデックスの計算
      }.sum.yield_self{ |x|                       # 合計
        x == 3 ? 1 : x == 2 ? g[i + s + 3] : 0    # 次の状態を決める
      }
    }.tap{ |n|                                    # n: 次の盤面
    ...
    }
```

---

%large: 謎の係数 `i += i / s * 2`

## 1次元配列で2次元を表現

![large](matrix.png)

---

![large](calc_index1.png)

---

![large](calc_index2.png)

---

![large](calc_index3.png)

---

![large](calc_index4.png)

---

![large](calc_index5.png)

---

![large](calc_index6.png)

---

![large](calc_index7.png)

---

%large: まとめ


## The Jonan Showを見てやってみようと思った

* ワンライナーで書いたらどうかな
* 他のひととは違うやりかた

---

%huge: 好奇心

## こんな小さなプログラムのなかにもいくつもの工夫がある

* コンボリューション演算の援用
* インデックス計算の工夫

---

%huge: 創造性

## なによりも楽しむこと

* 仕事で役に立つプログラムではない
* 作ることの楽しさ

## プログラミングに大切なこと

%large: 好奇心と創造性と楽しむこと

---

%large: Happy Hacking!!!
