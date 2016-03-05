require 'spec_helper'

module BalihooLpcClient
  module Request
    describe Metrics do
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
      let(:api) { Api.new(config: config) }

      subject { described_class.new(api: api, params: {}, tactic_id: '1') }

      describe '.initialize' do
        it 'sets api for class' do
          expect(subject.api).to eq api
        end

        it 'sets params for class' do
          expect(subject.params).to eq({})
        end

        it 'sets tactic_id for class' do
          expect(subject.tactic_id).to eq '1'
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
              body: '{"tacticIds":[575],"channel":"Paid Search","clicks":37,"spend":150.95,"impressions":1170,"ctr":3.16,"avgCpc":4.08,"avgCpm":129.02}',
              headers: { 'Content-Type' => 'application/json; charset=utf-8' }
            }
          end

          before do
            stub_request(:get, "#{subject.class.base_uri}/tactic/#{subject.tactic_id}/metrics#{params}")
              .with(:headers => request_headers)
              .to_return(**return_opts)
          end

          it 'calls api endpoint campaigns' do
            expect(described_class).to receive(:get).with("/tactic/#{subject.tactic_id}/metrics", any_args).and_call_original
            subject.fetch
          end

          it 'returns an array of Response::Metric objects' do
            returned = JSON.parse return_opts[:body]
            expect(subject.fetch).to eq Response::Metric.new(returned)
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
              expect(described_class).to receive(:get).with("/tactic/#{subject.tactic_id}/metrics", { headers: request_headers, query: params_hash }).and_call_original
              subject.fetch
            end
          end
        end
      end
    end
  end
end
