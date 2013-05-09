# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'enhanced_hooks/version'

Gem::Specification.new do |gem|
  gem.name          = "enhanced_hooks"
  gem.version       = EnhancedHooks::VERSION
  gem.authors       = ["readline"]
  gem.email         = ["tim.rubist@gmail.com"]
  gem.description   = %q{enhanced before/after filter hooks}
  gem.summary       = %q{enhanced before/after filter hooks}
  gem.homepage      = "http://github.com/tteng/enhanced_hooks"

  gem.files         = `git ls-files`.split($/)
  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
end
