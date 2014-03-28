module Phi
  class Losophy
    class Page
      
      attr_reader :term, :connection
      
      def initialize(term, connection)
        @term       = term
        @connection = connection
      end

      def philosophy?
        term.downcase == "philosophy"
      end

      def next
        @next ||= Page.new(next_term, connection)
      end

      def inspect
        "#<#{self.class.name}:#{term}>"
      end

      private

      def next_term
        Node.new(html.css(selector)).anchor.attr("href")[6..-1]
      end

      def selector
        %q{#mw-content-text > p:first}# > a:first[href^='/wiki']}
      end

      def html
        @html ||= Nokogiri::HTML(page)
      end

      def page
        @page ||= request.body
      end

      def request
        sleep 0.25 
        connection.get(path: path)
      end

      def path
        "/wiki/#{term}"
      end

    end
  end
end
