require 'spec_helper'

module BalihooLpcClient
  module Request
    describe WebsiteMetrics do
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

      subject { described_class.new(api: api, params: {}) }

      describe '.initialize' do
        it 'sets api for class' do
          expect(subject.api).to eq api
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
              body: '{"visits":{"total":667,"organic":88,"direct":19,"referral":560,"paid":0,"newVisitsPercent":0.6896551724137931},"leads":{"total":1,"totalWeb":0,"totalPhone":1,"organicWeb":0,"paidWeb":0,"organicPhone":1,"paidPhone":0}}',
              headers: { 'Content-Type' => 'application/json; charset=utf-8' }
            }
          end

          before do
            stub_request(:get, "#{subject.class.base_uri}/websitemetrics#{params}")
              .with(:headers => request_headers)
              .to_return(**return_opts)
          end

          it 'calls api endpoint websitemetrics' do
            expect(described_class).to receive(:get).with("/websitemetrics", any_args).and_call_original
            subject.fetch
          end

          it 'returns a Response::WebsiteMetric object' do
            returned = JSON.parse return_opts[:body]
            expect(subject.fetch).to eq Response::WebsiteMetric.new(returned)
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
              expect(described_class).to receive(:get).with("/websitemetrics", { headers: request_headers, query: params_hash }).and_call_original
              subject.fetch
            end
          end
        end
      end
    end
  end
end
