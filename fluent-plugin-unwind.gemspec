# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)

Gem::Specification.new do |spec|
  spec.name          = 'fluent-plugin-unwind'
  spec.version       = '0.0.1'
  spec.authors       = ['Sho SAWADA']
  spec.email         = %w(shao@thebitcellar.com)
  spec.description   = %q{A fluentd plugin that unwind array to multiple items.}
  spec.summary       = %q{A fluentd plugin that unwind array to multiple items.}
  spec.homepage      = 'https://github.com/bitcellar-labs/fluent-plugin-unwind'
  spec.license       = 'MIT'

  spec.files         = `git ls-files`.split($/)
  spec.require_paths = %w(lib)

  spec.add_dependency 'fluentd', '~> 0.10.0'
  spec.add_development_dependency 'bundler', '~> 1.3'
  spec.add_development_dependency 'rake'
end
