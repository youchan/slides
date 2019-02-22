# 3章 学習アルゴリズム

%author: 大崎 瑶

%icon: ![](youchan.jpg)

## LDAの学習アルゴリズム

* 変分ベイズ
    - 3.3以降
* 周辺化ギブスサンプリング
    - 実装が容易

---

%large: おさらい

## 確率的生成モデル

多項分布

![fig](fig1.png)

Dirichlet分布

![fig](fig2.png)

Dirichlet分布は多項分布の**共役事前分布**である。

## 共役事前分布

![kakomi](fig3.png)

共役性を仮定すると、事前分布が与えられれば当該の分布が分る(？)

## 確率的潜在変数モデル

![large](fig4.png)

## グラフィカルモデル

![fig](fig5.png)

## ベイズの定理

![kakomi](fig6.png)

## LDA

#### 書くの忘れてました。

---

%large: 統計的学習アルゴリズム


## KL情報量(Kullback-Leibler divergence)

![kakomi](fig7.png)

## 最尤推定

![fig](fig8.png)

## MAP推定

![fig](fig9.png)

## ベイズ推定

![fig](fig10.png)

---

%large: 3.2 サンプリング近似法

## 3.2で扱うモデルと手法

モデル

* 確率的潜在変数モデル
* LDA

手法

* ギブスサンプリング
* 周辺化ギブスサンプリング

---

%large: ギブスサンプリング

## ギブスサンプリングの導出の流れ

* 事後分布
* 結合分布
* ベイズの定理による展開
* 定数因子の除外

## ギブスサンプリングの導出

![large](fig11.png)

---

![large](fig12.png)

## 周辺化ギブスサンプリングの導出の流れ

* 事後分布
* 結合分布
* ベイズの定理による展開
* 定数因子の除外
* 周辺化の積分を陽に計算

## 周辺化ギブスサンプリングの導出


![large](fig13.png)

---

![large](fig14.png)

---

![large](fig15.png)

## LDAのギブスサンプリング

![fig](fig16.png)

---

![large](fig17.png)

## LDAの周辺化ギブスサンプリング

![large](fig18.png)

---

![large](fig19.png)
