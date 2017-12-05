require 'spec_helper'
require 'yaml'

RSpec.describe Gem::Versioner do
  let(:current_gem_version) { Gem::Versioner::VERSION }
  # rubocop:disable Security/YAMLLoad
  let(:gem_spec) { YAML.load(`gem spec gem-versioner*.gem version`) }
  # rubocop:enable Security/YAMLLoad

  before do
    `rm *.gem`
  end
  after do
    `rm *.gem`
  end

  context 'PRE_RELEASE is defined' do
    before do
      system('PRE_RELEASE=foo gem build gem-versioner.gemspec')
    end

    it 'tags the gem version with a pre_branch_timestamp tag' do
      expect(gem_spec.version).to include("#{current_gem_version}.pre.foo")
    end
  end

  context 'PRE_RELEASE is not defined' do
    before do
      system('gem build gem-versioner.gemspec')
    end

    it 'tags the gem version as it is' do
      expect(gem_spec.version).to eq(current_gem_version)
    end
  end
end
