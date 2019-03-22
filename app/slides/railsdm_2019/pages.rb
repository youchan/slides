class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "OpalでつくるBrowserアプリケーション")
end

def content
  [].tap do |children|
      children << p({className:"author"}, "@youchan")
      children << p({className:"icon"}, p({class:""}, img({src:"#{Gibier.assets_path}/images/youchan.jpg"}, "")))
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "覚えていますか？")
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "15年前")
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "それまではRubyはよくあるスクリプト言語の一つでした。")
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "Ruby on Rails が登場して")
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "RubyがWebで最もよく使われる言語(の一つ)になりました。")
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "ところが、近年は")
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "Web開発はフロントエンドが重要になってきました。")
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def header
  h2(nil, "who am i")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "@youchan"),
                    li(nil, "rubyist"),
                    li(nil, "株式会社レトリバ")
      )
  end
end
end

class Gibier::Page9 < Gibier::PageBase
def header
  h2(nil, "RubyKaigi")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, span({class:"yellow"}, "「Writing web application in Ruby」(2015)")),
                    li(nil, span({class:"yellow"}, "「Isomorphic web programming in Ruby」(2016)")),
                    li(nil, span({class:"yellow"}, "「dRuby on Browser」(2017)")),
                    li(nil, "「How to get the dark power from ISeq」(2018)"),
                    li(nil, span({class:"yellow"}, "「Ruby for NLP」(2019)"))
      )
  end
end
end

class Gibier::Page10 < Gibier::PageBase
def header
  h2(nil, "Rubyで出来ることを増やす活動")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Webのフロントエンド"),
                    li(nil, ""),
                    li(nil, "機械学習(深層学習)"),
                    li(nil, "自然言語処理")
      )
      children << p(nil, p({class:"opal"}, img({src:"#{Gibier.assets_path}/images/opal.png"}, "")))
      children << p(nil, p({class:"rubykaigi"}, img({src:"#{Gibier.assets_path}/images/rubykaigi.png"}, "")))
      children << code({ dangerouslySetInnerHTML: { __html: %q{<!--
---

%large: なぜ？

---

%huge: Rubyが好きだから！

![heart](heart.png)

-->
} } })
  end
end
end

class Gibier::Page11 < Gibier::PageBase
def header
  h2(nil, "Opalでブラウザで動く将棋をつくる")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "ユーザー管理などある程度の複雑さをもつWebアプリケーション"),
                    li(nil, "ブラウザアプリケーションとしてUIが重要"),
                    li(nil, "リアルタイムでの相互通信")
      )
  end
end
end

class Gibier::Page12 < Gibier::PageBase
def header
  h2(nil, "これらを実現するための機能")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Isomorphic Programming"),
                    li(nil, "Vitual DOM"),
                    li(nil, "dRubyのブラウザ実装(WebSocket)")
      )
  end
end
end

class Gibier::Page13 < Gibier::PageBase
def header
  h2(nil, "アジェンダ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Opalってなに？"),
                    li(nil, "Opalプロジェクトの作成"),
                    li(nil, "Virutal DOM"),
                    li(nil, "Isomorphic Programming"),
                    li(nil, "dRuby on Browser(How to use WebSocket)"),
                    li(nil, "デモ")
      )
  end
end
end

class Gibier::Page14 < Gibier::PageBase
def header
  h2(nil, "アジェンダ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, span({class:"yellow"}, "Opalってなに？")),
                    li(nil, span({class:"pink"}, "Opalプロジェクトの作成")),
                    li(nil, span({class:"pink"}, "Virutal DOM")),
                    li(nil, span({class:"pink"}, "Isomorphic Programming")),
                    li(nil, span({class:"pink"}, "dRuby on Browser(How to use WebSocket)")),
                    li(nil, span({class:"pink"}, "デモ"))
      )
  end
end
end

class Gibier::Page15 < Gibier::PageBase
def header
  h2(nil, "Opalってなに？")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"full"}, img({src:"#{Gibier.assets_path}/images/whats_opal.png"}, "")))
  end
end
end

