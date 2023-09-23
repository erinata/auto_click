# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "auto_click/version"

Gem::Specification.new do |s|
	s.name        = "win_auto_click"
	s.version     = AutoClick::VERSION
	s.platform    = Gem::Platform::RUBY
	s.authors     = ["BrianPurgert"]
	s.email       = ["brianpurgert2@gmail.com"]
	s.homepage    = "https://github.com/BrianPurgert/auto_click"
	s.summary     = %q{Smulating mouse click, cursor movement and keystrokes}
	s.description = %q{this is a Fork of https://github.com/erinata/auto_click
			Provide several Ruby methods for simulating mouse click, cursor movement and keystrokes in Windows.
                     This gem use DL library and SendInput method so there is no dependency on FFI, AutoIt or Win32-api. 
                     Methods include mouse_move(x,y), left_click, right_click, type(string), mouse_scroll(steps), key_up, key_down...etc.
                    )}

	s.required_ruby_version = '>= 2.3.0'

	s.files         = `git ls-files`.split("\n")
	s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
	s.executables   = `git ls-files -- bin/*`.split("\n").map { |f| File.basename(f) }
	s.require_paths = ["lib"]
	s.licenses      = "MIT"
end
