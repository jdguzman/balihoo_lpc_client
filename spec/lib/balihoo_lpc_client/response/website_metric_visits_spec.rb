require 'spec_helper'

module BalihooLpcClient
  module Response
    describe WebsiteMetricVisits do
      let(:params) do
        {
          "total" => 667,
          "organic" => 88,
          "direct" => 19,
          "referral" => 560,
          "paid" => 0,
          "newVisitsPercent" => 0.6896551724137931
        }
      end

      subject { described_class.new(params) }

      it 'has property total' do
        expect(described_class.properties).to include :total
      end

      it 'has property organic' do
        expect(described_class.properties).to include :organic
      end

      it 'has property direct' do
        expect(described_class.properties).to include :direct
      end

      it 'has property referral' do
        expect(described_class.properties).to include :referral
      end

      it 'has property paid' do
        expect(described_class.properties).to include :paid
      end

      it 'has property new_visits_percent' do
        expect(described_class.properties).to include :new_visits_percent
      end
    end
  end
end
