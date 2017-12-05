$LOAD_PATH.unshift File.expand_path('../../lib', __FILE__)

require 'simplecov'
SimpleCov.start

system 'gem build gem-versioner.gemspec'
system 'gem install gem-versioner*.gem'
