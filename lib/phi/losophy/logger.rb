module Phi
  class Losophy
    module Logger

      def each
        super
        log "Found Philosophy"
      rescue Pages::MaximumPages, Pages::InfiniteLoop => e
        log e.message
        raise e
      rescue => e
        log "An unexpected error has occurred: #{e.message}"
        raise e
      end

      def current_page=(*)
        super
        log "Now browsing #{current_page.term}"
      end

      def log(message)
        puts message
      end

    end
  end
end
