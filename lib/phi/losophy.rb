module Phi
  class Losophy

    WIKI_URL = "http://en.wikipedia.org"

    attr_reader :term

    def initialize(term)
      @term = term     
    end

    def index
      pages.count
    end
    
    def inspect
      "#<Phi::Losophy:#{term}>"
    end

    def pages
      @pages ||= Pages.new(self)
    end

    def connection
      @connection ||= Excon.new(WIKI_URL, middlewares: Excon.defaults[:middlewares] + [Excon::Middleware::RedirectFollower])
    end

  end
end
