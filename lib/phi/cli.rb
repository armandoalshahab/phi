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
      Phi::Losophy.new(term).tap { |phi| puts "The Philosophy Index of #{term} is #{phi.index}." }
    rescue
      puts "Philosophy index cannot be calculated"
    end

  end
end
