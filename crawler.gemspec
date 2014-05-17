# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'crawler/version'

Gem::Specification.new do |spec|
  spec.name          = "ruby-crawler"
  spec.version       = Crawler::VERSION
  spec.authors       = ["Adam Ryan"]
  spec.email         = ["adam.g.ryan@gmail.com"]
  spec.summary       = %q{Simple ruby web crawler}
  spec.description   = %q{Simple ruby web crawler}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files`.split($/)
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_dependency "nokogiri"
  spec.add_dependency "addressable"
  spec.add_dependency "redis"

  spec.add_development_dependency "bundler", "~> 1.5"
  spec.add_development_dependency "rake"
  spec.add_development_dependency "minitest"
  spec.add_development_dependency "webmock"
  spec.add_development_dependency "simplecov"
end
