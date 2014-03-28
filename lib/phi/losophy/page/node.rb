module Phi
  class Losophy
    class Page
      class Node
        attr_reader :parent
        attr_accessor :in_parentheses

        def initialize(parent)
          @parent = parent
        end

        def anchor
          parent.children.each do |child|
            if child.name == 'text'
              text(child)
            elsif child.name == 'a' && out_of_parentheses?
              return child
            end
          end
        end

        def text(node)
          node.text.split('').each { |c|
            if c == '('
              self.in_parentheses = true
            elsif c == ')'
              self.in_parentheses = false
            end
          }
        end

        def out_of_parentheses?
          !in_parentheses
        end
      end
    end
  end
end
