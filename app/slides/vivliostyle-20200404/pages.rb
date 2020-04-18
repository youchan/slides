class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "Vivliostyle Pub Progress")
end

def content
  [].tap do |children|
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def header
  h2(nil, "自己紹介")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "大崎 瑶(よう)"),
                    li(nil, "@youchan"),
                    li(nil, "Rubyist"),
                    li(nil, "趣味で技術同人誌を書いています。"),
                    li(nil, "Vivliostyle Pubのバックエンド担当")
      )
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def header
  h2(nil, "著書(同人)")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "「Pragmatic Opal」"),
                    li(nil, "「iSeq 探訪」"),
                    li(nil, "「猫と森羅と日本語とRuby」"),
                    li(nil, "「マンガでわかるRuby」")
      )
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def header
  h2(nil, "「Pragmatic Opal」")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/pragmatic-opal.jpg"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "はじめて書いた技術同人誌"),
                    li(nil, "日本初(おそらく世界でも)で唯一のOpalの本"),
                    li(nil, "商業誌化(インプレスR&D)"),
                    li(nil, "Re:VIEWで執筆、組版")
      )
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def header
  h2(nil, "Re:VIEW(LaTeX組版)からCSS組版へ")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/css-book.jpg"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "はるさめさん(@spring_rainnig)の本でCSS組版を知る")
      )
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def header
  h2(nil, "「猫と森羅と日本語とRuby」")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/neko.png"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "Rubyで自然言語処理"),
                    li(nil, "表紙・イラストは湊川あいさん"),
                    li(nil, "はじめてVivliostyleで組版に挑戦")
      )
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"center"}, img({src:"#{Gibier.assets_path}/images/conversation.png"}, "")))
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def header
  h2(nil, "「マンガでわかるRuby」")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "湊川あいさんと共著"),
                    li(nil, "マンガと技術解説のハイブリッド")
      )
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"center"}, img({src:"#{Gibier.assets_path}/images/manga-ruby.png"}, "")))
  end
end
end

class Gibier::Page9 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "Vivliostyle Pub")
  end
end
end

class Gibier::Page10 < Gibier::PageBase
def header
  h2(nil, "Viola")
end

def content
  [].tap do |children|
      children << p({className:"small"}, "はるさめさん(@spring_rainnig)作のオンラインエディタ")
      children << p(nil, p({class:"center"}, img({src:"#{Gibier.assets_path}/images/viola.png"}, "")))
  end
end
end

class Gibier::Page11 < Gibier::PageBase
def header
  h2(nil, "Vivliostyle Pub")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Violaのユーザー体験をもっと突き詰めたい"),
                    li(nil, "Violaの課題であったコストの問題を解決したい"),
                    li(nil, "Vivliostyleをもっと多くの人に使ってもらえるようなものになるようにユーザーフレンドリなサービスにしたい")
      )
  end
end
end

class Gibier::Page12 < Gibier::PageBase
def header
  h2(nil, "Vivliostyle Pubユーザー体験")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Markdownを書けるユーザーであればすぐに始められる"),
                    li(nil, "HTMLやCSSを書ければカスタマイズができる"),
                    li(nil, "プレビューの通りに印刷(PDFを生成)することができる")
      )
  end
end
end

class Gibier::Page13 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"w90"}, img({src:"#{Gibier.assets_path}/images/vivliostyle-pub.png"}, "")))
  end
end
end

class Gibier::Page14 < Gibier::PageBase
def header
  h2(nil, "開発方針")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "サーバーレス"),
                    li(nil, "GitHub連携")
      )
  end
end
end

class Gibier::Page15 < Gibier::PageBase
def header
  h2(nil, "サーバーレス")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "サーバーの金銭的なコストを下げる"),
                    li(nil, "サーバー運用の人的なコストをなくす")
      )
      children << h4(nil, "=> 無理なく継続することのできるしくみ")
  end
end
end

class Gibier::Page16 < Gibier::PageBase
def header
  h2(nil, "GitHub連携")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "ユーザー認証をGitHubに委任"),
                  li(nil, "ユーザーのドキュメントはGitHubのリポジトリに置く"),
                  ul(nil,
                    li(nil, "ドキュメントはユーザーの管理下に")
      )
      )
  end
end
end

class Gibier::Page17 < Gibier::PageBase
def header
  h2(nil, "サーバーレス")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Firebase"),
                  li(nil, "Google Cloud Platform"),
                  ul(nil,
                    li(nil, "Gooble Kubanetes Engine"),
                    li(nil, "Cloud Storage")
      ),
                    li(nil, "GitHub")
      )
  end
end
end

class Gibier::Page18 < Gibier::PageBase
def header
  h2(nil, "システム構成")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"w90"}, img({src:"#{Gibier.assets_path}/images/system.png"}, "")))
  end
end
end

class Gibier::Page19 < Gibier::PageBase
def header
  h2(nil, "デモ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "HTMLファイルの置いてあるGitHubリポジトリからPDFを出力します。"),
                    li(nil, "Violaで生成したファイルでも作ってみましょう。")
      )
  end
end
end

class Gibier::Page20 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "デモ")
  end
end
end

class Gibier::Page21 < Gibier::PageBase
def content
  [].tap do |children|
      children << h4(nil, "\"Vivliostyle Pub\" is in progress...")
  end
end
end

class Gibier::Page22 < Gibier::PageBase
def content
  [].tap do |children|
      children << h4(nil, "一緒に開発してくれる人を募集しています。")
  end
end
end

Gibier.page_count = 23
Gibier.title = "Vivliostyle Pub Progress"
