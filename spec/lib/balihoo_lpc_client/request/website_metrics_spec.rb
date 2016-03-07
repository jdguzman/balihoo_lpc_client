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
            subject { described_class.new(api: api, params: { locations: [1], from: '2016-01-01', to: '2016-01-31' }) }

            let(:params) do
              arr = subject.send(:sanitized_params).map do |k, v|
                "#{k}=#{v}"
              end
              arr.any? ? "?#{arr.join('&')}" : ''
            end

            context 'location key missing' do
              let(:config) do
                Configuration.create do |c|
                  c.brand_key = 'foo'
                  c.api_key = 'key'
                  c.user_id = 'foo'
                  c.group_id = 'foo'
                  c.client_id = 'id' #simulating that authenticate has been called
                  c.client_api_key = 'key' #simulating that authenticate has been called
                end
              end

              it 'passes params to api call' do
                expect(described_class).to receive(:get).with("/websitemetrics", { headers: request_headers, query: subject.send(:sanitized_params) }).and_call_original
                subject.fetch
              end

              context 'requesting single location' do
                it 'returns a Response::Metric object' do
                  returned = JSON.parse(return_opts[:body])
                  expect(subject.fetch).to eq Response::WebsiteMetric.new(returned)
                end
              end

              context 'requesting multiple locations' do
                subject { described_class.new(api: api, params: { locations: [1,2], from: '2016-01-01', to: '2016-01-31' }) }

                let(:return_opts) do
                  {
                    status: 200,
                    body: '{"1":{"visits":{"total":667,"organic":88,"direct":19,"referral":560,"paid":0,"newVisitsPercent":0.6896551724137931},"leads":{"total":1,"totalWeb":0,"totalPhone":1,"organicWeb":0,"paidWeb":0,"organicPhone":1,"paidPhone":0}},"2":{"visits":{"total":667,"organic":88,"direct":19,"referral":560,"paid":0,"newVisitsPercent":0.6896551724137931},"leads":{"total":1,"totalWeb":0,"totalPhone":1,"organicWeb":0,"paidWeb":0,"organicPhone":1,"paidPhone":0}}}',
                    headers: { 'Content-Type' => 'application/json; charset=utf-8' }
                  }
                end

                it 'returns a hash with location as key and Response::Metric value' do
                  returned = JSON.parse return_opts[:body]
                  returned = returned.inject({}) do |h, pair|
                    h.merge({ pair[0] => Response::WebsiteMetric.new(pair[1]) })
                  end
                  expect(subject.fetch).to eq returned
                end
              end
            end

            context 'location_key present' do
              it 'removes locations if location_key is present' do
                expect(described_class).to receive(:get).with("/websitemetrics", { headers: request_headers, query: subject.send(:sanitized_params) }).and_call_original
                subject.fetch
              end
            end
          end
        end
      end
    end
  end
end
