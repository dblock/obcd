$:.push File.expand_path("../lib", __FILE__)
require 'obcd/version'

Gem::Specification.new do |s|
  s.name = "obcd"
  s.bindir = 'bin'
  s.executables << 'obcd'
  s.version = Obcd::VERSION
  s.authors = ["Daniel Doubrovkine"]
  s.email = "dblock@dblock.org"
  s.platform = Gem::Platform::RUBY
  s.required_rubygems_version = '>= 1.3.6'
  s.files = Dir["{bin,lib}/**/*"] + Dir["*.md"]
  s.require_paths = [ "lib" ]
  s.homepage = "http://github.com/dblock/obcd"
  s.licenses = [ "MIT" ]
  s.summary = "Deal with obsessive compulsive issues of programmers in Objective-C."
  s.add_dependency "gli"
  s.add_dependency "activesupport"
  s.required_ruby_version = '>= 1.9.3'
end
