# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'wot_replay_parser/version'

Gem::Specification.new do |spec|
  spec.name          = 'wot_replay_parser'
  spec.version       = WotReplayParser::VERSION
  spec.authors       = ['Andreas Müller']
  spec.email         = ['anmuel86@googlemail.com']
  spec.summary       = %q{Parse WoT replay file data}
  spec.description   = %q{Simple gem with an executable to parse metadata from World of Tanks replays and extract them with the later goal to visualize them.}
  spec.homepage      = ''
  spec.license       = 'MIT'

  spec.files         = `git ls-files -z`.split("\x0")
  spec.executables   = spec.files.grep(%r{^bin/}) { |f| File.basename(f) }
  spec.test_files    = spec.files.grep(%r{^(test|spec|features)/})
  spec.require_paths = ['lib']

  spec.add_dependency             'activesupport', '~> 4.1.1'
  spec.add_dependency             'i18n'
  spec.add_development_dependency 'bundler', '~> 1.6'
  spec.add_development_dependency 'rake'
  spec.add_development_dependency 'rspec'
  spec.add_development_dependency 'rspec-its'
end
