# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "exc1_sum_squares/version"

Gem::Specification.new do |s|
  s.name        = "exc1_sum_squares"
  s.version     = Exc1SumSquares::VERSION
  s.platform    = Gem::Platform::RUBY
  s.authors     = ["TheNotary"]
  s.email       = ["no@email.plz"]
  s.homepage    = ""
  s.summary     = %q{Just an example gem}
  s.description = %q{Just an example gem}

  s.rubyforge_project = "exc1_sum_squares"

  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]
  
  s.add_development_dependency 'rake'
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'rr'
  s.add_development_dependency 'thor'
end
