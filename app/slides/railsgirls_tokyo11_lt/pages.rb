class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "あすからどうする？")
end

def content
  [].tap do |children|
      children << p({className:"author"}, "youchan")
      children << p({className:"icon"}, p({class:""}, img({src:"#{Gibier.assets_path}/images/youchan.jpg"}, "")))
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "突然ですが質問です。")
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "今日は楽しかったですか？")
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "アンケートをします。")
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def header
  h2(nil, "今後のプログラミングとの係りについて")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "将来はエンジニアになりたい！"),
                    li(nil, "エンジニアになりたいとうほどじゃないけど仕事に何らかの形で生かせたい。"),
                    li(nil, "仕事とは関係なく自分のWebサービスを作りたい。"),
                    li(nil, "自分のWebサービスでなくても何らかの形でプログラミングに関わりたい。"),
                    li(nil, "特に考えていない"),
                    li(nil, "RailsGirlsはあくまで体験、これっきりでよい"),
                    li(nil, "その他")
      )
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "将来はエンジニアになりたい！")
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "エンジニアになりたいとうほどじゃないけど仕事に何らかの形で生かせたい。")
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "仕事とは関係なく自分のWebサービスを作りたい。")
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "自分のWebサービスでなくても何らかの形でプログラミングに関わりたい。")
  end
end
end

class Gibier::Page9 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "特に考えていない")
  end
end
end

class Gibier::Page10 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "RailsGirlsはあくまで体験、これっきりでよい")
  end
end
end

class Gibier::Page11 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "その他")
  end
end
end

class Gibier::Page12 < Gibier::PageBase
def header
  h2(nil, "自己紹介")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "よう(@youchan)"),
                  li(nil, "趣味でプログラムを書いています。"),
                  ul(nil,
                    li(nil, "プログラミング歴35年くらい？")
      ),
                  li(nil, "仕事でもプログラムを書いています。"),
                  ul(nil,
                    li(nil, "18年くらい？")
      )
      )
  end
end
end

class Gibier::Page13 < Gibier::PageBase
def header
  h2(nil, "趣味でプログラムを書くということ")
end

def content
  [].tap do |children|
      children << ul(nil,
                  li(nil, "何の役に立つの？"),
                  ul(nil,
                    li(nil, "楽しいから"),
                    li(nil, "趣味が仕事になる(という側面もある)")
      ),
                  li(nil, "何が楽しい？"),
                  ul(nil,
                    li(nil, "ものづくり全般好き")
      )
      )
  end
end
end

class Gibier::Page14 < Gibier::PageBase
def header
  h2(nil, "ものづくり")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "編み物、刺繍、手芸全般"),
                    li(nil, "料理、DIY"),
                    li(nil, "文学、まんが"),
                    li(nil, "音楽、作曲")
      )
  end
end
end

class Gibier::Page15 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "プログラミングにはどれにも共通する面白さがある")
  end
end
end

class Gibier::Page16 < Gibier::PageBase
def header
  h2(nil, "趣味のプログラミング")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Webサービスとかプロダクトを作って他人に使ってもらう"),
                    li(nil, "OSS開発に参加して、世界中のプログラマと一緒に世界を良くしていく"),
                    li(nil, "競技プログラミングやプログラミングクイズに挑戦する"),
                    li(nil, "ひたすらプログラミングを学ぶ楽しさを追求する")
      )
  end
end
end

class Gibier::Page17 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"portlait"}, img({src:"#{Gibier.assets_path}/images/imitation_game.jpg"}, "")))
  end
end
end

class Gibier::Page18 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"hobby"}, "プログラミングって",strong(nil, "知的"),"で",strong(nil, "創造的"),"な",strong(nil, "楽しい"),"趣味")
  end
end
end

class Gibier::Page19 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "何から始める？")
  end
end
end

class Gibier::Page20 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"portlait"}, img({src:"#{Gibier.assets_path}/images/mwr.jpg"}, "")))
  end
end
end

class Gibier::Page21 < Gibier::PageBase
def header
  h2(nil, "タートルグラフィックス")
end

def content
  [].tap do |children|
      children << p({className:"centering"}, "")
      children << p(nil, p({class:"w30"}, img({src:"#{Gibier.assets_path}/images/koch.gif"}, "")))
      children << p(nil, "フラクタル図形")
  end
end
end

class Gibier::Page22 < Gibier::PageBase
def header
  h2(nil, "技術書典6")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"middle"}, img({src:"#{Gibier.assets_path}/images/techbook.png"}, "")))
      children << p(nil, "4/14 池袋サンシャインシティ2F 展示ホール")
  end
end
end

class Gibier::Page23 < Gibier::PageBase
def header
  h2(nil, "OSS開発")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/oss-gate.png"}, "")))
  end
end
end

Gibier.page_count = 24
Gibier.title = "あすからどうする？"
