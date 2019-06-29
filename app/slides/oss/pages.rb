class Gibier::Page0 < Gibier::PageBase
def header
  h1(nil, "OSS")
end

def content
  [].tap do |children|
  end
end
end

class Gibier::Page1 < Gibier::PageBase
def header
  h2(nil, "我田引水")
end

def content
  [].tap do |children|
      children << ul(nil,
                    li(nil, "Rubyはソースコードを読む文化：")
      )
  end
end
end

Gibier.page_count = 2
Gibier.title = "OSS"
