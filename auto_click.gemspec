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
  s.summary     = %q{Smulating mouse click, cursor movement and keystrokes}
  s.description = %q{Provide several Ruby methods for simulating mouse click, cursor movement and keystrokes in Windows. 
                     This gem use DL library and SendInput method so there is no dependency on FFI, AutoIt or Win32-api. 
                     Methods include mouse_move(x,y), left_click, right_click, cursor_position, mouse_scroll, key_up, key_down...etc.
                     See https://github.com/erinata/auto_click for more details.
                     (More control over mouse movement such as speed or locus will be implemented in future releases)}
  
  s.required_ruby_version = '>= 1.9.0'

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
end
