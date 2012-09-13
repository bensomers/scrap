# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "scrap/version"

Gem::Specification.new do |s|
  s.name        = "scrap"
  s.version     = Scrap::VERSION
  s.authors     = ["Chris Heald", "Bradley Harris", "Ben Somers", "Joseph Chen"]
  s.email       = ["somers.ben@gmail.com", "joseph.chen@gmail.com"]
  s.homepage    = "http://www.github.com/bensomers/scrap"
  s.summary     = %q{Scrap is a Rack endpoint designed to expose various garbage and memory-related metrics about your app. Intended for tracking down memory leaks and bloat.}
  s.description = %q{Scrap is a Rack endpoint designed to expose various garbage and memory-related metrics about your app. Intended for tracking down memory leaks and bloat.}

  s.rubyforge_project = "scrap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
