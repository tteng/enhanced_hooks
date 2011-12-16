# Generated by jeweler
# DO NOT EDIT THIS FILE DIRECTLY
# Instead, edit Jeweler::Tasks in Rakefile, and run 'rake gemspec'
# -*- encoding: utf-8 -*-

Gem::Specification.new do |s|
  s.name = "event_machine"
  s.version = "0.3.1"

  s.required_rubygems_version = Gem::Requirement.new(">= 0") if s.respond_to? :required_rubygems_version=
  s.authors = ["tim.teng"]
  s.date = "2011-12-16"
  s.description = "Event Machine is observer to record any action you want to keep an eye on"
  s.email = "tim.rubist@gmail.com"
  s.extra_rdoc_files = [
    "LICENSE",
    "README.rdoc"
  ]
  s.files = [
    ".document",
    "LICENSE",
    "README.rdoc",
    "Rakefile",
    "VERSION",
    "event_machine.gemspec",
    "generators/event_machine/USAGE",
    "generators/event_machine/event_machine_generator.rb",
    "generators/event_machine/templates/event.rb",
    "generators/event_machine/templates/functional_test.rb",
    "lib/event_machine.rb",
    "test/helper.rb",
    "test/test_event_machine.rb"
  ]
  s.homepage = "http://github.com/tteng/event_machine"
  s.require_paths = ["lib"]
  s.rubygems_version = "1.8.10"
  s.summary = "an observer to record events"

  if s.respond_to? :specification_version then
    s.specification_version = 3

    if Gem::Version.new(Gem::VERSION) >= Gem::Version.new('1.2.0') then
      s.add_development_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    else
      s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
    end
  else
    s.add_dependency(%q<thoughtbot-shoulda>, [">= 0"])
  end
end

