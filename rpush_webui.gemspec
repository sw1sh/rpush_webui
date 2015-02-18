# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rpush_webui/version'

Gem::Specification.new do |spec|
  spec.name          = "rpush_webui"
  spec.version       = RpushWebui::VERSION
  spec.authors       = ["Nikolay Murzin"]
  spec.email         = ["murzin.nikolay@gmail.com"]
  spec.summary       = %q{WebUI for Rpush}
  spec.description   = %q{WebUI for Rpush}
  spec.homepage      = ""
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-mocks'
  spec.add_development_dependency 'rspec-its'
  spec.add_development_dependency "factory_girl", "~> 4.0"
  spec.add_development_dependency 'rack-test'
  spec.add_development_dependency 'fakeredis'

  spec.add_dependency 'rpush'
  spec.add_dependency 'rpush-redis'
  spec.add_dependency 'sinatra'
  spec.add_dependency 'sinatra-contrib'
  spec.add_dependency 'slim'
end
