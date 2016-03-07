require 'spec_helper'

module BalihooLpcClient
  module Response
    describe WebsiteMetric do
      let(:params) do
        {
          'visits' => { "total" => 667, "organic" => 88, "direct" => 19, "referral" => 560, "paid" => 0, "newVisitsPercent" => 0.6896551724137931 },
          'leads' => { "total" => 1, "totalWeb" => 0, "totalPhone" => 1, "organicWeb" => 0, "paidWeb" => 0, "organicPhone" => 1, "paidPhone" => 0 }
        }
      end

      subject { described_class.new(params) }

      it 'has property visits' do
        expect(described_class.properties).to include :visits
      end

      it 'has property leads' do
        expect(described_class.properties).to include :leads
      end
    end
  end
end
