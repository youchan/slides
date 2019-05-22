class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "実践Opal")
end

def content
  [].tap do |children|
      children << p({className:"author"}, "youchan")
      children << p(nil, p({class:"icon"}, img({src:"#{Gibier.assets_path}/images/youchan.jpg"}, "")))
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "ちこくKaigiにちこくしました…")
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def header
  h2(nil, "誰？")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "大崎 瑶(よう)"),
                    li(nil, "youchan"),
                    li(nil, "千葉在住"),
                  li(nil, "RubyKaigi Speaker"),
                  ul(nil,
                    li(nil, "Ruby for NLP")
      ),
                    li(nil, "技術同人誌執筆")
      )
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def header
  h2(nil, "Kaigi Talks")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, strong(nil, "2019"),": Ruby for NLP"),
                    li(nil, strong(nil, "2018"),": How to get the dark power from ISeq")
      )
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def header
  h2(nil, "Kaigi Talks")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, strong(nil, "2015"),": Writing web application in Ruby"),
                    li(nil, strong(nil, "2016"),": Isomorphic web programming in Ruby"),
                    li(nil, strong(nil, "2017"),": dRuby on Browser")
      )
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def header
  h2(nil, "Rubyで出来ることを増やしたい！")
end

def content
  [].tap do |children|
      children << ul(nil,
                  li(nil, strong(nil, "Opal"),": Ruby→JavaScriptコンパイラ"),
                  ul(nil,
                    li(nil, "ブラウザ上でRubyが使える")
      ),
                  li(nil, strong(nil, "ISeq"),":"),
                  ul(nil,
                    li(nil, "VMハック")
      ),
                    li(nil, "自然言語処理")
      )
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def header
  h2(nil, "技術同人誌")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/techbookfes.jpg"}, "")))
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def header
  h2(nil, "Pragmatic Opal")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/pragmatic_opal.jpg"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "RubyKaigi 2015～2017 のまとめ"),
                    li(nil, "技術書典3(2017/10)"),
                    li(nil, "Opalで動く各種フレームワーク"),
                    li(nil, "インプレスR&Dから商業出版")
      )
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def header
  h2(nil, "ISeq探訪")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/iseq.jpg"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "RubyKaigi 2018"),
                    li(nil, "技術書典4(2018/4)"),
                    li(nil, "ISeqをハックしてISeq経由でプログラムを実行する")
      )
  end
end
end

class Gibier::Page9 < Gibier::PageBase
def header
  h2(nil, "猫と森羅と日本語とRuby")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/neko.jpg"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "RubyKaigi 2019"),
                    li(nil, "技術書典4(2018/10)"),
                    li(nil, "RedChainer(深層学習フレームワーク)の自然言語処理")
      )
  end
end
end

class Gibier::Page10 < Gibier::PageBase
def header
  h2(nil, "マンガでわかるRuby")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/mwr.jpg"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "技術書典4(2019/4)"),
                    li(nil, "湊川あい先生との共著"),
                    li(nil, "タートルグラフィックでRubyの入門")
      )
  end
end
end

class Gibier::Page11 < Gibier::PageBase
def header
  h2(nil, "マンガでわかるRuby の中身をチラ見せ！")
end

def content
  [].tap do |children|
      children << p(nil, a({href:"https://note.mu/llminatoll/n/n41313e119a35", target:"_brank"}, "https://note.mu/llminatoll/n/n41313e119a35"))
  end
end
end

class Gibier::Page12 < Gibier::PageBase
def header
  h2(nil, "BOOTHでダウンロード版出品中！")
end

def content
  [].tap do |children|
      children << p(nil, a({href:"https://llminatoll.booth.pm/items/1306534", target:"_brank"}, "https://llminatoll.booth.pm/items/1306534"))
  end
end
end

class Gibier::Page13 < Gibier::PageBase
def header
  h2(nil, "魔方陣投稿サイト")
end

def content
  [].tap do |children|
      children << p(nil, a({href:"http://kame-remocon.youchan.org", target:"_brank"}, "http://kame-remocon.youchan.org"))
  end
end
end

class Gibier::Page14 < Gibier::PageBase
def header
  h2(nil, "VirtualDOM Ruby implementation")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, "Hyalite"),": ",a({href:"https://github.com/youchan/hyalite", target:"_brank"}, "https://github.com/youchan/hyalite"))
  end
end
end

class Gibier::Page15 < Gibier::PageBase
def header
  h2(nil, "Isomorphic Programming framework")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, "Menilite"),": ",a({href:"https://github.com/youchan/menilite", target:"_brank"}, "https://github.com/youchan/menilite"))
  end
end
end

class Gibier::Page16 < Gibier::PageBase
def header
  h2(nil, "dRuby implementation on Browser")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, "opal-drb"),": ",a({href:"https://github.com/youchan/opal-drb", target:"_brank"}, "https://github.com/youchan/opal-drb"))
      children << p(nil, strong(nil, "drb-websocket"),": ",a({href:"https://github.com/youchan/drb-websocket", target:"_brank"}, "https://github.com/youchan/drb-websocket"))
  end
end
end

class Gibier::Page17 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "「マンガでわかるRuby」")
      children << p({className:"large"}, "を買って魔方陣を投稿してね！")
  end
end
end

Gibier.page_count = 18
Gibier.title = "実践Opal"
