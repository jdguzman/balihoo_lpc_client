require 'spec_helper'

module BalihooLpcClient
  module Response
    describe Authentication do
      let(:params) { {'clientId' => 'clientId', 'clientApiKey' => 'clientApiKey'} }

      subject { described_class.new(params) }

      it 'has property clientId' do
        expect(described_class.properties).to include :client_id
      end

      it 'has property clientApiKey' do
        expect(described_class.properties).to include :client_api_key
      end

      describe ".client_id" do
        it 'is an alias of clientId' do
          expect(subject.client_id).to eq params['clientId']
        end
      end

      describe ".client_api_key" do
        it 'is an alias of clientApiKey' do
          expect(subject.client_api_key).to eq params['clientApiKey']
        end
      end
    end
  end
end
