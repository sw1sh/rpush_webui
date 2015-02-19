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
  spec.description   = %q{Plots of push notifications.}
  spec.homepage      = "http://github.com/sw1sh/rpush_webui"
  spec.license       = "MIT"

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.default_executable = 'rpush_webui'
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ["lib"]

  spec.required_ruby_version = '~> 2.1'

  spec.add_development_dependency "bundler", "~> 1.7"
  spec.add_development_dependency "rake", "~> 10.0"

  spec.add_development_dependency 'rspec', '~> 3.2'
  spec.add_development_dependency 'rspec-mocks', '~> 3.2'
  spec.add_development_dependency 'rspec-its', '~> 1.1'
  spec.add_development_dependency "factory_girl", "~> 4.0"
  spec.add_development_dependency 'rack-test', '~> 0.6'
  spec.add_development_dependency 'fakeredis', '~> 0.5'

  spec.add_dependency 'rpush', '~> 2.3'
  spec.add_dependency 'rpush-redis', '~> 0.4'
  spec.add_dependency 'sinatra', '~> 1.4'
  spec.add_dependency 'sinatra-contrib', '~> 1.4'
  spec.add_dependency 'slim', '~> 2.0'
end
