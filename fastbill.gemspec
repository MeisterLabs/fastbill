# -*- encoding: utf-8 -*-
require File.expand_path('../lib/fastbill/version', __FILE__)

Gem::Specification.new do |gem|
  gem.authors       = ["Philip Kleimeyer"]
  gem.email         = ["philip.kleimeyer@gmail.com"]
  gem.description   = %q{Ruby Api wrapper for the fastbill.com API}
  gem.summary       = %q{Ruby Api wrapper for the fastbill.com API}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($\)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.name          = "fastbill"
  gem.require_paths = ["lib"]
  gem.version       = Fastbill::VERSION

  gem.add_dependency "excon"
  gem.add_dependency "json"
  gem.add_dependency "hashie"
  gem.add_dependency "jruby-openssl" if RUBY_PLATFORM == 'java'

  gem.add_development_dependency "minitest"
  gem.add_development_dependency "rake"
end
