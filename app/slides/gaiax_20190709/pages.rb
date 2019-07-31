class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "OSS老害トーク 〜OSSとは何だったんだっけ？〜")
end

def content
  [].tap do |children|
      children << p({className:"author"}, "youchan")
      children << p(nil, p({class:"icon"}, img({src:"#{Gibier.assets_path}/images/youchan.jpg"}, "")))
      children << p({className:"duration"}, "5min")
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
                    li(nil, "大崎 瑶(@youchan)"),
                    li(nil, "株式会社レトリバ"),
                    li(nil, "Rubyist")
      )
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def header
  h2(nil, "開発しているOSS")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "gibier(このスライドを作っているもの)"),
                  li(nil, "Opal(RubyのコードをJavaScriptに変換するやつ)関連"),
                  ul(nil,
                    li(nil, strong(nil, "hyalite"),": Virtual DOM"),
                    li(nil, strong(nil, "menilite"),": Isomorphic Programming"),
                    li(nil, strong(nil, "drb-websocket,opal-drb"),": dRuby(Rubyの分散オブジェクト)のブラウザ実装")
      )
      )
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def header
  h2(nil, "OSSに対する立ち位置")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "趣味で自分のつくりたいものを作ってソースコードを公開する。"),
                    li(nil, "自分のつくりたいものを作る上で使う他のオープンソースのコードをたまに直したりする。"),
                    li(nil, "会社で開発するコードも上記のようなことをもうちょっとしたい")
      )
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def header
  h2(nil, "ソフトウェア開発歴")
end

def content
  [].tap do |children|
      children << ul(nil,
                  li(nil, "37年くらい？(小4から)"),
                  ul(nil,
                    li(nil, "PC-6001")
      ),
                    li(nil, "実用的なコードを書きはじめたのが94年くらいから")
      )
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, "ソフトウェアエンジニアとしてもOSS開発者としても、特に語ることを持たないごく一般的な開発者ですが、
無駄に長いキャリアを元手に老害トークを披露したいと思います。")
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def header
  h2(nil, "オープンソースソフトウェアの始まり（？）")
end

def content
  [].tap do |children|
      children << ul(nil,
                  li(nil, "1998年2月にOpen Source Initiative 設立"),
                  ul(nil,
                    li(nil, "The Open Source Definition(OSD)")
      )
      )
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def header
  h2(nil, "OSI以前のオープンソース")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "1983年9月 GNU project"),
                    li(nil, "1984年10月 Free Softwear Foundation"),
                    li(nil, "それ以前からもソースコードを公開して多くの人々に利用してもらうという文化は続いていた…")
      )
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def header
  h2(nil, "インターネットのはじまり")
end

def content
  [].tap do |children|
  end
end
end

class Gibier::Page9 < Gibier::PageBase
def header
  h2(nil, "Unixのはじまり")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "1969年 Ken ThompsonがPDP-7の上にUnixの原形を創る(Space Travelというゲームを動かすために開発された)"),
                    li(nil, "1972年 Dennis RitchieによってC言語が創られる"),
                    li(nil, "1975年 Version 6 (Lions' Commentary on UNIX 6th Edition, with Source Code)"),
                    li(nil, "1978年3月 Bill Joyによって1BDSがリリース(Version 6 Unixのアドオン)")
      )
      children << p(nil, p({class:"pdp"}, img({src:"#{Gibier.assets_path}/images/PDP-7.jpg"}, "")))
      children << p(nil, p({class:"pdp"}, img({src:"#{Gibier.assets_path}/images/PDP-11.jpg"}, "")))
  end
end
end

class Gibier::Page10 < Gibier::PageBase
def header
  h2(nil, "Unixの文化とオープンソース")
end

def content
  [].tap do |children|
      children << p(nil, "1956年の独占禁止法違反の訴訟での和解判決合意により、ベル研究所の親会社であったAT&Tはコンピュータ産業への進出を禁止されており、電話技術以外のあらゆる研究成果を希望者にライセンス供与することを義務づけられていた。このため、AT&TはUNIXを商用販売することができず、メディア代と送料だけで出荷することになった。")
      children << ul(nil,
                    li(nil, "自然とソースコードを共有する文化が醸成され、BSDなどアカデミックな場所で育った")
      )
  end
end
end

class Gibier::Page11 < Gibier::PageBase
def header
  h2(nil, "GNUまたFSF")
end

def content
  [].tap do |children|
      children << ul(nil,
                  li(nil, "1983年9月 MITでRichard StallmanがGNU project発表する"),
                  ul(nil,
                    li(nil, "GNU Manifest")
      ),
                    li(nil, "1984年10月 Free Softwear Foundation")
      )
  end
end
end

class Gibier::Page12 < Gibier::PageBase
def header
  h2(nil, "マイコン時代")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/8bit.png"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "1977年6月 AppleIIの発売"),
                    li(nil, "1979年5月 NEC PC-8001発売")
      )
  end
