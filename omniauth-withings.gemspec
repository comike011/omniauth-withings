# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "omniauth-withings/version"

Gem::Specification.new do |s|
  s.name        = "omniauth-withings"
  s.version     = OmniAuth::Withings::VERSION
  s.authors     = ["Matthew Thorley"]
  s.email       = ["thorley@gmail.com"]
  s.homepage    = "http://github.com/octanner/omniauth-withings"
  s.summary     = %q{OmniAuth strategy for Withings}
  s.description = %q{OmniAuth strategy for Withings}

  s.files         = `git ls-files`.split($\)
  s.executables   = s.files.grep(%r{^bin/}).map{ |f| File.basename(f) }
  s.test_files    = s.files.grep(%r{^(test|spec|features)/})
  s.require_paths = ["lib"]

  s.add_runtime_dependency 'omniauth-oauth', '~> 1.0'
  s.add_runtime_dependency 'multi_xml'
end
