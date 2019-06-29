class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "ワンライナーで書く「Game of Life」")
end

def content
  [].tap do |children|
      children << p({className:"author"}, "youchan")
      children << p(nil, p({class:"icon"}, img({src:"#{Gibier.assets_path}/images/youchan.jpg"}, "")))
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def header
  h2(nil, "Who am I")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "youchan"),
                    li(nil, "株式会社レトリバ"),
                    li(nil, "RubyKaigi(2015-2019)"),
                    li(nil, "技術書典(3～6)")
      )
  end
end
end

class Gibier::Page2 < Gibier::PageBase
def header
  h2(nil, "「The Jonan Show」を知ってますか？")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "RubyConf2017, RubyKaigi2018"),
                    li(nil, "デカ外人(Jonan)によるリアルタイムキャスト"),
                    li(nil, "Rubyistとペアプログラミングをして「Conway's Game of Life」を作る")
      )
  end
end
end

class Gibier::Page3 < Gibier::PageBase
def header
  h2(nil, "What's \"Conway's Game of Life\"")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "日本ではライフゲームと呼ばれている"),
                    li(nil, "セルオートマトンと呼ばれるシミュレーションの一種"),
                    li(nil, span({class:"red"}, "1970年"),"にJohn Horton Conwayによって考案された")
      )
  end
end
end

class Gibier::Page4 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "「Conway's Game of Life」のルール")
  end
end
end

class Gibier::Page5 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, "2次元の格子状のフィールド上で展開される")
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/board.png"}, "")))
  end
end
end

class Gibier::Page6 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, "各セルには生命が",span({class:"red"}, "\"生きている\""),"か",span({class:"red"}, "\"死んでいる\""),"かの2状態がある")
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/dead_live.png"}, "")))
  end
end
end

class Gibier::Page7 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, "各セルは周囲の8つのセルの状態によって以下のルールに則って状態を変える")
      children << ul(nil,
                    li(nil, "周囲に生きているセルが1以下の場合はそのセルは死滅する"),
                    li(nil, "周囲に生きているセルが2の場合はそのセルの状態は変わらない"),
                    li(nil, "周囲に生きているセルが3の場合はそのセルに新しい生命が誕生する"),
                    li(nil, "周囲に生きているセルが4以上の場合はそのセルは死滅する")
      )
  end
end
end

class Gibier::Page8 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/update_rule.png"}, "")))
  end
end
end

class Gibier::Page9 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "デモ")
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre>s=150;Array.new((s+2)*(s+2),0).tap{|g|4000.times{g[rand(1..s)*(s+2)+rand(1..s)]=1};100.times{s.times{|y|puts s.times.map{|x|g[x+s+3+y*(s+2)]==1??*:?.}.join};(s*s).times.map{|i|i+=i/s*2;[0,1,2,3,5,6,7,8].map{|c|g[i+c%3+c/3*2+c/3*s]}.sum.yield_self{|x|x==3?1:x==2?g[i+s+3]:0}}.tap{|n|(s*s).times{|i|g[i+s+3+i/s*2]=n[i]}};sleep(0.1);print"\e[#{s}A"}}
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page10 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "いろいろなパターンがある")
      children << p(nil, a({href:"https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life", target:"_brank"}, "https://en.wikipedia.org/wiki/Conway%27s_Game_of_Life"))
  end
end
end

class Gibier::Page11 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "デジタル時計")
      children << p(nil, a({href:"https://copy.sh/life/", target:"_brank"}, "https://copy.sh/life/"))
      children << p(nil, a({href:"https://gist.githubusercontent.com/anonymous/9d7468755dd76a35d93beeb5c0a5bdcf/raw/3295717faf24e8911048bcb69d4b6c8505d24330/gistfile1.txt", target:"_blank"}, "digital watch"))
  end
end
end

