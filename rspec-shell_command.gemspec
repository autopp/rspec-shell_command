# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rspec/shell_command/version'

Gem::Specification.new do |spec|
  spec.name = 'rspec-shell_command'
  spec.version = RSpec::ShellCommand::VERSION
  spec.authors = ['autopp']
  spec.email = ['autopp.inc@gmail.com']

  spec.summary = 'The RSpec extention for describe behavier of external command'
  spec.description = spec.summary
  spec.homepage = 'https://github.com/autopp/rspec-shell_command'

  spec.files = `git ls-files -z`.split("\x0").reject do |f|
    f.match(%r{^(test|spec|features)/})
  end
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_runtime_dependency 'rspec', '~> 3.0'
  spec.add_development_dependency 'bundler', '~> 1.11'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rubocop'
end
