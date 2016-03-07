require 'spec_helper'

module BalihooLpcClient
  describe Api do
    let(:config) do
      Configuration.create do |c|
        c.brand_key = 'foo'
        c.api_key = 'key'
        c.location_key = '1'
        c.user_id = 'foo'
        c.group_id = 'foo'
      end
    end

    subject { described_class.new(config: config) }

    describe '.initialize' do
      it 'sets config for class' do
        expect(subject.config).to eq config
      end
    end

    describe '.authenticate!' do
      it 'creates an instance of Request::Authentication' do
        expect(Request::Authentication).to receive(:new).with(api: subject).and_call_original
        allow_any_instance_of(Request::Authentication).to receive(:authenticate!)
        subject.authenticate!
      end

      it 'calls authenticate! on Request::Authentication instance' do
        expect_any_instance_of(Request::Authentication).to receive(:authenticate!)
        subject.authenticate!
      end
    end

    describe '.campaigns' do
      before do
        allow_any_instance_of(Request::Campaigns).to receive(:fetch)
      end

      it 'accepts hash options with default of {}' do
        expect { subject.campaigns(params: {}) }.not_to raise_error
      end

      it 'raises ApiOptionError if opts locations missing and config location_key nil' do
        config.location_key = nil
        expect { subject.campaigns }.to raise_error ApiOptionError
      end

      it 'raises ApiOptionError if opts locations is not an array' do
        config.location_key = nil
        expect { subject.campaigns(params: { locations: '1' }) }.to raise_error ApiOptionError
      end

      it 'creates an instance of Request::Campaigns' do
        expect(Request::Campaigns).to receive(:new).with(api: subject, params: {}).and_call_original
        subject.campaigns
      end

      it 'calls fetch on a Request::Campaigns instance' do
        expect_any_instance_of(Request::Campaigns).to receive(:fetch)
        subject.campaigns
      end
    end

    describe '.tactics' do
      it 'accepts hash options with default of {}' do
        allow_any_instance_of(Request::Tactics).to receive(:fetch)
        expect { subject.tactics(campaign_id: 1, params: {}) }.not_to raise_error
      end

      it 'raises MissingApiOptionError if opts locations missing and config location_key nil' do
        config.location_key = nil
        expect { subject.tactics(campaign_id: 1) }.to raise_error ApiOptionError
      end

      it 'creates an instance of Request::Tactics' do
        allow_any_instance_of(Request::Tactics).to receive(:fetch)
        expect(Request::Tactics).to receive(:new).with(api: subject, params: {}, campaign_id: 1).and_call_original
        subject.tactics(campaign_id: 1)
      end

      it 'calls fetch on a Request::Tactics instance' do
        expect_any_instance_of(Request::Tactics).to receive(:fetch)
        subject.tactics(campaign_id: 1)
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
        expect(Request::CampaignsWithTactics).to receive(:new).with(api: subject, params: {}).and_call_original
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
        expect(Request::Metrics).to receive(:new).with(api: subject, params: {}, tactic_id: 1).and_call_original
        subject.metrics(tactic_id: 1)
      end

      it 'calls fetch on a Request::Metrics instance' do
        expect_any_instance_of(Request::Metrics).to receive(:fetch)
        subject.metrics(tactic_id: 1)
      end
    end

    describe '.website_metrics' do
      it 'accepts hash options with default of {}' do
        allow_any_instance_of(Request::WebsiteMetrics).to receive(:fetch)
        expect { subject.website_metrics(params: {}) }.not_to raise_error
      end

      it 'raises MissingApiOptionError if opts locations missing and config location_key nil' do
        config.location_key = nil
        expect { subject.website_metrics }.to raise_error ApiOptionError
      end

      it 'creates an instance of Request::WebsiteMetrics' do
        allow_any_instance_of(Request::WebsiteMetrics).to receive(:fetch)
        expect(Request::WebsiteMetrics).to receive(:new).with(api: subject, params: {}).and_call_original
        subject.website_metrics
      end

      it 'calls fetch on a Request::WebsiteMetrics instance' do
        expect_any_instance_of(Request::WebsiteMetrics).to receive(:fetch)
        subject.website_metrics
      end
    end
  end
end
