require 'spec_helper'

describe BalihooLpcClient do
  it 'has a version number' do
    expect(BalihooLpcClient::VERSION).not_to be nil
  end

  describe '#configure' do
    it 'yields Configuration object' do
      expect { |b| described_class.configure(&b) }.to yield_control
    end

    it 'calls configuration' do
      expect(described_class).to receive(:configuration)
      described_class.configure { |c| }
    end
  end

  describe '#configuration' do
    it 'returns instance of Configuration' do
      expect(described_class.configuration).to be_an_instance_of(BalihooLpcClient::Configuration)
    end
  end
end
