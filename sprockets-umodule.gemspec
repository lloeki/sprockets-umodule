# -*- encoding: utf-8 -*-
$:.push File.expand_path('../lib', __FILE__)
require 'sprockets/umodule/version'

Gem::Specification.new do |s|
  s.name        = 'sprockets-umodule'
  s.version     = Sprockets::Umodule::VERSION
  s.authors     = ['Loic Nageleisen']
  s.email       = ['loic.nageleisen@gmail.com']
  s.homepage    = 'http://github.com/lloeki/sprockets-umodule'
  s.license     = 'MIT'
  s.summary     = %q{uModule wrapping for the Sprockets asset pipeline.}
  s.description = %q{uModule wrapping for the Sprockets asset pipeline.}
  s.files         = `git ls-files`.split("\n")
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n")
                                           .map { |f| File.basename(f) }
  s.require_paths = ['lib']
  s.add_dependency 'umodule-source'
  s.add_dependency 'tilt', '~> 1.1'
  s.add_development_dependency 'sprockets-helpers', '~> 0.6'
  s.add_development_dependency 'rspec',             '~> 2.6'
  s.add_development_dependency 'test-construct',    '~> 1.2'
  s.add_development_dependency 'rake'
end
