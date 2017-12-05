require 'spec_helper'

# rubocop:disable Metrics/BlockLength
RSpec.describe Gem::Versioner do
  describe '.release_version' do
    subject { described_class.release_version }

    specify do
      expect { Gem::Versioner.release_version }.to raise_error(ArgumentError)
    end

    context %(when ENV['PRE_RELEASE']) do
      let(:env) { {} }

      before do
        stub_const('ENV', env)
      end

      subject { described_class.release_version(version) }

      context 'does not exist' do
        let(:version) { 'one' }

        it 'uses the supplied version string' do
          expect(subject).to eq 'one'
        end
      end

      context 'exists' do
        let(:env) { { 'PRE_RELEASE' => '1234' } }
        let(:version) { 'one' }

        before do
          allow(Time).to receive(:now).and_return(Time.new(2017, 0o1, 0o2, 12, 13, 14))
        end

        it 'postfixes the version string with "pre", a "pre-release" version and a timestamp' do
          expect(subject).to eq 'one.pre.1234.20170102121314'
        end

        context 'and contains non-alphanumeric characters' do
          let(:env) { { 'PRE_RELEASE' => 'ab-ce:09/87' } }

          it 'postfixes the version string with "pre", a sanitised "pre-release" version and a timestamp' do
            expect(subject).to eq 'one.pre.abce0987.20170102121314'
          end
        end
      end
    end
  end
end
# rubocop:enable Metrics/BlockLength