end
end

class Gibier::Page13 < Gibier::PageBase
def header
  h2(nil, "PC-6001")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"middle"}, img({src:"#{Gibier.assets_path}/images/PC-6001.jpg"}, "")))
  end
end
end

class Gibier::Page14 < Gibier::PageBase
def header
  h2(nil, "ベーマガ")
end

def content
  [].tap do |children|
  end
end
end

class Gibier::Page15 < Gibier::PageBase
def header
  h2(nil, "MS-DOS時代")
end

def content
  [].tap do |children|
      children << ul(nil,
                  li(nil, "1984年 IBM PC/AT"),
                  ul(nil,
                    li(nil, "オープン戦略により多くの互換機を生んだ"),
                    li(nil, "PC DOSとしてOEM")
      ),
                    li(nil, "1990年 Windows3.0"),
                    li(nil, "ライバルとしてMachintosh(今のMac)があった")
      )
  end
end
end

class Gibier::Page16 < Gibier::PageBase
def header
  h2(nil, "フリーウェア")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "フリーソフトウェアとは違うからね！"),
                    li(nil, "バリエーションとしてシェアウェアがある"),
                    li(nil, "基本的にはソースコードを公開しないバイナリ(実行)形式で配布される"),
                    li(nil, "窓の杜")
      )
      children << p(nil, p({class:"forest"}, img({src:"#{Gibier.assets_path}/images/forest.png"}, "")))
  end
end
end

class Gibier::Page17 < Gibier::PageBase
def header
  h2(nil, "Linuxの登場")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "1991年 Linus Torvalds によって発表される"),
                    li(nil, "1992年にX-Windowが移植される")
      )
  end
end
end

class Gibier::Page18 < Gibier::PageBase
def header
  h2(nil, "伽藍とバザール")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/cathedral.jpg"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "1999年 Eric S. Raymond"),
                    li(nil, "「ユーザを共同開発者として扱うのは、コードの高速改良と効率よいデバッグのいちばん楽ちんな方法。」")
      )
  end
end
end

class Gibier::Page19 < Gibier::PageBase
def header
  h2(nil, "個人的な思いで")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/slackware.png"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "1994年頃 秋月電子のワゴンにSlackwareのCD-ROMが売られていたのがファーストインパクト"),
                    li(nil, "80386搭載のPC/AT互換機にインストールして使っていた"),
                    li(nil, "当時、Windows3.1が2万円弱、商用Cコンパイラが4～5万円の時代に無料のOSとコンパイラが手に入った")
      )
  end
end
end

class Gibier::Page20 < Gibier::PageBase
def header
  h2(nil, "商用ソフトウェアに影響を与えるOSS")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "OSI"),
                    li(nil, "Java"),
                    li(nil, "MySQL"),
                    li(nil, "RedHat"),
                    li(nil, "Webサービス(Softwear as a Service)")
      )
  end
end
end

class Gibier::Page21 < Gibier::PageBase
def header
  h2(nil, "Githubの登場")
end

def content
  [].tap do |children|
      children << ul(nil,
                  li(nil, "Github以前"),
                  ul(nil,
                    li(nil, "メール(メーリングリスト)"),
                    li(nil, "ネットニュース"),
                    li(nil, "Sourceforge"),
                    li(nil, "google code"),
                    li(nil, "coderepos")
      )
      )
  end
end
end

class Gibier::Page22 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "我々にとってOSSとは何なのか？")
  end
end
end

class Gibier::Page23 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "ソースコードは我々の共有財産")
  end
end
end

class Gibier::Page24 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "私たちはソースコードと共にある")
  end
end
end

class Gibier::Page25 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "Githubはソースコードをソーシャルな関係性へと導く")
  end
end
end

class Gibier::Page26 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "オープンソースとはつまり、")
      children << p({className:"large"}, "我々の生活そのもの")
  end
end
end

class Gibier::Page27 < Gibier::PageBase
def header
  h2(nil, "最後に我田引水")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"middle"}, img({src:"#{Gibier.assets_path}/images/ruby.png"}, "")))
  end
end
end

class Gibier::Page28 < Gibier::PageBase
def header
  h2(nil, "OSS-Gateへのご招待")
end

def content
  [].tap do |children|
      children << p(nil, "「OSS Gate」は、OSS開発に参加する「入り口」を提供する取り組みです。 OSS開発に未参加の人を参加する人へ、少し参加したことがある人を継続的に参加する人へ。そうやってOSS開発に参加する人を継続的に増やしていく。それが「OSS Gate」の目的です。")
      children << ul(nil,
                    li(nil, "特にサポーターを募集しています。")
      )
      children << p(nil, a({href:"https://oss-gate.github.io/", target:"_blank"}, "click"))
  end
end
end

Gibier.page_count = 29
Gibier.title = "OSS老害トーク 〜OSSとは何だったんだっけ？〜"
