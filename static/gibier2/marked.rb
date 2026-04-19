# backtick_javascript: true

require 'native'

module Gibier2
  module Marked
    def self.native
      @native ||= Native(`marked`)
    end

    def self.parse(content)
      @document = Document.new
      walk_token = -> (token) { self.walk_token(token) }
      self.native.use(walkTokens: walk_token)
      self.native.parse(content)
      @document
    end

    def self.walk_token(token)
      n_token = Native(token)
      node = Node.create_node(n_token)
      @document << node if node
    end

    class Document
      def initialize
        @contents = []
      end
      def each(&block)
        return @contents.each unless block_given?
        @contents.each(&block)
      end

      def << node
        @contents << node
      end
    end

    module Node
      attr_reader :type

      def create_node(token)
        return nil if `token.native['processed']`

        case token.type
        when 'heading'
          Node::Header.new(token)
        when 'text'
          if token.respond_to?(:tokens) && token.tokens.count >= 1
            Node::Paragraph.new(token)
          else
            Node::Text.new(token)
          end
        when 'paragraph'
          Node::Paragraph.new(token)
        when 'list'
          Node::List.new(token)
        when 'image'
          Node::Image.new(token)
        when 'link'
          Node::Link.new(token)
        when 'code'
          Node::Code.new(token)
        when 'codespan'
          Node::CodeSpan.new(token)
        when 'strong'
          Node::Strong.new(token)
        when 'em'
          Node::Em.new(token)
        when 'table'
          Node::Table.new(token)
        when 'hr'
          Node::Hrule.new(token)
        when 'space'
        else
          `console.log(token.native)`
          Node::Text.from_string(token.text)
        end
      end

      module_function :create_node

      class Header
        include Node

        attr_reader :header_level

        def initialize(token)
          @type = :header
          @text = token.text
          @header_level = token.depth
          @children = token.tokens.map do |child|
            node = create_node(child)
            `child.native['processed'] = true`
            node
          end.compact
        end

        def extract_children
          if @children.length > 1
            InlineGroup.new(@children)
          else
            Text.from_string(@text)
          end
        end
      end

      class InlineGroup
        include Node

        def initialize(children)
          @type = :custom_inline
          @children = children
        end

        def each(&block)
          @children.each(&block)
        end
      end

      class Text
        include Node

        def initialize(token)
          @type = :text
          @text = token.text
          if token.respond_to?(:tokens)
            token.tokens.each do |child|
              `child.native['processed'] = true`
            end
          end
        end

        def self.from_string(text)
          instance = Text.allocate
          instance.instance_variable_set(:@type, :text)
          instance.instance_variable_set(:@text, text)
          instance
        end

        def string_content
          @text.gsub("\n", "<br/>\n")
        end
      end

      class Paragraph
        include Node

        def initialize(token)
          @type = :paragraph
          @children = token.tokens.map do |child|
            node = create_node(child)
            `child.native['processed'] = true`
            node
          end.compact
          text = false
          @text = token.text
        end

        def self.from_children(children)
          ins = self.allocate
          ins.instance_variable_set(:@children, children)
          ins.instance_variable_set(:@type, :paragraph)
          ins
        end

        def each(&block)
          return @children.each unless block_given?
          @children.each(&block)
        end

        def string_content
          @text
        end
      end

      class ListItem
        include Node

        def initialize(token)
          @type = :list_item
          @children = token.tokens.map do |child|
            node = create_node(child)
            `child.native['processed'] = true`
            node
          end.compact
        end

        def each(&block)
          return @children.each unless block_given?
          @children.each(&block)
        end
      end

      class List
        include Node

        def initialize(token)
          @type = :list
          @items = token.items.map do |t|
            if t.type == 'list_item'
              `t.native['processed'] = true`
              ListItem.new(t)
            end
          end
        end

        def each(&block)
          return @items.each unless block_given?
          @items.each(&block)
        end
      end

      class Link
        include Node

        attr_reader :url

        def initialize(token)
          @type = :link
          @url = token.href
          @text = Text.new(token)
          token.tokens.each {|t| `t.native['processed'] = true`}
        end

        def extract_children
          @text
        end
      end

      class Image
        include Node

        attr_reader :url

        def initialize(token)
          @type = :image
          @url = token.href
          @text = Text.new(token)
          token.tokens.each {|t| `t.native['processed'] = true`}
        end

        def extract_children
          @text
        end
      end

      class Code
        include Node

        attr_reader :fence_info

        def initialize(token)
          @type = :code_block
          @text = token.text
          @fence_info = token.lang
        end

        def string_content
          @text
        end
      end

      class CodeSpan
        include Node

        def initialize(token)
          @type = :codespan
          @text = token.text
        end

        def string_content
          @text
        end
      end

      class Strong
        include Node

        def initialize(token)
          @type = :strong
          @text = token.text
          token.tokens.each do |child|
            `child.native['processed'] = true`
          end
        end

        def extract_children
          Text.from_string @text
        end
      end

      class Em
        include Node

        def initialize(token)
          @type = :emph
          @text = token.text
          token.tokens.each do |child|
            `child.native['processed'] = true`
          end
        end

        def extract_children
          Text.from_string @text
        end
      end

      class Table
        include Node

        attr_reader :header, :rows, :align

        def initialize(token)
          @type = :table
          @header = token.header.map do |cell|
            process_cell(cell)
          end
          @align = token.align.map { |a| a }
          @rows = token.rows.map do |row|
            row.map do |cell|
              process_cell(cell)
            end
          end
        end

        def process_cell(cell)
          native_cell = Native(cell)
          `cell.native['processed'] = true`
          if native_cell.respond_to?(:tokens)
            children = native_cell.tokens.map do |child|
              node = create_node(child)
              `child.native['processed'] = true`
              node
            end.compact
            if children.length > 1
              InlineGroup.new(children)
            elsif children.length == 1
              children[0]
            else
              Text.from_string(native_cell.text || '')
            end
          else
            Text.from_string(native_cell.text || '')
          end
        end
      end

      class Hrule
        include Node

        def initialize(token)
          @type = :hrule
        end
      end

      class Softbreak
        include Node

        def initialize
          @type = :softbreak
        end
      end
    end
  end
end
