module Phi
  class Losophy
    class Pages
      include Enumerable 
      extend Forwardable
      
      attr_reader :losophy

      def initialize(losophy)
        @losophy = losophy
      end

      def each 
        yield self.next until current_page.philosophy?
      end

      def current_page
        @current_page ||= first_page
      end

      def next
        @current_page = current_page.next
      end

      private
 
      def_delegators :losophy, :term, :connection

      def first_page
        @first_page ||= Page.new(term, connection)          
      end
    end
  end
end