class Gibier::Page12 < Gibier::PageBase
def header
  h2(nil, "ワンライナー")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1</pre></td><td class="code"><pre><span class="n">s</span><span class="o">=</span><span class="mi">30</span><span class="p">;</span><span class="no">Array</span><span class="p">.</span><span class="nf">new</span><span class="p">((</span><span class="n">s</span><span class="o">+</span><span class="mi">2</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">s</span><span class="o">+</span><span class="mi">2</span><span class="p">),</span><span class="mi">0</span><span class="p">).</span><span class="nf">tap</span><span class="p">{</span><span class="o">|</span><span class="n">g</span><span class="o">|</span><span class="p">[</span><span class="mi">100</span><span class="p">,</span><span class="mi">133</span><span class="p">,</span><span class="mi">163</span><span class="p">,</span><span class="mi">164</span><span class="p">,</span><span class="mi">165</span><span class="p">].</span><span class="nf">each</span><span class="p">{</span><span class="o">|</span><span class="n">i</span><span class="o">|</span><span class="n">g</span><span class="p">[</span><span class="n">i</span><span class="p">]</span><span class="o">=</span><span class="mi">1</span><span class="p">};</span><span class="mi">100</span><span class="p">.</span><span class="nf">times</span><span class="p">{</span><span class="n">s</span><span class="p">.</span><span class="nf">times</span><span class="p">{</span><span class="o">|</span><span class="n">y</span><span class="o">|</span><span class="nb">puts</span> <span class="n">s</span><span class="p">.</span><span class="nf">times</span><span class="p">.</span><span class="nf">map</span><span class="p">{</span><span class="o">|</span><span class="n">x</span><span class="o">|</span><span class="n">g</span><span class="p">[</span><span class="n">x</span><span class="o">+</span><span class="n">s</span><span class="o">+</span><span class="mi">3</span><span class="o">+</span><span class="n">y</span><span class="o">*</span><span class="p">(</span><span class="n">s</span><span class="o">+</span><span class="mi">2</span><span class="p">)]</span><span class="o">==</span><span class="mi">1</span><span class="sc">??</span><span class="o">*</span><span class="p">:</span><span class="sc">?.</span><span class="p">}.</span><span class="nf">join</span><span class="p">};(</span><span class="n">s</span><span class="o">*</span><span class="n">s</span><span class="p">).</span><span class="nf">times</span><span class="p">.</span><span class="nf">map</span><span class="p">{</span><span class="o">|</span><span class="n">i</span><span class="o">|</span><span class="n">i</span><span class="o">+=</span><span class="n">i</span><span class="o">/</span><span class="n">s</span><span class="o">*</span><span class="mi">2</span><span class="p">;[</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">2</span><span class="p">,</span><span class="mi">3</span><span class="p">,</span><span class="mi">5</span><span class="p">,</span><span class="mi">6</span><span class="p">,</span><span class="mi">7</span><span class="p">,</span><span class="mi">8</span><span class="p">].</span><span class="nf">map</span><span class="p">{</span><span class="o">|</span><span class="n">c</span><span class="o">|</span><span class="n">g</span><span class="p">[</span><span class="n">i</span><span class="o">+</span><span class="n">c</span><span class="o">%</span><span class="mi">3</span><span class="o">+</span><span class="n">c</span><span class="o">/</span><span class="mi">3</span><span class="o">*</span><span class="mi">2</span><span class="o">+</span><span class="n">c</span><span class="o">/</span><span class="mi">3</span><span class="o">*</span><span class="n">s</span><span class="p">]}.</span><span class="nf">sum</span><span class="p">.</span><span class="nf">yield_self</span><span class="p">{</span><span class="o">|</span><span class="n">x</span><span class="o">|</span><span class="n">x</span><span class="o">==</span><span class="mi">3</span><span class="sc">?1</span><span class="ss">:x</span><span class="o">==</span><span class="mi">2</span><span class="sc">?g</span><span class="p">[</span><span class="n">i</span><span class="o">+</span><span class="n">s</span><span class="o">+</span><span class="mi">3</span><span class="p">]:</span><span class="mi">0</span><span class="p">}}.</span><span class="nf">tap</span><span class="p">{</span><span class="o">|</span><span class="n">n</span><span class="o">|</span><span class="p">(</span><span class="n">s</span><span class="o">*</span><span class="n">s</span><span class="p">).</span><span class="nf">times</span><span class="p">{</span><span class="o">|</span><span class="n">i</span><span class="o">|</span><span class="n">g</span><span class="p">[</span><span class="n">i</span><span class="o">+</span><span class="n">s</span><span class="o">+</span><span class="mi">3</span><span class="o">+</span><span class="n">i</span><span class="o">/</span><span class="n">s</span><span class="o">*</span><span class="mi">2</span><span class="p">]</span><span class="o">=</span><span class="n">n</span><span class="p">[</span><span class="n">i</span><span class="p">]}};</span><span class="nb">sleep</span><span class="p">(</span><span class="mi">0</span><span class="o">.</span><span class="mi">1</span><span class="p">);</span><span class="nb">print</span><span class="s2">"</span><span class="se">\e</span><span class="s2">[</span><span class="si">#{</span><span class="n">s</span><span class="si">}</span><span class="s2">A"</span><span class="p">}}</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page13 < Gibier::PageBase
