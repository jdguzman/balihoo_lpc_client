require 'spec_helper'

module BalihooLpcClient
  module Response
    describe Metric do
      let(:params) do
        {
          'tacticIds' => [1],
          'channel' => 1,
          'clicks' => "Test",
          'spend' => "2015-09-21",
          'impressions' => "2016-10-07",
          'ctr' => "Paid Search",
          'avgCpc' => "",
          'avgCpm' => 'https://fb.balihoo-cloud.com/forms/212/render'
        }
      end

      subject { described_class.new(params) }

      it 'has property tactic_ids' do
        expect(described_class.properties).to include :tactic_ids
      end

      it 'has property channel' do
        expect(described_class.properties).to include :channel
      end

      it 'has property clicks' do
        expect(described_class.properties).to include :clicks
      end

      it 'has property spend' do
        expect(described_class.properties).to include :spend
      end

      it 'has property impressions' do
        expect(described_class.properties).to include :impressions
      end

      it 'has property ctr' do
        expect(described_class.properties).to include :ctr
      end

      it 'has property avg_cpc' do
        expect(described_class.properties).to include :avg_cpc
      end

      it 'has property avg_cpm' do
        expect(described_class.properties).to include :avg_cpm
      end
    end
  end
end
