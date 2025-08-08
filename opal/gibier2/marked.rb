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
        if token.type == 'text'
          `
            if (token.native.text === 'youchan') {
              console.log(token.native);
            }
          `
        end
        return nil if `token.native['processed']`

        case token.type
        when 'heading'
          Node::Header.new(token)
        when 'text'
          Node::Text.new(token)
        when 'paragraph'
          Node::Paragraph.new(token)
        when 'list'
          `console.log(token.native)`
          Node::List.new(token)
        when 'image'
          Node::Image.new(token)
        else
          #`console.log(token.native)`
          #puts "type: #{n_token.type}"
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
          token.tokens.each{|t| `t.native['processed'] = true`}
        end

        def extract_children
          Text.from_string(@text)
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
          @text
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
          @text = token.text
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
    end
  end
end
