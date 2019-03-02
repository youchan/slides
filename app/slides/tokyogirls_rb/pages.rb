class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "Rubyでプログラミングの楽しさを知ろう！")
end

def content
  [].tap do |children|
      children << p({className:"author"}, "youchan")
      children << p(nil, p({class:"icon"}, img({src:"#{Gibier.assets_path}/images/youchan.jpg"}, "")))
      children << p({className:"duration"}, "25")
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "突然ですがアンケート✋")
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "Ruby書いていますか？")
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "Rubyが第１言語だという人？")
      children << p({className:"center"}, "(プログラミング言語としてですよ！)")
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "Rails Girlsにガールズとして参加したことのある人？")
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "千葉県にお住まいのかた？")
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def header
  h2(nil, "ご協力ありがとうございました。")
end

def content
  [].tap do |children|
      children << p({className:"center"}, p({class:"ojigi"}, img({src:"#{Gibier.assets_path}/images/ojigi.png"}, "")))
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def header
  h2(nil, "自己紹介")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "よう(@youchan)"),
                    li(nil, "Rubyist"),
                    li(nil, "ちば在住"),
                    li(nil, "株式会社レトリバ")
      )
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def header
  h2(nil, "最近の活動")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Rubyで機械学習や自然言語処理をできるようにする活動"),
                    li(nil, "仲間を増やす活動")
      )
  end
end
end

class Gibier::Page9 < Gibier::PageBase
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
                    li(nil, "自然言語処理")
      )
  end
end
end

class Gibier::Page10 < Gibier::PageBase
def header
  h2(nil, "Opalの活動")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/pragmatic_opal.jpg"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "Opalで動く各種フレームワーク(Isomorphic Programmingなど)"),
                    li(nil, "RubyKaigi 2015～2017"),
                    li(nil, "「Pragmatic Opal」(インプレスR&D)")
      )
  end
end
end

class Gibier::Page11 < Gibier::PageBase
def header
  h2(nil, "自然言語処理")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/neko.jpg"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "RedChainer(深層学習フレームワーク)の自然言語処理"),
                    li(nil, "「猫と森羅と日本語とRuby」(同人)"),
                    li(nil, "RubyKaigi2019")
      )
  end
end
end

class Gibier::Page12 < Gibier::PageBase
def header
  h2(nil, "仲間を増やす活動")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"portlait-right"}, img({src:"#{Gibier.assets_path}/images/mwr.png"}, "")))
      children << p({className:"left"}, "")
      children << ul(nil,
                    li(nil, "Rails Girls"),
                    li(nil, "OSS Gate"),
                    li(nil, "「まんがでわかるRuby」(同人、技術書典6)"),
                    li(nil, "いまここ！")
      )
  end
end
end

class Gibier::Page13 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "Rubyでプログラミングの楽しさを知ろう！")
  end
end
end

class Gibier::Page14 < Gibier::PageBase
def header
  h2(nil, "Rubyのすきなところ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "言語としての側面"),
                    li(nil, "コミュニティとしての側面")
      )
  end
end
end

class Gibier::Page15 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "スペインではクリスマスに「ポルボロン」3回唱えると幸せがやってくるというおまじないがあるそうです。")
      children << p({className:"center"}, p({class:"w10"}, img({src:"#{Gibier.assets_path}/images/polvoron.jpg"}, "")))
  end
end
end

class Gibier::Page16 < Gibier::PageBase
def header
  h2(nil, "「ポルボロン」と3回唱えてみる")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3</pre></td><td class="code"><pre><span class="mi">3</span><span class="p">.</span><span class="nf">times</span> <span class="k">do</span>
  <span class="nb">puts</span> <span class="s2">"ポルボロン"</span>
<span class="k">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page17 < Gibier::PageBase
def header
  h2(nil, "Rubyのすきなところ(言語としての側面)")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "みんなオブジェクト"),
                    li(nil, "ブロックはとてもよい割り切り")
      )
  end
