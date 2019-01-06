# 構文解析

%author: youchan

%icon: ![](youchan.jpg)

%duration: 1min

---

%huge: 6章 構文解析ツール

## Stanford Parser

* PCFGによる句構造解析
* Shift-Reduce法による句構造解析
* 深層学習を応用した依存構造解析
* 多言語(英語、中国語、ドイツ語、アラビア語)

## Berkeley Parser

* PCFGによる句構造解析
* 多言語(英語、ドイツ語、中国語)
* Penn Treebankで約90%

## BLLIP Parser

* 句構造解析
* 識別モデルにほるリランキング
* 最も制度の高い句構造解析器(Penn Treebankで92.1%)

## ZPar

* 単語区切り、品詞タグ付け、句構造解析、依存構造解析
* シフト・還元型アルゴリズム

## SyntaxNet

* 依存構造解析
* Shift-Reduce法にもとづいた遷移型解析アルゴリズム
* フィードフォワード型ニューラルネットワークによる解析アクションの選択モデル

## Mate

* Shift-Reduce法による依存構造解析
* 多言語(英語、ドイツ語、中国語)
* 品詞タグ付け、意味役割付与

## TurboParser

* 交差を許す依存構造解析
* 交差を許す依存構造解析器としては高速で精度が高い

##  MaltParser

* 依存構造解析
* Shift-Reduce法などの遷移型アルゴリズム
* 多言語(英語、フランス語、スウェーデン語)

## MSTParser

* 依存構造解析
* Eisner法およびMST法

## C&C Parser

* CCGによる構文解析
* Supertagging
* CCG導出木と述語項構造を出力
* CCG導出木からDRSや一階述語論理式を計算

## EasyCCG

* CCGによる構文解析
* Supertagging + A\*探索

## OpenCCG

* CCGによる構文解析

## Enju

* HPSGによる構文解析
* HPSGを簡略化した句構造、述語項構造を出力
* Supertagging、CFG、Approximation

## KNP

* 日本語の構文解析
* 文節間の係り受け、格関係、照応関係、固有表現解析
* 形態素解析にはJUMANを使う

## CaboCha

* 日本語の係り受け解析
* 固有表現解析
* 形態素解析にはMeCabを使う

## KyTea

* 日本語の単語分割、読み推定、品詞推定
* 部分的にアノテーションされたデータからモデルの学習を行なえる
* 中国語

## Jigg

* Stanford CoreNLPを参考にた自然言語処理ツールのパッケージ

---

%huge: 8章 ツリーバンク
