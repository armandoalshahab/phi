module Phi
  class Losophy
    class Pages
      include Enumerable 
      extend Forwardable
      
      attr_reader :losophy, :pages

      def initialize(losophy)
        @losophy = losophy
        @pages   = []
      end

      def each 
        until current_page.philosophy?
          guard_max_pages!
          yield self.next 
        end
      end

      def current_page
        @current_page || self.current_page = first_page
      end

      def next
        self.current_page = current_page.next
      end

      private
 
      def_delegators :losophy, :term, :connection

      def first_page
        @first_page ||= Page.new(term, connection)          
      end

      def current_page=(page)
        pages << @current_page = page
      end

      def guard_max_pages!
        return if pages.count <= Phi.max
        raise MaximumPages.new("max pages (#{pages.count}) have been crawled")
      end

      MaximumPages = Class.new(StandardError)
    end
  end
end
