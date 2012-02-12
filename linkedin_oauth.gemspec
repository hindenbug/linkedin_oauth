# -*- encoding: utf-8 -*-
$:.push File.expand_path("../lib", __FILE__)
require "linkedin_oauth/version"
Gem::Specification.new do |s|
  s.name        = "linkedin_oauth"
  s.version     = LinkedinOauth::VERSION
  s.authors     = ["Manoj"]
  s.email       = ["manoj.mk27@gmail.com"]
  s.homepage    = ""
  s.summary     = %q{Linked In OAuth gem}
  s.description = %q{Linked In OAuth gem}

  s.rubyforge_project = "linkedin_oauth"
  s.files         = Dir["{lib}/**/*"]
  #s.files = Dir['Rakefile', '{bin,lib,man,test,spec}/**/*', 'README*', '*LICENSE*']
  s.test_files    = `git ls-files -- {test,spec,features}/*`.split("\n")
  s.executables   = `git ls-files -- bin/*`.split("\n").map{ |f| File.basename(f) }
  s.require_paths = ["lib"]

  s.add_runtime_dependency "oauth"
  s.add_runtime_dependency "json"
  s.add_runtime_dependency "mime-types"
  s.add_development_dependency 'rspec'
  s.add_development_dependency 'vcr'
  s.add_development_dependency 'webmock'
end