def header
  h2(nil, "s/;/^M/g")
end

def content
  [].tap do |children|
      children << code({ dangerouslySetInnerHTML: { __html: %q{<div class="highlight"><table style="border-spacing: 0"><tbody><tr><td class="gutter gl" style="text-align: right"><pre class="lineno">1
2
3
4
5
6
7</pre></td><td class="code"><pre><span class="n">s</span><span class="o">=</span><span class="mi">30</span>
<span class="no">Array</span><span class="p">.</span><span class="nf">new</span><span class="p">((</span><span class="n">s</span><span class="o">+</span><span class="mi">2</span><span class="p">)</span><span class="o">*</span><span class="p">(</span><span class="n">s</span><span class="o">+</span><span class="mi">2</span><span class="p">),</span><span class="mi">0</span><span class="p">).</span><span class="nf">tap</span><span class="p">{</span><span class="o">|</span><span class="n">g</span><span class="o">|</span><span class="p">[</span><span class="mi">100</span><span class="p">,</span><span class="mi">133</span><span class="p">,</span><span class="mi">163</span><span class="p">,</span><span class="mi">164</span><span class="p">,</span><span class="mi">165</span><span class="p">].</span><span class="nf">each</span><span class="p">{</span><span class="o">|</span><span class="n">i</span><span class="o">|</span><span class="n">g</span><span class="p">[</span><span class="n">i</span><span class="p">]</span><span class="o">=</span><span class="mi">1</span><span class="p">}</span>
<span class="mi">100</span><span class="p">.</span><span class="nf">times</span><span class="p">{</span><span class="n">s</span><span class="p">.</span><span class="nf">times</span><span class="p">{</span><span class="o">|</span><span class="n">y</span><span class="o">|</span><span class="nb">puts</span> <span class="n">s</span><span class="p">.</span><span class="nf">times</span><span class="p">.</span><span class="nf">map</span><span class="p">{</span><span class="o">|</span><span class="n">x</span><span class="o">|</span><span class="n">g</span><span class="p">[</span><span class="n">x</span><span class="o">+</span><span class="n">s</span><span class="o">+</span><span class="mi">3</span><span class="o">+</span><span class="n">y</span><span class="o">*</span><span class="p">(</span><span class="n">s</span><span class="o">+</span><span class="mi">2</span><span class="p">)]</span><span class="o">==</span><span class="mi">1</span><span class="sc">??</span><span class="o">*</span><span class="p">:</span><span class="sc">?.</span><span class="p">}.</span><span class="nf">join</span><span class="p">}</span>
<span class="p">(</span><span class="n">s</span><span class="o">*</span><span class="n">s</span><span class="p">).</span><span class="nf">times</span><span class="p">.</span><span class="nf">map</span><span class="p">{</span><span class="o">|</span><span class="n">i</span><span class="o">|</span><span class="n">i</span><span class="o">+=</span><span class="n">i</span><span class="o">/</span><span class="n">s</span><span class="o">*</span><span class="mi">2</span>
<span class="p">[</span><span class="mi">0</span><span class="p">,</span><span class="mi">1</span><span class="p">,</span><span class="mi">2</span><span class="p">,</span><span class="mi">3</span><span class="p">,</span><span class="mi">5</span><span class="p">,</span><span class="mi">6</span><span class="p">,</span><span class="mi">7</span><span class="p">,</span><span class="mi">8</span><span class="p">].</span><span class="nf">map</span><span class="p">{</span><span class="o">|</span><span class="n">c</span><span class="o">|</span><span class="n">g</span><span class="p">[</span><span class="n">i</span><span class="o">+</span><span class="n">c</span><span class="o">%</span><span class="mi">3</span><span class="o">+</span><span class="n">c</span><span class="o">/</span><span class="mi">3</span><span class="o">*</span><span class="mi">2</span><span class="o">+</span><span class="n">c</span><span class="o">/</span><span class="mi">3</span><span class="o">*</span><span class="n">s</span><span class="p">]}.</span><span class="nf">sum</span><span class="p">.</span><span class="nf">yield_self</span><span class="p">{</span><span class="o">|</span><span class="n">x</span><span class="o">|</span><span class="n">x</span><span class="o">==</span><span class="mi">3</span><span class="sc">?1</span><span class="ss">:x</span><span class="o">==</span><span class="mi">2</span><span class="sc">?g</span><span class="p">[</span><span class="n">i</span><span class="o">+</span><span class="n">s</span><span class="o">+</span><span class="mi">3</span><span class="p">]:</span><span class="mi">0</span><span class="p">}}.</span><span class="nf">tap</span><span class="p">{</span><span class="o">|</span><span class="n">n</span><span class="o">|</span><span class="p">(</span><span class="n">s</span><span class="o">*</span><span class="n">s</span><span class="p">).</span><span class="nf">times</span><span class="p">{</span><span class="o">|</span><span class="n">i</span><span class="o">|</span><span class="n">g</span><span class="p">[</span><span class="n">i</span><span class="o">+</span><span class="n">s</span><span class="o">+</span><span class="mi">3</span><span class="o">+</span><span class="n">i</span><span class="o">/</span><span class="n">s</span><span class="o">*</span><span class="mi">2</span><span class="p">]</span><span class="o">=</span><span class="n">n</span><span class="p">[</span><span class="n">i</span><span class="p">]}}</span>
<span class="nb">sleep</span><span class="p">(</span><span class="mi">0</span><span class="o">.</span><span class="mi">1</span><span class="p">)</span>
<span class="nb">print</span><span class="s2">"</span><span class="se">\e</span><span class="s2">[</span><span class="si">#{</span><span class="n">s</span><span class="si">}</span><span class="s2">A"</span><span class="p">}}</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page14 < Gibier::PageBase
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
15
16
17
18
19
20
21
22
23
24
25</pre></td><td class="code"><pre><span class="n">s</span> <span class="o">=</span> <span class="mi">30</span>
<span class="no">Array</span><span class="p">.</span><span class="nf">new</span><span class="p">((</span><span class="n">s</span> <span class="o">+</span> <span class="mi">2</span><span class="p">)</span> <span class="o">*</span> <span class="p">(</span><span class="n">s</span> <span class="o">+</span> <span class="mi">2</span><span class="p">),</span> <span class="mi">0</span><span class="p">).</span><span class="nf">tap</span> <span class="p">{</span> <span class="o">|</span><span class="n">g</span><span class="o">|</span>         <span class="c1"># g: 盤面(?)</span>
  <span class="p">[</span><span class="mi">100</span><span class="p">,</span> <span class="mi">133</span><span class="p">,</span> <span class="mi">163</span><span class="p">,</span> <span class="mi">164</span><span class="p">,</span> <span class="mi">165</span><span class="p">].</span><span class="nf">each</span><span class="p">{</span> <span class="o">|</span><span class="n">i</span><span class="o">|</span> <span class="n">g</span><span class="p">[</span><span class="n">i</span><span class="p">]</span> <span class="o">=</span> <span class="mi">1</span> <span class="p">}</span>  <span class="c1"># グライダーを描く</span>
  <span class="mi">100</span><span class="p">.</span><span class="nf">times</span> <span class="p">{</span>                                     <span class="c1"># 100世代のループ</span>
    <span class="n">s</span><span class="p">.</span><span class="nf">times</span> <span class="p">{</span> <span class="o">|</span><span class="n">y</span><span class="o">|</span>                                 <span class="c1"># 行をスキャン</span>
      <span class="nb">puts</span> <span class="n">s</span><span class="p">.</span><span class="nf">times</span><span class="p">.</span><span class="nf">map</span><span class="p">{</span> <span class="o">|</span><span class="n">x</span><span class="o">|</span>                       <span class="c1"># 行を表示</span>
        <span class="n">g</span><span class="p">[</span><span class="n">x</span> <span class="o">+</span> <span class="n">s</span> <span class="o">+</span> <span class="mi">3</span> <span class="o">+</span> <span class="n">y</span> <span class="o">*</span> <span class="p">(</span><span class="n">s</span> <span class="o">+</span> <span class="mi">2</span><span class="p">)]</span> <span class="o">==</span> <span class="mi">1</span> <span class="p">?</span> <span class="sc">?*</span> <span class="p">:</span> <span class="sc">?.</span> <span class="c1"># 謎のインデックスの計算</span>
      <span class="p">}.</span><span class="nf">join</span>
    <span class="p">}</span>
    <span class="p">(</span><span class="n">s</span> <span class="o">*</span> <span class="n">s</span><span class="p">).</span><span class="nf">times</span><span class="p">.</span><span class="nf">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">i</span><span class="o">|</span>                       <span class="c1"># 盤面をスキャン</span>
      <span class="n">i</span> <span class="o">+=</span> <span class="n">i</span> <span class="o">/</span> <span class="n">s</span> <span class="o">*</span> <span class="mi">2</span>                              <span class="c1"># 謎の係数</span>
      <span class="p">[</span><span class="mi">0</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="mi">2</span><span class="p">,</span> <span class="mi">3</span><span class="p">,</span> <span class="mi">5</span><span class="p">,</span> <span class="mi">6</span><span class="p">,</span> <span class="mi">7</span><span class="p">,</span> <span class="mi">8</span><span class="p">].</span><span class="nf">map</span><span class="p">{</span> <span class="o">|</span><span class="n">c</span><span class="o">|</span>           <span class="c1"># 周辺の8マス</span>
        <span class="n">g</span><span class="p">[</span><span class="n">i</span> <span class="o">+</span> <span class="n">c</span> <span class="o">%</span> <span class="mi">3</span> <span class="o">+</span> <span class="n">c</span> <span class="o">/</span> <span class="mi">3</span> <span class="o">*</span> <span class="mi">2</span> <span class="o">+</span> <span class="n">c</span> <span class="o">/</span> <span class="mi">3</span> <span class="o">*</span> <span class="n">s</span><span class="p">]</span>      <span class="c1"># 謎のインデックスの計算</span>
      <span class="p">}.</span><span class="nf">sum</span><span class="p">.</span><span class="nf">yield_self</span><span class="p">{</span> <span class="o">|</span><span class="n">x</span><span class="o">|</span>                       <span class="c1"># 合計</span>
        <span class="n">x</span> <span class="o">==</span> <span class="mi">3</span> <span class="p">?</span> <span class="mi">1</span> <span class="p">:</span> <span class="n">x</span> <span class="o">==</span> <span class="mi">2</span> <span class="p">?</span> <span class="n">g</span><span class="p">[</span><span class="n">i</span> <span class="o">+</span> <span class="n">s</span> <span class="o">+</span> <span class="mi">3</span><span class="p">]</span> <span class="p">:</span> <span class="mi">0</span>    <span class="c1"># 次の状態を決める</span>
      <span class="p">}</span>
    <span class="p">}.</span><span class="nf">tap</span><span class="p">{</span> <span class="o">|</span><span class="n">n</span><span class="o">|</span>                                    <span class="c1"># n: 次の盤面</span>
      <span class="p">(</span><span class="n">s</span><span class="o">*</span><span class="n">s</span><span class="p">).</span><span class="nf">times</span><span class="p">{</span> <span class="o">|</span><span class="n">i</span><span class="o">|</span>                            <span class="c1"># 次の盤面をセット</span>
        <span class="n">g</span><span class="p">[</span><span class="n">i</span> <span class="o">+</span> <span class="n">s</span> <span class="o">+</span> <span class="mi">3</span> <span class="o">+</span> <span class="n">i</span> <span class="o">/</span> <span class="n">s</span> <span class="o">*</span> <span class="mi">2</span><span class="p">]</span> <span class="o">=</span> <span class="n">n</span><span class="p">[</span><span class="n">i</span><span class="p">]</span>           <span class="c1"># 謎のインデックスの計算</span>
      <span class="p">}</span>
    <span class="p">}</span>
    <span class="nb">sleep</span><span class="p">(</span><span class="mi">0</span><span class="o">.</span><span class="mi">1</span><span class="p">)</span>
    <span class="nb">print</span> <span class="s2">"</span><span class="se">\e</span><span class="s2">[</span><span class="si">#{</span><span class="n">s</span><span class="si">}</span><span class="s2">A"</span>
  <span class="p">}</span>
<span class="p">}</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page15 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "謎のインデックス計算？！")
  end
end
end

class Gibier::Page16 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "盤面？ ",code(nil, "Array.new((s + 2) * (s + 2), 0)"))
  end
end
end

class Gibier::Page17 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"w50"}, img({src:"#{Gibier.assets_path}/images/mergin.png"}, "")))
  end
