module Phi
  class Losophy
    class Pages
      include Enumerable 
      extend Forwardable
      prepend Logger

      attr_reader :losophy, :pages, :browsed

      def initialize(losophy)
        @losophy = losophy
        @pages   = []
      end

      def each 
        yield self.next until current_page.philosophy?
      end

      def current_page
        @current_page || self.current_page = first_page
      end

      def next
        infinite_loop!
        max_pages!
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

      def max_pages!
        return if pages.count < Phi.max
        raise MaximumPages.new("Max pages (#{pages.count}) have been crawled")
      end

      def infinite_loop!
        return unless pages.map(&:term).include? current_page.next_term
        raise InfiniteLoop.new("#{current_page.next_term} would enter an infinite loop and will not hit philosophy")
      end

      MaximumPages = Class.new(StandardError)
      InfiniteLoop = Class.new(StandardError)
    end
  end
end
