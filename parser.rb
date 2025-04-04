require 'markly'
require 'cgi/util'
require 'rouge'
require 'drb'

module Gibier2
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

  module Content
    def extract_text(node)
      return node.string_content if node.type == :text
      text = ''
      node.each do |n|
        case n.type
        when :text
          text << n.string_content
        when :strong
          text << "<strong>#{extract_text(n)}</strong>"
        when :paragraph
          n.each do |child|
            text << extract_text(child)
          end
          puts text
        when :inline_html
          text << n.string_content
        when :link
          text << "<a href='#{n.url}'>#{extract_text(n)}</a>"
        end
      end

      text
    end

    module_function :extract_text
  end

  class TextContent
    include Content

    attr_reader :text

    def initialize(node)
      @strong = true if node.type == :strong
      (@text, @class_name) = extract_class_name(extract_text(node))
    end

    def extract_class_name(text)
      if text =~ /\A%\w+:/
        class_name = text[1...text.index(':')]
        text = text[(text.index(':') + 1)...text.length]
        [text, class_name]
      else
        [text, nil]
      end
    end

    def to_html
      classes = []
      classes << @class_name if @class_name
      classes << 'strong' if @strong

      if classes.length > 0
        "<span class='#{classes.join(' ')}'>#{@text}</span>"
      else
        "<span>#{@text}</span>"
      end
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
      "<p class='#{@caption}'><img src='#{@url}' /></p>"
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

    def self.from_header(header, page_num)
      (title, id) = self.extract_id(Content.extract_text(header.extract_children))
      self.new(title, header.header_level, id || "page#{page_num}")
    end

    def self.empty(page_num)
      self.new('', 0, "page#{page_num}")
    end

    def initialize(title, level, id)
      @title = title
      @level = level
      @id = id
      @contents = []
    end

    def self.extract_id(title)
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
      when :strong
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

    def marshal_dump
      to_html
    end

    def to_html
      @html ||= <<~HEML
        <div class='page' id='#{id}'>
        #{"<h#{@level} class='page-header'>#{title}</h#{@level}>" if title.length > 0}
          <div class='page-content'>
            #{contents_html}
          </div>
        </div>
      HEML
    end
  end

  class Parser
    def self.parse(content)
      pages = []
      doc = Markly.parse(content)
      doc.each do |node|
        begin
        case node.type
        when :header
          page = Page.from_header(node, pages.count + 1)

          pages << page
        when :hrule
          page = Page.empty(pages.count + 1)

          pages << page
        else
          pages.last << node if pages.last
        end
        rescue => e
          pp e
        end
      end
      Pages.new(pages)
    end
  end
end
