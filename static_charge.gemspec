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
  gem.summary       = %q{Static Charge embeds into your rails application and allows you to create new content managed pages using your existing layouts and styles.}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
