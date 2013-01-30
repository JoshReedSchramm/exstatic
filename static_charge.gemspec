# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

require 'static_charge/version'

Gem::Specification.new do |gem|
  gem.name          = "static_charge"
  gem.version       = StaticCharge::VERSION
  gem.authors       = ["Josh Schramm"]
  gem.email         = ["josh.schramm@gmail.com"]
  gem.description   = %q{Allows managed content pages in a Ruby on Rails 3.1+ application.}
  gem.summary       = %q{Allows managed content pages in a Ruby on Rails 3.1+ application.}
  gem.homepage      = "http://github.com/JoshReedSchramm/static_charge"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]

  gem.add_development_dependency("rspec", "~> 2.12.0")
  gem.add_development_dependency("rspec-rails", "~> 2.12.0")
  gem.add_development_dependency "tzinfo"
end
