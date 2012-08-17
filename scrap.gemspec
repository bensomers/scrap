# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "scrap/version"

Gem::Specification.new do |s|
  s.name        = "scrap"
  s.version     = Scrap::VERSION
  s.authors     = ["Chris Heald", "Bradley Harris", "Joseph Chen"]
  s.email       = ["joseph.chen@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Scrap is a Rails Metal endpoint designed to expose various garbage and memory-related metrics about your app. It may be particularly useful in tracking down memory leaks.}
  s.description = %q{Scrap is a Rails Metal endpoint designed to expose various garbage and memory-related metrics about your app. It may be particularly useful in tracking down memory leaks.}

  s.rubyforge_project = "scrap"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # specify any dependencies here; for example:
  # s.add_development_dependency "rspec"
  # s.add_runtime_dependency "rest-client"
end
