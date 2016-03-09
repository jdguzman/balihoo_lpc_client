require 'spec_helper'

module BalihooLpcClient
  module Response
    describe PaidSearchMetric do
      let(:params) do
        {
          'tacticIds' => [1],
          'channel' => 1,
          'clicks' => 45,
          'spend' => 125.12,
          'impressions' => 100,
          'ctr' => 0.45,
          'avgCpc' => 2.33,
          'avgCpm' => 12.51
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
