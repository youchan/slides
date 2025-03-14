require 'markly'
require 'cgi/util'
require 'rouge'
require 'drb'

module Gibier2
  class Pages
    def initialize(pages)
      @pages = pages
    end

    def page(n)
      DRb::DRbObject.new(@pages[n])
    end
  end
  module Content
    def extract_text(node)
      return node.string_content if node.type == :text
      text = ''
      node.each do |n|
        case n.type
        when :text
          text << n.string_content
        when :paragraph
          text << extract_text(n)
        when :inline_html
          text << n.string_content
        when :link
          text << "<a href='#{n.url}'>#{extract_text(n)}</a>"
        end
      end

      text
    end

  end

  class TextContent
    include Content

    attr_reader :text

    def initialize(node)
      @text = extract_text(node)
    end

    def to_html
      "<p>#{@text}</p>"
    end
  end

  class ListItemContent
    include Content

    def initialize(node)
      node.each.map do |child|
        case child.type
        when :paragraph
          @text_content = extract_text(child)
        when :list
          @list_content = ListContent.new(child)
        end
      end

      def to_html
        html = "<li>#{@text_content}</li>"
        if @list_content
          html += "\n" + @list_content.to_html
        end
        html
      end
    end

  end

  class ListContent
    include Content

    def initialize(node)
      @list_items = extract_list(node)
    end

    def extract_list(node)
      list_items = []
      node.each do |li|
        case li.type
        when :list_item
          list_items << ListItemContent.new(li)
        end
      end
      list_items
    end

    def list_items_html
      @list_items.map do |li|
        li.to_html
      end.join("\n")
    end

    def to_html
      "<ul>\n#{list_items_html}\n</ul>"
    end
  end

  class ImageContent
    include Content

    def initialize(node)
      @url = node.url
      @caption = extract_text(node)
    end

    def to_html
      "<img src='#{@url}' alt='#{@caption}' />"
    end
  end

  class CodeContent
    include Content

    def initialize(node)
      @code = node.string_content
      @type = node.fence_info
    end

    def to_html
      lexer = Rouge::Lexer.find(@type)
      code_html = if lexer
        formatter = Rouge::Formatters::HTML.new
        formatter.format(lexer.lex(@code))
      else
        CGI.escapeHTML(@code).gsub(/\n/, '</br>').gsub(/\s/, '&nbsp;')
      end
      "<pre class='highlight'>\n#{code_html}</pre>"
    end
  end

  class Page
    include Content

    attr_reader :title
    attr_reader :id

    def self.page_num
      @page_num ||= 0
    end

    def self.inc_page_num
      @page_num = page_num + 1
    end

    def initialize(header)
      Page.inc_page_num
      @level = header.header_level
      title = extract_text(header.extract_children)
      (@title, id) = extract_id(title)
      @id = id || "page#{Page.page_num}"
      @contents = []
    end

    def extract_id(title)
      id = nil
      if m = /\{\#(.+)\}\s*$/.match(title)
        id = m[1]
        title = title.sub(/\{\#(.+)\}\s*$/, '')
      end
      [title.strip, id]
    end

    def extract_content(node)
      case node.type
      when :paragraph
        content = nil
        node.each do |child|
          content = extract_content(child)
        end
        content
      when :text
        TextContent.new(node)
      when :list
        ListContent.new(node)
      when :image
        ImageContent.new(node)
      when :code_block
        CodeContent.new(node)
      when :link
      end
    end

    def << node
      content = extract_content(node)
      @contents << content if content
    end

    def contents_html
      @contents.map do |c|
        c.to_html + "\n"
      end.join
    end

    def to_html
      <<~HEML
        <div class='page' id='#{id}'>
        #{"<h#{@level}>#{title}</h#{@level}>" if title.length > 0}
        #{contents_html}
        </div>
      HEML
    end
  end

  class Parser
    def self.parse(content)
      pages = []
      doc = Markly.parse(content)
      doc.each do |node|
        case node.type
        when :header
          page = Page.new(node)
          pages << page
        else
          pages.last << node if pages.last
        end
      end
      Pages.new(pages)
    end
  end
end
