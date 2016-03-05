require 'spec_helper'

module BalihooLpcClient
  describe Configuration do
    describe ".api_base" do
      it "defaults to https://bac.dev.balihoo-cloud.com/localdata" do
        expect(subject.api_base).to eq "https://bac.dev.balihoo-cloud.com/localdata"
      end
    end

    describe ".api_version" do
      it "defaults to v1.0" do
        expect(subject.api_version).to eq "v1.0"
      end
    end

    describe ".brand_key" do
      it "defaults to nil" do
        expect(subject.brand_key).to be_nil
      end
    end

    describe ".api_key" do
      it "defaults to nil" do
        expect(subject.api_key).to be_nil
      end
    end

    describe ".location_key" do
      it "defaults to nil" do
        expect(subject.location_key).to be_nil
      end
    end

    describe ".user_id" do
      it "defaults to nil" do
        expect(subject.user_id).to be_nil
      end
    end

    describe ".group_id" do
      it "defaults to nil" do
        expect(subject.group_id).to be_nil
      end
    end

    describe ".client_id" do
      it "defaults to nil" do
        expect(subject.client_id).to be_nil
      end
    end

    describe ".client_api_key" do
      it "defaults to nil" do
        expect(subject.client_api_key).to be_nil
      end
    end

    describe ".url" do
      it "concats api_url and api_version" do
        expect(subject.url).to eq 'https://bac.dev.balihoo-cloud.com/localdata/v1.0'
      end
    end

    describe '#create' do
      it 'yields Configuration object when block given' do
        expect { |b| described_class.create(&b) }.to yield_control
      end

      it 'works when block not given' do
        expect { described_class.create }.not_to raise_error
      end

      it 'accepts configuration options via args hash' do
        config = described_class.create(brand_key: 'brand_key', api_key: 'api_key')
        expect([config.brand_key, config.api_key]).to eq ['brand_key', 'api_key']
      end

      it 'returns an instance of Configuration' do
        expect(described_class.create).to be_an_instance_of(Configuration)
      end

      it 'changes configuration values' do
        config = described_class.create { |c| c.api_base = 'http://example.com' }
        expect(config.api_base).to eq 'http://example.com'
      end
    end
  end
end
