require 'spec_helper'

module BalihooLpcClient
  module Response
    describe Campaign do
      let(:params) do
        {
          'id' => 1,
          'title' => "Test",
          'description' => "",
          'start' => "2015-09-21",
          'end' => "2016-10-07",
          'status' => "active"
        }
      end

      subject { described_class.new(params) }

      it 'has property id' do
        expect(described_class.properties).to include 'id'
      end

      it 'has property title' do
        expect(described_class.properties).to include 'title'
      end

      it 'has property description' do
        expect(described_class.properties).to include 'description'
      end

      it 'has property start' do
        expect(described_class.properties).to include 'start'
      end

      it 'has property end' do
        expect(described_class.properties).to include 'end'
      end

      it 'has property status' do
        expect(described_class.properties).to include 'status'
      end
    end
  end
end
