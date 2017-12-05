require 'spec_helper'
require 'rubygems/versioner/build_plugin'

RSpec.describe Gem::Package do
  describe '.build' do
    let(:spec) { double(:gemspec, version: 'xyz').as_null_object }

    it 'delegates building a gem version stanza' do
      expect(Gem::Versioner).to receive(:release_version).with('xyz')
      allow(Gem::Package).to receive(:build_original).with(spec, false).and_return(true)
      described_class.build(spec)
    end
  end
end
