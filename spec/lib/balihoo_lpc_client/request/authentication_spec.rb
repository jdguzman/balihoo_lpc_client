require 'spec_helper'

module BalihooLpcClient
  module Request
    describe Authentication do
      let(:config) { Configuration.new }
      let(:connection) { Connection.new(config: config) }

      subject { Authentication.new(connection: connection) }

      describe '.initialize' do
        it 'sets connection for class' do
          expect(subject.connection).to eq connection
        end

        it 'set class base_uri' do
          expect(subject.class.base_uri).to eq config.url
        end
      end

      describe '.authenticate!' do
        it 'calls api endpoint genClientAPIKey' do
          expect(Authentication).to receive(:post).with('/genClientAPIKey').and_return('{}')
          subject.authenticate!
        end

        it 'sets config client_id when authentication successful' do
          stub_request(:post, "#{subject.class.base_uri}/genClientAPIKey")
              .to_return(status: 200, body: '{"clientId":"test_client_id","clientApiKey":"test_client_api_key"}')
          subject.authenticate!
          expect(config.client_id).to eq 'test_client_id'
        end

        it 'sets config client_api_key when authentication successful' do
          stub_request(:post, "#{subject.class.base_uri}/genClientAPIKey")
              .to_return(status: 200, body: '{"clientId":"test_client_id","clientApiKey":"test_client_api_key"}')
          subject.authenticate!
          expect(config.client_api_key).to eq 'test_client_api_key'
        end
      end
    end
  end
end
