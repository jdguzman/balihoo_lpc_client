require 'spec_helper'

module BalihooLpcClient
  module Response
    describe WebsiteMetricLeads do
      let(:params) do
        {
          "total" => 1,
          "totalWeb" => 0,
          "totalPhone" => 1,
          "organicWeb" => 0,
          "paidWeb" => 0,
          "organicPhone" => 1,
          "paidPhone" => 0
        }
      end

      subject { described_class.new(params) }

      it 'has property total' do
        expect(described_class.properties).to include :total
      end

      it 'has property total_web' do
        expect(described_class.properties).to include :total_web
      end

      it 'has property organic_web' do
        expect(described_class.properties).to include :organic_web
      end

      it 'has property paid_web' do
        expect(described_class.properties).to include :paid_web
      end

      it 'has property organic_phone' do
        expect(described_class.properties).to include :organic_phone
      end

      it 'has property paid_phone' do
        expect(described_class.properties).to include :paid_phone
      end
    end
  end
end
