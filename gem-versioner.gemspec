# coding: utf-8
lib = File.expand_path('../lib', __FILE__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'rubygems/versioner/version'

Gem::Specification.new do |spec|
  spec.name = 'gem-versioner'
  spec.version = Gem::Versioner::VERSION
  spec.authors = 'Funding Circle Engineering'
  spec.email = 'engineering+gem-versioner@fundingcircle.com'

  spec.summary = 'Gem that works as an extension for the build task of a Gem to allow pre release versions'
  spec.homepage = 'https://github.com/FundingCircle/gem-versioner'
  spec.license = 'BSD-3'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  raise 'RubyGems 2.0 or newer is required to protect against public gem pushes.' unless spec.respond_to?(:metadata)
  spec.metadata['allowed_push_host'] = 'https://rubygems.org'

  spec.files = `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  spec.bindir = 'exe'
  spec.executables = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']

  spec.add_development_dependency 'bundler', '~> 1.12'
  spec.add_development_dependency 'rake', '~> 10.0'
  spec.add_development_dependency 'rspec', '~> 3.0'
end