end
end

class Gibier::Page18 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"w30"}, img({src:"#{Gibier.assets_path}/images/convolution.png"}, "")))
  end
end
end

class Gibier::Page19 < Gibier::PageBase
def header
  h2(nil, "コンボリューション演算")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Conway's Game of Lifeのように周辺のセルの状態から対象のセルの状態を計算するものを一般的コンボリューション演算といいます。"),
                    li(nil, "画像処理では一般的な手法でぼかし(平滑化)たり、エッジ抽出(鮮鋭化)したりするのによくつかいます。"),
                    li(nil, "深層学習を画像に適用するときにも、CNN(コンボリューションニューラルネットワーク)として応用されています。")
      )
  end
end
end

class Gibier::Page20 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"w50"}, img({src:"#{Gibier.assets_path}/images/mergin.png"}, "")))
  end
end
end

class Gibier::Page21 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"w50"}, img({src:"#{Gibier.assets_path}/images/edge.png"}, "")))
  end
end
end

class Gibier::Page22 < Gibier::PageBase
def header
  h2(nil, "分岐の少ないプログラム")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "CPUにとっては、演算よりも分岐のほうがコストが大きい")
      )
  end
end
end

class Gibier::Page23 < Gibier::PageBase
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
10</pre></td><td class="code"><pre>    <span class="p">(</span><span class="n">s</span> <span class="o">*</span> <span class="n">s</span><span class="p">).</span><span class="nf">times</span><span class="p">.</span><span class="nf">map</span> <span class="p">{</span> <span class="o">|</span><span class="n">i</span><span class="o">|</span>                       <span class="c1"># 盤面をスキャン</span>
      <span class="n">i</span> <span class="o">+=</span> <span class="n">i</span> <span class="o">/</span> <span class="n">s</span> <span class="o">*</span> <span class="mi">2</span>                              <span class="c1"># 謎の係数</span>
      <span class="p">[</span><span class="mi">0</span><span class="p">,</span> <span class="mi">1</span><span class="p">,</span> <span class="mi">2</span><span class="p">,</span> <span class="mi">3</span><span class="p">,</span> <span class="mi">5</span><span class="p">,</span> <span class="mi">6</span><span class="p">,</span> <span class="mi">7</span><span class="p">,</span> <span class="mi">8</span><span class="p">].</span><span class="nf">map</span><span class="p">{</span> <span class="o">|</span><span class="n">c</span><span class="o">|</span>           <span class="c1"># 周辺の8マス</span>
        <span class="n">g</span><span class="p">[</span><span class="n">i</span> <span class="o">+</span> <span class="n">c</span> <span class="o">%</span> <span class="mi">3</span> <span class="o">+</span> <span class="n">c</span> <span class="o">/</span> <span class="mi">3</span> <span class="o">*</span> <span class="mi">2</span> <span class="o">+</span> <span class="n">c</span> <span class="o">/</span> <span class="mi">3</span> <span class="o">*</span> <span class="n">s</span><span class="p">]</span>      <span class="c1"># 謎のインデックスの計算</span>
      <span class="p">}.</span><span class="nf">sum</span><span class="p">.</span><span class="nf">yield_self</span><span class="p">{</span> <span class="o">|</span><span class="n">x</span><span class="o">|</span>                       <span class="c1"># 合計</span>
        <span class="n">x</span> <span class="o">==</span> <span class="mi">3</span> <span class="p">?</span> <span class="mi">1</span> <span class="p">:</span> <span class="n">x</span> <span class="o">==</span> <span class="mi">2</span> <span class="p">?</span> <span class="n">g</span><span class="p">[</span><span class="n">i</span> <span class="o">+</span> <span class="n">s</span> <span class="o">+</span> <span class="mi">3</span><span class="p">]</span> <span class="p">:</span> <span class="mi">0</span>    <span class="c1"># 次の状態を決める</span>
      <span class="p">}</span>
    <span class="p">}.</span><span class="nf">tap</span><span class="p">{</span> <span class="o">|</span><span class="n">n</span><span class="o">|</span>                                    <span class="c1"># n: 次の盤面</span>
    <span class="p">.</span><span class="nf">.</span><span class="o">.</span>
    <span class="p">}</span>
