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
  s.summary     = %q{Smulating mouse click and cursor movement in Ruby}
  s.description = %q{Provide several ruby methods for simulating mouse click and cursor movement in Windows. Currently only contains 5 methods (mouse_move(x,y), left_click, right_click, cursor_position and mouse_scroll).}
  
  s.add_dependency('win32-api', '>=1.4.7')

  # s.rubyforge_project = "auto_click"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
