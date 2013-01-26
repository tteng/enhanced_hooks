# -*- encoding: utf-8 -*-
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'event_machine/version'

Gem::Specification.new do |gem|
  gem.name          = "event_machine"
  gem.version       = EventMachine::VERSION
  gem.authors       = ["tteng"]
  gem.email         = ["tim.rubist@gmail.com"]
  gem.description   = %q{simple elegant customize hooks}
  gem.summary       = %q{simple elegant around filters to handle routines}
  gem.homepage      = "http://github.com/tteng"

  gem.files         = [
                        "lib/event_machine.rb", 
                        "lib/event_machine/engine.rb",
                        "lib/event_machine/hooks.rb",
                        "lib/event_machine/version.rb",
                        "lib/generators/event_machine/event_machine_generator.rb",
                        "lib/generators/event_machine/templates/event.rb",
                        "lib/generators/event_machine/templates/functional_test.rb"
                      ]

  gem.executables   = gem.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  gem.test_files    = gem.files.grep(%r{^(test|spec|features)/})
  gem.require_paths = ["lib"]
  gem.add_dependency "activesupport", ">= 3.0.0"
  gem.add_dependency "rails",  ">= 3.0.0"
end
