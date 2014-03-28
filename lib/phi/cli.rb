require 'phi'

module Phi
  module Cli
    extend self

    def term
      ARGV.fetch(0) { 
        puts 'Must provide term to phi command. Usage: `phi term`' 
        exit 1
      }
    end

    def run
      i = Phi::Losophy.new(term).index
      puts "The Philosophy Index of #{term} is #{i}."
    end

  end
end
