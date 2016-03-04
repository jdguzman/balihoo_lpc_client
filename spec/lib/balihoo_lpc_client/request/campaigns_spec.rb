require 'spec_helper'

module BalihooLpcClient
  module Request
    describe Campaigns do
      let(:config) do
        Configuration.create do |c|
          c.brand_key = 'foo'
          c.api_key = 'key'
          c.location_key = '1'
          c.user_id = 'foo'
          c.group_id = 'foo'
          c.client_id = 'id' #simulating that authenticate has been called
          c.client_api_key = 'key' #simulating that authenticate has been called
        end
      end
      let(:connection) { Connection.new(config: config) }

      subject { Campaigns.new(connection: connection, params: {}) }

      describe '.initialize' do
        it 'sets connection for class' do
          expect(subject.connection).to eq connection
        end

        it 'sets params for class' do
          expect(subject.params).to eq({})
        end
      end

      describe '.fetch' do
        let(:params) do
          arr = subject.params.map do |k, v|
            "#{k}=#{v}"
          end
          arr.any? ? "?#{arr.join('&')}" : ''
        end

        let(:request_headers) do
          {
            'X-ClientId' => config.client_id,
            'X-ClientApiKey' => config.client_api_key
          }
        end

        context 'success' do
          let(:return_opts) do
            {
              status: 200,
              body: '[{"id":224,"title":"Evergreen Campaign","description":"","start":"2015-09-21","end":"2016-10-07","status":"active"}]',
              headers: { 'Content-Type' => 'application/json; charset=utf-8' }
            }
          end

          before do
            stub_request(:get, "#{subject.class.base_uri}/campaigns#{params}")
              .with(:headers => request_headers)
              .to_return(**return_opts)
          end

          it 'calls api endpoint campaigns' do
            expect(Campaigns).to receive(:get).with('/campaigns', any_args).and_call_original
            subject.fetch
          end

          it 'returns an array of Response::Campaign objects' do
            returned = JSON.parse return_opts[:body]
            expect(subject.fetch).to eq returned.map { |o| Response::Campaign.new(o) }
          end

          context 'with params' do
            let(:params_hash) { { locations: '1', from: '2016-01-01', to: '2016-01-31' } }
            let(:params) do
              arr = params_hash.map do |k, v|
                "#{k}=#{v}"
              end
              arr.any? ? "?#{arr.join('&')}" : ''
            end

            it 'passes params to api call' do
              subject.params = params_hash
              expect(Campaigns).to receive(:get).with('/campaigns', { headers: request_headers, query: params_hash }).and_call_original
              subject.fetch
            end
          end
        end
      end
    end
  end
end
