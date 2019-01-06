class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "構文解析")
end

def content
  [].tap do |children|
      children << p({className:"author"}, "youchan")
      children << p({className:"icon"}, p({class:""}, img({src:"#{Gibier.assets_path}/images/youchan.jpg"}, "")))
      children << p({className:"duration"}, "1min")
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "6章 構文解析ツール")
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def header
  h2(nil, "Stanford Parser")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "PCFGによる句構造解析"),
                    li(nil, "Shift-Reduce法による句構造解析"),
                    li(nil, "深層学習を応用した依存構造解析"),
                    li(nil, "多言語(英語、中国語、ドイツ語、アラビア語)")
      )
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def header
  h2(nil, "Berkeley Parser")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "PCFGによる句構造解析"),
                    li(nil, "多言語(英語、ドイツ語、中国語)"),
                    li(nil, "Penn Treebankで約90%")
      )
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def header
  h2(nil, "BLLIP Parser")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "句構造解析"),
                    li(nil, "識別モデルにほるリランキング"),
                    li(nil, "最も制度の高い句構造解析器(Penn Treebankで92.1%)")
      )
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def header
  h2(nil, "ZPar")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "単語区切り、品詞タグ付け、句構造解析、依存構造解析"),
                    li(nil, "シフト・還元型アルゴリズム")
      )
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def header
  h2(nil, "SyntaxNet")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "依存構造解析"),
                    li(nil, "Shift-Reduce法にもとづいた遷移型解析アルゴリズム"),
                    li(nil, "フィードフォワード型ニューラルネットワークによる解析アクションの選択モデル")
      )
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def header
  h2(nil, "Mate")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Shift-Reduce法による依存構造解析"),
                    li(nil, "多言語(英語、ドイツ語、中国語)"),
                    li(nil, "品詞タグ付け、意味役割付与")
      )
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def header
  h2(nil, "TurboParser")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "交差を許す依存構造解析"),
                    li(nil, "交差を許す依存構造解析器としては高速で精度が高い")
      )
  end
end
end

class Gibier::Page9 < Gibier::PageBase
def header
  h2(nil, "MaltParser")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "依存構造解析"),
                    li(nil, "Shift-Reduce法などの遷移型アルゴリズム"),
                    li(nil, "多言語(英語、フランス語、スウェーデン語)")
      )
  end
end
end

class Gibier::Page10 < Gibier::PageBase
def header
  h2(nil, "MSTParser")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "依存構造解析"),
                    li(nil, "Eisner法およびMST法")
      )
  end
end
end

class Gibier::Page11 < Gibier::PageBase
def header
  h2(nil, "C&C Parser")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "CCGによる構文解析"),
                    li(nil, "Supertagging"),
                    li(nil, "CCG導出木と述語項構造を出力"),
                    li(nil, "CCG導出木からDRSや一階述語論理式を計算")
      )
  end
end
end

class Gibier::Page12 < Gibier::PageBase
def header
  h2(nil, "EasyCCG")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "CCGによる構文解析"),
                    li(nil, "Supertagging + A*探索")
      )
  end
end
end

class Gibier::Page13 < Gibier::PageBase
def header
  h2(nil, "OpenCCG")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "CCGによる構文解析")
      )
  end
end
end

class Gibier::Page14 < Gibier::PageBase
def header
  h2(nil, "Enju")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "HPSGによる構文解析"),
                    li(nil, "HPSGを簡略化した句構造、述語項構造を出力"),
                    li(nil, "Supertagging、CFG、Approximation")
      )
  end
end
end

class Gibier::Page15 < Gibier::PageBase
def header
  h2(nil, "KNP")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "日本語の構文解析"),
                    li(nil, "文節間の係り受け、格関係、照応関係、固有表現解析"),
                    li(nil, "形態素解析にはJUMANを使う")
      )
  end
end
end

class Gibier::Page16 < Gibier::PageBase
def header
  h2(nil, "CaboCha")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "日本語の係り受け解析"),
                    li(nil, "固有表現解析"),
                    li(nil, "形態素解析にはMeCabを使う")
      )
  end
end
end

class Gibier::Page17 < Gibier::PageBase
def header
  h2(nil, "KyTea")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "日本語の単語分割、読み推定、品詞推定"),
                    li(nil, "部分的にアノテーションされたデータからモデルの学習を行なえる"),
                    li(nil, "中国語")
      )
  end
end
end

class Gibier::Page18 < Gibier::PageBase
def header
  h2(nil, "Jigg")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Stanford CoreNLPを参考にた自然言語処理ツールのパッケージ")
      )
  end
end
end

class Gibier::Page19 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "8章 ツリーバンク")
  end
end
end

Gibier.page_count = 20
Gibier.title = "構文解析"