end
end

class Gibier::Page18 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "みんなオブジェクト")
  end
end
end

class Gibier::Page19 < Gibier::PageBase
def header
  h2(nil, "みんなオブジェクト")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "数値や範囲だってオブジェクト"),
                    li(nil, "クラスだってオブジェクト")
      )
  end
end
end

class Gibier::Page20 < Gibier::PageBase
def header
  h2(nil, "数値や範囲だってオブジェクト")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre><span class="mi">3</span><span class="p">.</span><span class="nf">times</span> <span class="k">do</span> <span class="p">.</span><span class="nf">.</span><span class="p">.</span> <span class="nf">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre><span class="p">(</span><span class="mi">1</span><span class="p">.</span><span class="nf">.</span><span class="mi">3</span><span class="p">).</span><span class="nf">each</span> <span class="k">do</span> <span class="p">.</span><span class="nf">.</span><span class="p">.</span> <span class="nf">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page21 < Gibier::PageBase
def header
  h2(nil, "クラスもオジェクト")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3</pre></td><td class="code"><pre><span class="no">Integer</span><span class="p">.</span><span class="nf">define_method</span><span class="p">(</span><span class="ss">:degree</span><span class="p">)</span> <span class="k">do</span>
  <span class="nb">self</span> <span class="o">*</span> <span class="no">Math</span><span class="o">::</span><span class="no">PI</span> <span class="o">/</span> <span class="mi">180</span>
<span class="k">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page22 < Gibier::PageBase
def header
  h2(nil, "オープンクラス")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5</pre></td><td class="code"><pre><span class="k">class</span> <span class="nc">Integer</span>
  <span class="k">def</span> <span class="nf">degree</span>
    <span class="nb">self</span> <span class="o">*</span> <span class="no">Math</span><span class="o">::</span><span class="no">PI</span> <span class="o">/</span> <span class="mi">180</span>
  <span class="k">end</span>
<span class="k">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page23 < Gibier::PageBase
def header
  h2(nil, "オープンクラスを使った例")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, code(nil, "Prime")),
                    li(nil, code(nil, "ActiveSupport"))
      )
  end
end
end

class Gibier::Page24 < Gibier::PageBase
def header
  h2(nil, code(nil, "Prime"))
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5</pre></td><td class="code"><pre><span class="nb">require</span> <span class="s2">"prime"</span>

<span class="p">(</span><span class="mi">2</span><span class="o">**</span><span class="mi">31</span> <span class="o">-</span> <span class="mi">1</span><span class="p">).</span><span class="nf">prime?</span>

<span class="mi">277945762500</span><span class="p">.</span><span class="nf">prime_division</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page25 < Gibier::PageBase
def header
  h2(nil, code(nil, "ActiveSupport"))
end

def content
  [].tap do |children|
      children << p(nil, code(nil, "ActiveSupport"),"このようなオープンクラスによる拡張の集大成")
      children << p(nil, "そのなかでもわたしのすきなやつ")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3</pre></td><td class="code"><pre><span class="nb">require</span> <span class="s2">"active_support/time"</span>

<span class="no">Date</span><span class="p">.</span><span class="nf">today</span> <span class="o">+</span> <span class="mi">47</span><span class="p">.</span><span class="nf">day</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page26 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, code(nil, "time"),"も",code(nil, "day"),"も名詞(単位)")
  end
end
end

class Gibier::Page27 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "誰ですか？メソッドの名前は動詞(もしくは命令形)で書けなんて言ったのは？")
      children << p(nil, "(念のため言っておくと、あくまで原則は動詞で書けですからね！)")
  end
end
end

class Gibier::Page28 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "圧倒的な自由！")
  end
end
end

