# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'myparcel/version'

Gem::Specification.new do |spec|
  spec.name          = 'myparcel'
  spec.version       = Myparcel::VERSION
  spec.authors       = ['Ivan Malykh', 'Leon van der Velde']
  spec.email         = ['ivan@lesslines.com', 'leon@paypro.nl']

  spec.summary       = 'MyParcel API Ruby wrapper.'
  spec.description   = 'Ruby wrapper for MyParcel API.'
  spec.homepage      = 'https://github.com/paypro/myparcel'
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_dependency 'json', '~> 1.8.1'

  spec.add_development_dependency 'bundler'
  spec.add_development_dependency 'rspec', '~> 1.3.1'
  spec.add_development_dependency 'public_suffix', '~> 1.3.1'
  spec.add_development_dependency 'addressable', '~> 2.3.6'
  spec.add_development_dependency 'webmock', '~> 1.20.4'
  spec.add_development_dependency 'dotenv'
  spec.add_development_dependency 'vcr', '~> 2.9.3'
end