class Gibier::Page16 < Gibier::PageBase
def header
  h2(nil, "アジェンダ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, span({class:"pink"}, "Opalってなに？")),
                    li(nil, span({class:"yellow"}, "Opalプロジェクトの作成")),
                    li(nil, span({class:"pink"}, "Virutal DOM")),
                    li(nil, span({class:"pink"}, "Isomorphic Programming")),
                    li(nil, span({class:"pink"}, "dRuby on Browser(How to use WebSocket)")),
                    li(nil, span({class:"pink"}, "デモ"))
      )
  end
end
end

class Gibier::Page17 < Gibier::PageBase
def header
  h2(nil, "CLI tool")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2</pre></td><td class="code"><pre>$ gem install silica
$ silica new sample-app
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, "Silica: ",a({href:"https://github.com/youchan/silica", target:"_brank"}, "https://github.com/youchan/silica"))
  end
end
end

class Gibier::Page18 < Gibier::PageBase
def header
  h2(nil, "アジェンダ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, span({class:"pink"}, "Opalってなに？")),
                    li(nil, span({class:"pink"}, "Opalプロジェクトの作成")),
                    li(nil, span({class:"yellow"}, "Virutal DOM")),
                    li(nil, span({class:"pink"}, "Isomorphic Programming")),
                    li(nil, span({class:"pink"}, "dRuby on Browser(How to use WebSocket)")),
                    li(nil, span({class:"pink"}, "デモ"))
      )
  end
end
end

class Gibier::Page19 < Gibier::PageBase
def header
  h2(nil, "Virtual DOM")
end

def content
  [].tap do |children|
      children << ul(nil,
                  li(nil, "フロントエンドで欠かせない存在"),
                  ul(nil,
                    li(nil, "ex. React, Vue.js")
      ),
                  li(nil, "Virutal DOMをRubyで実装"),
                  ul(nil,
                    li(nil, "Hyalite: ",a({href:"https://github.com/youchan/hyalite", target:"_brank"}, "https://github.com/youchan/hyalite"))
      )
      )
  end
end
end

class Gibier::Page20 < Gibier::PageBase
def header
  h2(nil, "Example")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8</pre></td><td class="code"><pre><span class="k">class</span> <span class="nc">AppView</span>
  <span class="kp">include</span> <span class="no">Hyalite</span><span class="o">::</span><span class="no">Component</span>

  <span class="k">def</span> <span class="nf">render</span>
    <span class="n">h2</span><span class="p">(</span><span class="kp">nil</span><span class="p">,</span> <span class="s2">"Hi, </span><span class="si">#{</span><span class="vi">@props</span><span class="p">[</span><span class="ss">:name</span><span class="p">]</span><span class="si">}</span><span class="s2">"</span><span class="p">)</span>
  <span class="k">end</span>
<span class="k">end</span>
<span class="no">Hyalite</span><span class="p">.</span><span class="nf">render</span><span class="p">(</span><span class="no">Hyalite</span><span class="p">.</span><span class="nf">create_element</span><span class="p">(</span><span class="no">AppView</span><span class="p">,</span> <span class="p">{</span><span class="ss">name: </span><span class="s2">"John"</span><span class="p">}),</span> <span class="vg">$document</span><span class="p">[</span><span class="s1">'.content'</span><span class="p">])</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page21 < Gibier::PageBase
def header
  h2(nil, "アジェンダ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, span({class:"pink"}, "Opalってなに？")),
                    li(nil, span({class:"pink"}, "Opalプロジェクトの作成")),
                    li(nil, span({class:"pink"}, "Virutal DOM")),
                    li(nil, span({class:"yellow"}, "Isomorphic Programming")),
                    li(nil, span({class:"pink"}, "dRuby on browser(How to use WebSocket)")),
                    li(nil, span({class:"pink"}, "デモ"))
      )
  end
end
end

class Gibier::Page22 < Gibier::PageBase
def header
  h2(nil, "Isomorphic programming")
end

def content
  [].tap do |children|
      children << p(nil, "一般的にIsomorphic programmingを採用する理由は2つある")
      children << ul(nil,
                  li(nil, span({class:"yellow"}, "サーバーサイドレンダリング")),
                  ul(nil,
                    li(nil, "初期表示のパフォーマンスを向上"),
                    li(nil, "SEOなど有利")
      ),
                  li(nil, span({class:"yellow"}, "モデル定義の共有")),
                  ul(nil,
                    li(nil, "オブジェクトの透過的なアクセス")
      )
      )
  end
