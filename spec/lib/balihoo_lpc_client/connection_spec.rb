require 'spec_helper'

module BalihooLpcClient
  describe Connection do
    let(:config) do
      Configuration.create do |c|
        c.brand_key = 'foo'
        c.api_key = 'key'
        c.location_key = '1'
        c.user_id = 'foo'
        c.group_id = 'foo'
      end
    end

    subject { Connection.new(config: config) }

    describe '.initialize' do
      it 'sets config for class' do
        expect(subject.config).to eq config
      end
    end

    describe '.authenticate!' do
      it 'creates an instance of Request::Authentication' do
        expect(Request::Authentication).to receive(:new).with(connection: subject).and_call_original
        allow_any_instance_of(Request::Authentication).to receive(:authenticate!)
        subject.authenticate!
      end

      it 'calls authenticate! on Request::Authentication instance' do
        expect_any_instance_of(Request::Authentication).to receive(:authenticate!)
        subject.authenticate!
      end
    end

    describe '.campaigns' do
      it 'accepts hash options with default of {}' do
        allow_any_instance_of(Request::Campaigns).to receive(:fetch)
        expect { subject.campaigns(params: {}) }.not_to raise_error
      end

      it 'raises MissingApiOptionError if opts locations missing and config location_key nil' do
        config.location_key = nil
        expect { subject.campaigns }.to raise_error ApiOptionError
      end

      it 'creates an instance of Request::Campaigns' do
        allow_any_instance_of(Request::Campaigns).to receive(:fetch)
        expect(Request::Campaigns).to receive(:new).with(connection: subject, params: {}).and_call_original
        subject.campaigns
      end

      it 'calls fetch on a Request::Campaigns instance' do
        expect_any_instance_of(Request::Campaigns).to receive(:fetch)
        subject.campaigns
      end
    end

    describe '.campaigns_with_tactics' do
      it 'accepts hash options with default of {}' do
        allow_any_instance_of(Request::CampaignsWithTactics).to receive(:fetch)
        expect { subject.campaigns_with_tactics(params: {}) }.not_to raise_error
      end

      it 'raises MissingApiOptionError if opts locations missing and config location_key nil' do
        config.location_key = nil
        expect { subject.campaigns_with_tactics }.to raise_error ApiOptionError
      end

      it 'creates an instance of Request::CampaignsWithTactics' do
        allow_any_instance_of(Request::CampaignsWithTactics).to receive(:fetch)
        expect(Request::CampaignsWithTactics).to receive(:new).with(connection: subject, params: {}).and_call_original
        subject.campaigns_with_tactics
      end

      it 'calls fetch on a Request::CampaignsWithTactics instance' do
        expect_any_instance_of(Request::CampaignsWithTactics).to receive(:fetch)
        subject.campaigns_with_tactics
      end
    end

    describe '.metrics' do
      it 'accepts hash options with default of {}' do
        allow_any_instance_of(Request::Metrics).to receive(:fetch)
        expect { subject.metrics(tactic_id: 1, params: {}) }.not_to raise_error
      end

      it 'raises MissingApiOptionError if opts locations missing and config location_key nil' do
        config.location_key = nil
        expect { subject.metrics(tactic_id: 1) }.to raise_error ApiOptionError
      end

      it 'creates an instance of Request::Metrics' do
        allow_any_instance_of(Request::Metrics).to receive(:fetch)
        expect(Request::Metrics).to receive(:new).with(connection: subject, params: {}, tactic_id: 1).and_call_original
        subject.metrics(tactic_id: 1)
      end

      it 'calls fetch on a Request::Metrics instance' do
        expect_any_instance_of(Request::Metrics).to receive(:fetch)
        subject.metrics(tactic_id: 1)
      end
    end
  end
end
