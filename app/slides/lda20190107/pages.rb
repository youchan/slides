class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "3章 学習アルゴリズム")
end

def content
  [].tap do |children|
      children << p({className:"author"}, "大崎 瑶")
      children << p({className:"icon"}, p({class:""}, img({src:"#{Gibier.assets_path}/images/youchan.jpg"}, "")))
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def header
  h2(nil, "LDAの学習アルゴリズム")
end

def content
  [].tap do |children|
      children << ul(nil,
                  li(nil, "変分ベイズ"),
                  ul(nil,
                    li(nil, "3.3以降")
      ),
                  li(nil, "周辺化ギブスサンプリング"),
                  ul(nil,
                    li(nil, "実装が容易")
      )
      )
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "おさらい")
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def header
  h2(nil, "確率的生成モデル")
end

def content
  [].tap do |children|
      children << p(nil, "多項分布")
      children << p(nil, p({class:"fig"}, img({src:"#{Gibier.assets_path}/images/fig1.png"}, "")))
      children << p(nil, "Dirichlet分布")
      children << p(nil, p({class:"fig"}, img({src:"#{Gibier.assets_path}/images/fig2.png"}, "")))
      children << p(nil, "Dirichlet分布は多項分布の",strong(nil, "共役事前分布"),"である。")
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def header
  h2(nil, "共役事前分布")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"kakomi"}, img({src:"#{Gibier.assets_path}/images/fig3.png"}, "")))
      children << p(nil, "共役性を仮定すると、事前分布が与えられれば当該の分布が分る(？)")
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def header
  h2(nil, "確率的潜在変数モデル")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/fig4.png"}, "")))
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def header
  h2(nil, "グラフィカルモデル")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"fig"}, img({src:"#{Gibier.assets_path}/images/fig5.png"}, "")))
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def header
  h2(nil, "ベイズの定理")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"kakomi"}, img({src:"#{Gibier.assets_path}/images/fig6.png"}, "")))
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def header
  h2(nil, "LDA")
end

def content
  [].tap do |children|
      children << h4(nil, "書くの忘れてました。")
  end
end
end

class Gibier::Page9 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "統計的学習アルゴリズム")
  end
end
end

class Gibier::Page10 < Gibier::PageBase
def header
  h2(nil, "KL情報量(Kullback-Leibler divergence)")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"kakomi"}, img({src:"#{Gibier.assets_path}/images/fig7.png"}, "")))
  end
end
end

class Gibier::Page11 < Gibier::PageBase
def header
  h2(nil, "最尤推定")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"fig"}, img({src:"#{Gibier.assets_path}/images/fig8.png"}, "")))
  end
end
end

class Gibier::Page12 < Gibier::PageBase
def header
  h2(nil, "MAP推定")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"fig"}, img({src:"#{Gibier.assets_path}/images/fig9.png"}, "")))
  end
end
end

class Gibier::Page13 < Gibier::PageBase
def header
  h2(nil, "ベイズ推定")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"fig"}, img({src:"#{Gibier.assets_path}/images/fig10.png"}, "")))
  end
end
end

class Gibier::Page14 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "3.2 サンプリング近似法")
  end
end
end

class Gibier::Page15 < Gibier::PageBase
def header
  h2(nil, "3.2で扱うモデルと手法")
end

def content
  [].tap do |children|
      children << p(nil, "モデル")
      children << ul(nil,
                    li(nil, "確率的潜在変数モデル"),
                    li(nil, "LDA")
      )
      children << p(nil, "手法")
      children << ul(nil,
                    li(nil, "ギブスサンプリング"),
                    li(nil, "周辺化ギブスサンプリング")
      )
  end
end
end

class Gibier::Page16 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "ギブスサンプリング")
  end
end
end

class Gibier::Page17 < Gibier::PageBase
def header
  h2(nil, "ギブスサンプリングの導出の流れ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "事後分布"),
                    li(nil, "結合分布"),
                    li(nil, "ベイズの定理による展開"),
                    li(nil, "定数因子の除外")
      )
  end
end
end

class Gibier::Page18 < Gibier::PageBase
def header
  h2(nil, "ギブスサンプリングの導出")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/fig11.png"}, "")))
  end
end
end

class Gibier::Page19 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/fig12.png"}, "")))
  end
end
end

class Gibier::Page20 < Gibier::PageBase
def header
  h2(nil, "周辺化ギブスサンプリングの導出の流れ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "事後分布"),
                    li(nil, "結合分布"),
                    li(nil, "ベイズの定理による展開"),
                    li(nil, "定数因子の除外"),
                    li(nil, "周辺化の積分を陽に計算")
      )
  end
end
end

class Gibier::Page21 < Gibier::PageBase
def header
  h2(nil, "周辺化ギブスサンプリングの導出")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/fig13.png"}, "")))
  end
end
end

class Gibier::Page22 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/fig14.png"}, "")))
  end
end
end

class Gibier::Page23 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/fig15.png"}, "")))
  end
end
end

class Gibier::Page24 < Gibier::PageBase
def header
  h2(nil, "LDAのギブスサンプリング")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"fig"}, img({src:"#{Gibier.assets_path}/images/fig16.png"}, "")))
  end
end
end

class Gibier::Page25 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/fig17.png"}, "")))
  end
end
end

class Gibier::Page26 < Gibier::PageBase
def header
  h2(nil, "LDAの周辺化ギブスサンプリング")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/fig18.png"}, "")))
  end
end
end

class Gibier::Page27 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/fig19.png"}, "")))
  end
end
end

Gibier.page_count = 28
Gibier.title = "3章 学習アルゴリズム"
