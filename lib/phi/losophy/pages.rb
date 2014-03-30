module Phi
  class Losophy
    class Pages
      include Enumerable 
      extend Forwardable
      
      attr_reader :losophy, :pages, :browsed

      def initialize(losophy)
        @losophy = losophy
        @pages   = []
        @browsed = []
      end

      def each 
        until current_page.philosophy?
          if browsed?
            puts "#{current_page.term} has entered ani infinate loop and will not hit philosophy"
            puts "The Philosophy Index in this case will reflect the pages from #{term} to the loop causing #{current_page.term}"
            break
          else 
            puts "Now browsing #{current_page.term}"
            yield self.next
            guard_max_pages!
          end
        end
          puts "Found Philosophy" unless browsed? 
      end

      def browsed?
        browsed.include? current_page.term
      end

      def current_page
        @current_page || self.current_page = first_page
      end

      def next
        browsed << current_page.term
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
