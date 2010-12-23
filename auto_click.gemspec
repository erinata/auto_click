# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "auto_click/version"

Gem::Specification.new do |s|
  s.name        = "auto_click"
  s.version     = AutoClick::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["erinata"]
  s.email       = ["erinata@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Several ruby methods for simulating mouse click and cursor movement.}
  s.description = %q{Several ruby methods for simulating mouse click and cursor movement.}

  s.rubyforge_project = "auto_click"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
