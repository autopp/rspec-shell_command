# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/command/version'

Gem::Specification.new do |spec|
  spec.name = 'rspec-command'
  spec.version = RSpec::Command::VERSION
  spec.authors = ['autopp']
  spec.email = ['autopp.inc@gmail.com']

  spec.summary = 'RSpec extention for describe behavier of external command'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/autopp/rspec-command'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'rubocop'
end