class Gibier::Page29 < Gibier::PageBase
def header
  h2(nil, "Rubyのすきなところ(言語的な側面)")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, span({class: "gray"}, "みんなオブジェクト")),
                    li(nil, "ブロックはとてもよい割り切り")
      )
  end
end
end

class Gibier::Page30 < Gibier::PageBase
def header
  h2(nil, "関数型言語")
end

def content
  [].tap do |children|
      children << p({className:"large"}, "関数が第一級オブジェクトである")
  end
end
end

class Gibier::Page31 < Gibier::PageBase
def header
  h2(nil, "関数が第一級オブジェクト")
end

def content
  [].tap do |children|
      children << p({className:"large"}, "関数の引数に関数を渡すことができる")
  end
end
end

class Gibier::Page32 < Gibier::PageBase
def header
  h2(nil, "JavaScriptで書くなら")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3</pre></td><td class="code"><pre><span class="nx">array</span><span class="p">.</span><span class="nx">reduce</span><span class="p">(</span><span class="kd">function</span><span class="p">(</span><span class="nx">acc</span><span class="p">,</span> <span class="nx">i</span><span class="p">)</span> <span class="p">{</span>
  <span class="k">return</span> <span class="nx">acc</span> <span class="o">+</span> <span class="nx">i</span><span class="p">;</span>
<span class="p">});</span>
</pre></td></tr></tbody></table>
</div>
} } })
      children << p(nil, code(nil, "function(acc, i)"),"は",code(nil, "(acc, i) =>"),"に置き換えてもよい")
  end
end
end

class Gibier::Page33 < Gibier::PageBase
def header
  h2(nil, "Rubyならブロックをつかう")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3</pre></td><td class="code"><pre><span class="n">array</span><span class="p">.</span><span class="nf">reduce</span> <span class="k">do</span> <span class="o">|</span><span class="n">acc</span><span class="p">,</span> <span class="n">i</span><span class="o">|</span>
  <span class="n">acc</span> <span class="o">+</span> <span class="n">i</span>
<span class="k">end</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page34 < Gibier::PageBase
def header
  h2(nil, "ブロックと関数型の違い")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "ブロックは引数の最後に1つだけ置くことができる"),
                    li(nil, "ブロックの正体は",code(nil, "Proc"),"というクラスのオブジェクト")
      )
  end
end
end

class Gibier::Page35 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "自由より書きやすさ読みやすさが優先される(？)")
  end
end
end

class Gibier::Page36 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "ユースケースを想定して書きやすい/読みやすい方法を選べる")
  end
end
end

class Gibier::Page37 < Gibier::PageBase
def header
  h2(nil, "TMTOWTDI")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "There's More Than One Way To Do It")
      )
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7</pre></td><td class="code"><pre><span class="n">array</span><span class="p">.</span><span class="nf">reduce</span> <span class="k">do</span> <span class="o">|</span><span class="n">acc</span><span class="p">,</span> <span class="n">i</span><span class="o">|</span>
  <span class="n">acc</span> <span class="o">+</span> <span class="n">i</span>
<span class="k">end</span>

<span class="n">array</span><span class="p">.</span><span class="nf">reduce</span><span class="p">(</span><span class="o">&amp;</span><span class="p">:</span><span class="o">+</span><span class="p">)</span>

<span class="n">array</span><span class="p">.</span><span class="nf">sum</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page38 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "圧倒的な自由！")
  end
end
end

class Gibier::Page39 < Gibier::PageBase
def header
  h2(nil, "他にも語り切れないほどたくさんの好きがある")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "オープンクラスだけじゃないメタプログラミングの機能"),
                    li(nil, code(nil, "Enumerable"),"などブロックについてももっと…"),
                    li(nil, "RubyGemsやBundlerなどのエコシステム"),
                    li(nil, "etc…")
      )
  end
end
end

class Gibier::Page40 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "自由には責任が伴なう")
  end
end
end

class Gibier::Page41 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "大人の振舞いが求められる")
  end
end
end

