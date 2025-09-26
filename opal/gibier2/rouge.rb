# backtick_javascript: true

require 'native'

module Gibier2
  module Rouge
    class Lexer
      def self.native
        @native ||= Native(`window.hljs`)
      end

      def initialize(fence_info)
        @fence_info = fence_info
      end

      def lex(code)
        Lexer.native.highlight(code, { language: @fence_info }).value
      end

      def self.find(fence_info)
        self.new(fence_info)
      end
    end

    module Formatters
      class HTML
        def format(tokens)
          tokens
        end
      end
    end
  end
end
