# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "tesluca/version"

Gem::Specification.new do |s|
  s.name        = "tesluca"
  s.version     = Tesluca::VERSION
  s.authors     = ["Noah Thorp"]
  s.email       = ["noah@rixiform.com"]
  s.homepage    = "https://github.com/tesluca/tesluca"
  s.summary     = %q{Ruby and Cassandra based innovation accounting and user activity logging}
  s.description = %q{Ruby and Cassandra based innovation accounting and user activity logging}

  s.rubyforge_project = "tesluca"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  # dependencies:
  s.add_development_dependency "sinatra"
end