end
end

class Gibier::Page23 < Gibier::PageBase
def header
  h2(nil, "オブジェクトの透過的なアクセス")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"full"}, img({src:"#{Gibier.assets_path}/images/isomorphic.png"}, "")))
  end
end
end

class Gibier::Page24 < Gibier::PageBase
def header
  h2(nil, "Menilite")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Isomorphic Programming フレームワーク"),
                    li(nil, "モデルの定義をクライアント - サーバーで共有"),
                    li(nil, "オブジェクトの透過的なアクセス"),
                    li(nil, "APIをコードを書かなくてもよい")
      )
      children << p(nil, "Menilite: ",a({href:"https://github.com/youchan/menilite", target:"_brank"}, "https://github.com/youchan/menilite"))
  end
end
end

class Gibier::Page25 < Gibier::PageBase
def header
  h2(nil, "モデルの定義")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11
12
13
14
15</pre></td><td class="code"><pre><span class="k">class</span> <span class="nc">User</span> <span class="o">&lt;</span> <span class="no">Menilite</span><span class="o">::</span><span class="no">Model</span>
  <span class="n">field</span> <span class="ss">:name</span>
  <span class="n">field</span> <span class="ss">:password</span>

  <span class="n">action</span> <span class="ss">:signup</span><span class="p">,</span> <span class="ss">on_create: </span><span class="kp">true</span> <span class="k">do</span> <span class="o">|</span><span class="n">password</span><span class="o">|</span>
    <span class="nb">self</span><span class="p">.</span><span class="nf">password</span> <span class="o">=</span>  <span class="no">BCrypt</span><span class="o">::</span><span class="no">Password</span><span class="p">.</span><span class="nf">create</span><span class="p">(</span><span class="n">password</span><span class="p">)</span>
    <span class="nb">self</span><span class="p">.</span><span class="nf">save</span>
  <span class="k">end</span>

  <span class="n">if_server</span> <span class="k">do</span>
    <span class="k">def</span> <span class="nf">auth</span><span class="p">(</span><span class="n">password</span><span class="p">)</span>
      <span class="no">BCrypt</span><span class="o">::</span><span class="no">Password</span><span class="p">.</span><span class="nf">new</span><span class="p">(</span><span class="nb">self</span><span class="p">.</span><span class="nf">password</span><span class="p">)</span> <span class="o">==</span> <span class="n">password</span>
    <span class="k">end</span>
  <span class="k">end</span>
<span class="k">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page26 < Gibier::PageBase
def header
  h2(nil, "コントローラー")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8
9
10
11
12
13
14
15</pre></td><td class="code"><pre><span class="k">class</span> <span class="nc">ApplicationController</span> <span class="o">&lt;</span> <span class="no">Menilite</span><span class="o">::</span><span class="no">Controller</span>
  <span class="n">action</span> <span class="ss">:login</span> <span class="k">do</span> <span class="o">|</span><span class="n">username</span><span class="p">,</span> <span class="n">password</span><span class="o">|</span>
    <span class="n">user</span> <span class="o">=</span> <span class="no">User</span><span class="p">.</span><span class="nf">find</span><span class="p">(</span><span class="ss">name: </span><span class="n">username</span><span class="p">)</span>
    <span class="k">if</span> <span class="n">user</span> <span class="o">&amp;&amp;</span> <span class="n">user</span><span class="p">.</span><span class="nf">auth</span><span class="p">(</span><span class="n">password</span><span class="p">)</span>
      <span class="n">session</span><span class="p">[</span><span class="ss">:user_id</span><span class="p">]</span> <span class="o">=</span> <span class="n">user</span><span class="p">.</span><span class="nf">id</span>
    <span class="k">else</span>
      <span class="k">raise</span> <span class="s1">'auth error'</span>
    <span class="k">end</span>
  <span class="k">end</span>
<span class="k">end</span>

<span class="c1"># Client code</span>
<span class="no">ApplicationController</span><span class="p">.</span><span class="nf">login</span><span class="p">(</span><span class="s2">"user1"</span><span class="p">,</span> <span class="s2">"topsecret"</span><span class="p">)</span> <span class="k">do</span> <span class="o">|</span><span class="n">user</span><span class="o">|</span>
  <span class="c1"># ...</span>
