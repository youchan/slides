require 'js'
require 'wasm_drb'

module Gibier2
  class Page
    def to_html
      @html
    end

    def marshal_load(obj)
      @html = obj
    end
  end

  class Pages
    def initialize(pages, page_num=0)
      @pages = pages
      @page_num = page_num
    end

    def page(n)
      @page_num = n
      current
    end

    def current
      @pages[@page_num]
    end

    def next
      if @page_num < @pages.length - 1
        @page_num += 1
      end
      current
    end

    def prev
      if @page_num > 0
        @page_num -= 1
      end
      current
    end

    def marshal_dump
      [@pages, @page_num]
    end

    def marshal_load(obj)
      @pages = obj[0]
      @page_num = obj[1]
    end
  end
end

Factory = DRb::DRbObject.new_with_uri 'ws://127.0.0.1:9161'
DRb.start_service("ws://127.0.0.1:9161/callback")

class Pages
  def self.pages
    @pages ||= Factory.pages
  end
end