class Gibier::Page42 < Gibier::PageBase
def header
  h2(nil, "Rubyのすきなところ")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, span({class: "gray"}, "言語としての側面")),
                    li(nil, "コミュニティとしての側面")
      )
  end
end
end

class Gibier::Page43 < Gibier::PageBase
def header
  h2(nil, "Rubyのコミュニティ")
end

def content
  [].tap do |children|
      children << ul(nil,
                  li(nil, "地域Rubyコミュニティ"),
                  ul(nil,
                    li(nil, "Asakusa.rb")
      ),
                    li(nil, "Rails Girls"),
                  li(nil, "RubyKaigi"),
                  ul(nil,
                    li(nil, "4/18 - 4/20 RubyKaigi2019")
      ),
                    li(nil, "こういうイベント")
      )
  end
end
end

class Gibier::Page44 < Gibier::PageBase
def header
  h2(nil, "日本のRubyコミュニティの特徴")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Rubyが日本で作られているのでRubyを作っている人たち(コミッター)がいる"),
                    li(nil, "コミッター以外にも技術的に尊敬できる人がたくさん"),
                    li(nil, "Rubyが作られた頃からあるので歴史が長い"),
                    li(nil, "成熟している(印象)")
      )
  end
end
end

class Gibier::Page45 < Gibier::PageBase
def header
  h2(nil, "RubyKaigi")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"middle"}, img({src:"#{Gibier.assets_path}/images/committers.jpg"}, "")))
  end
end
end

class Gibier::Page46 < Gibier::PageBase
def header
  h2(nil, "技術コミュニティのホモソーシャル性")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"middle"}, img({src:"#{Gibier.assets_path}/images/homosocial.png"}, "")))
  end
end
end

class Gibier::Page47 < Gibier::PageBase
def header
  h2(nil, "こういう状況ありますよね")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"middle"}, img({src:"#{Gibier.assets_path}/images/homosocial2.png"}, "")))
  end
end
end

class Gibier::Page48 < Gibier::PageBase
def header
  h2(nil, "もちろん女性だけでも起りうる")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"middle"}, img({src:"#{Gibier.assets_path}/images/homosocial_girls.png"}, "")))
  end
end
end

class Gibier::Page49 < Gibier::PageBase
def header
  h2(nil, "どうやって乗り越えるか？")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "気遣い・配慮という大人力"),
                    li(nil, "女性を増やす")
      )
  end
end
end

class Gibier::Page50 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "このようなイベントを開催してくれて圧倒的感謝！")
  end
end
end

class Gibier::Page51 < Gibier::PageBase
def header
  h2(nil, "Rubyのコミュニティはどうか？")
end

def content
  [].tap do |children|
      children << p({className:"large"}, "大人力によってこのようなことが少ないように感じる")
  end
end
end

class Gibier::Page52 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "何故？")
  end
end
end

class Gibier::Page53 < Gibier::PageBase
def header
  h2(nil, "Ruby自体が日本で作られているから")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, "昔からコミュニティ活動が盛ん"))
      children << ul(nil,
                    li(nil, "RubyKaigi2019 => 13回目"),
                    li(nil, "Asakusa.rb => 去年で10周年"),
                    li(nil, "Ruby => 26歳になりました")
      )
  end
end
end

class Gibier::Page54 < Gibier::PageBase
def header
  h2(nil, "まとめ")
end

def content
  [].tap do |children|
      children << p(nil, strong(nil, "私のRubyの好きなところ"))
      children << ul(nil,
                    li(nil, "みんなオブジェクト"),
                    li(nil, "ブロックはとてもよい割り切り"),
                    li(nil, "(ほんとはもっといっぱいいっぱいあるよ)"),
                    li(nil, "成熟したコミュニティ")
      )
  end
end
end

Gibier.page_count = 55
Gibier.title = "Rubyでプログラミングの楽しさを知ろう！"
