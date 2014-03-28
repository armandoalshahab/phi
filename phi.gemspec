# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'phi/version'

Gem::Specification.new do |spec|
  spec.name          = "phi"
  spec.version       = Phi::VERSION
  spec.authors       = ["Lee Wangenheim", "Rebecca Hunter", "Adam Hunter"]
  spec.email         = ["lwangenheim@gmail.com", "hrmrebecca@gmail.com", "adamhunter@me.com"]
  spec.summary       = %q{Command line function to output the Philosophy Index of a Wikipedia article.}
  # spec.description   = %q{TODO: Write a longer description. Optional.}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "excon", "~> 0.32"
  spec.add_dependency "nokogiri", "~> 1.6.1"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "pry", "~> 0.9"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "rspec"
end