</pre></td></tr></tbody></table>
</div>
} } })
  end
end
end

class Gibier::Page24 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "謎の係数 ",code(nil, "i += i / s * 2"))
  end
end
end

class Gibier::Page25 < Gibier::PageBase
def header
  h2(nil, "1次元配列で2次元を表現")
end

def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/matrix.png"}, "")))
  end
end
end

class Gibier::Page26 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/calc_index1.png"}, "")))
  end
end
end

class Gibier::Page27 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/calc_index2.png"}, "")))
  end
end
end

class Gibier::Page28 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/calc_index3.png"}, "")))
  end
end
end

class Gibier::Page29 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/calc_index4.png"}, "")))
  end
end
end

class Gibier::Page30 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/calc_index5.png"}, "")))
  end
end
end

class Gibier::Page31 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/calc_index6.png"}, "")))
  end
end
end

class Gibier::Page32 < Gibier::PageBase
def content
  [].tap do |children|
      children << p(nil, p({class:"large"}, img({src:"#{Gibier.assets_path}/images/calc_index7.png"}, "")))
  end
end
end

class Gibier::Page33 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "まとめ")
  end
end
end

class Gibier::Page34 < Gibier::PageBase
def header
  h2(nil, "The Jonan Showを見てやってみようと思った")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "ワンライナーで書いたらどうかな"),
                    li(nil, "他のひととは違うやりかた")
      )
  end
end
end

class Gibier::Page35 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "好奇心")
  end
end
end

class Gibier::Page36 < Gibier::PageBase
def header
  h2(nil, "こんな小さなプログラムのなかにもいくつもの工夫がある")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "コンボリューション演算の援用"),
                    li(nil, "インデックス計算の工夫")
      )
  end
end
end

class Gibier::Page37 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"huge"}, "創造性")
  end
end
end

class Gibier::Page38 < Gibier::PageBase
def header
  h2(nil, "なによりも楽しむこと")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "仕事で役に立つプログラムではない"),
                    li(nil, "作ることの楽しさ")
      )
  end
end
end

class Gibier::Page39 < Gibier::PageBase
def header
  h2(nil, "プログラミングに大切なこと")
end

def content
  [].tap do |children|
      children << p({className:"large"}, "好奇心と創造性と楽しむこと")
  end
end
end

class Gibier::Page40 < Gibier::PageBase
def content
  [].tap do |children|
      children << p({className:"large"}, "Happy Hacking!!!")
  end
end
end

Gibier.page_count = 41
Gibier.title = "ワンライナーで書く「Game of Life」"
