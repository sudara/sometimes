# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'sometimes/version'

Gem::Specification.new do |gem|
  gem.name          = "sometimes"
  gem.version       = Sometimes::VERSION
  gem.authors       = ["Sudara"]
  gem.email         = ["sudara@alonetone.com"]
  gem.description   = %q{Be random. Be unpredictable. But only sometimes}
  gem.summary       = %q{Be random. Be unpredictable. But only sometimes}
  gem.homepage      = ""

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test)/})
  gem.add_development_dependency("rake")
  gem.add_development_dependency("test-unit")
  gem.require_paths = ["lib"]
end