<span class="k">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page27 < Gibier::PageBase
def header
  h2(nil, "アジェンダ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, span({class:"pink"}, "Opalってなに？")),
                    li(nil, span({class:"pink"}, "Opalプロジェクトの作成")),
                    li(nil, span({class:"pink"}, "Virutal DOM")),
                    li(nil, span({class:"pink"}, "Isomorphic Programming")),
                    li(nil, span({class:"yellow"}, "dRuby on Browser(How to use WebSocket)")),
                    li(nil, span({class:"pink"}, "デモ"))
      )
  end
end
end

class Gibier::Page28 < Gibier::PageBase
def header
  h2(nil, "dRuby")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Rubyの分散オブジェクトシステム"),
                    li(nil, a({href:"https://docs.ruby-lang.org/en/2.5.0/DRb.html", target:"_blank"}, "標準ライブラリ")),
                    li(nil, "IDLなどのインタフェースの記述が不要(Duck typing! 🦆)")
      )
  end
end
end

class Gibier::Page29 < Gibier::PageBase
def header
  h2(nil, "dRubyの使いかた")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7
8</pre></td><td class="code"><pre><span class="c1"># server-side</span>
<span class="n">requrie</span> <span class="s2">"drb"</span>
<span class="n">obj</span> <span class="o">=</span> <span class="p">[]</span>
<span class="no">DRb</span><span class="p">.</span><span class="nf">start_service</span><span class="p">(</span><span class="s2">"druby://localhost:1234"</span><span class="p">,</span> <span class="n">obj</span><span class="p">)</span>

<span class="c1"># client-side</span>
<span class="nb">require</span> <span class="s2">"drb"</span>
<span class="n">client_obj</span> <span class="o">=</span> <span class="no">DRbObject</span><span class="p">.</span><span class="nf">new_with_uri</span><span class="p">(</span><span class="s2">"druby://localhost:1234"</span><span class="p">)</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page30 < Gibier::PageBase
def header
  h2(nil, code(nil, "DRb::DRbProtocol"))
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "dRubyにプロトコルを追加することができる"),
                    li(nil, code(nil, "druby:"),"というプロトコルはTCP socket"),
                    li(nil, "もちろんWebSocketを追加することもできる")
      )
  end
end
end

class Gibier::Page31 < Gibier::PageBase
def header
  h2(nil, "ブラウザでdRuby!")
end

def content
  [].tap do |children|
      children << ul(nil,
                  li(nil, "WebSocketプロトコルの実装"),
                  ul(nil,
                    li(nil, "drb-websocket: ",a({href:"https://github.com/youchan/drb-websocket", target:"_brank"}, "https://github.com/youchan/drb-websocket"))
      ),
                  li(nil, "OpalにdRubyを実装"),
                  ul(nil,
                    li(nil, "opal-drb: ",a({href:"https://github.com/youchan/opal-drb", target:"_brank"}, "https://github.com/youchan/opal-drb"))
      )
      )
  end
end
end

class Gibier::Page32 < Gibier::PageBase
def header
  h2(nil, "アジェンダ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, span({class:"pink"}, "Opalってなに？")),
                    li(nil, span({class:"pink"}, "Opalプロジェクトの作成")),
                    li(nil, span({class:"pink"}, "Virutal DOM")),
                    li(nil, span({class:"pink"}, "Isomorphic Programming")),
                    li(nil, span({class:"pink"}, "dRuby on Browser(How to use WebSocket)")),
                    li(nil, span({class:"yellow"}, "デモ"))
      )
  end
end
end

class Gibier::Page33 < Gibier::PageBase
def header
  h2(nil, "まとめ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "OpalでRubyでもVirtual DOM, Isomorphic programming, WebSocketといったモダンなブラウザアプリケーションの開発が可能になりました。"),
                    li(nil, "OpalはWeb開発を変える力を持っています。"),
                    li(nil, "みなさん使ってみませんか？")
      )
  end
end
end

Gibier.page_count = 34
Gibier.title = "OpalでつくるBrowserアプリケーション"
