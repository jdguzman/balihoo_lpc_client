module BalihooLpcClient
  module Request
    class ApiBase < Base
      attr_accessor :params

      def initialize(api:, params:)
        super(api: api)
        self.params = params
      end

      private

      def multiple_locations?
        if locations_expected?
          params[:locations].count > 1
        else
          false
        end
      end

      def locations_expected?
        config.location_key.nil? || config.location_key.strip.empty?
      end

      def opts
        {
          headers: {
            'X-ClientId' => config.client_id,
            'X-ClientApiKey' => config.client_api_key
          },
          query: sanitized_params
        }
      end

      def sanitized_params
        if locations_expected?
          sanitized = params.dup
          sanitized[:locations] = sanitized[:locations].join(?,)
          sanitized
        else
          params.delete(:locations)
          params
        end
      end

      def handle_response(response:, klass:, mappable: true)
        if multiple_locations?
          multiple_locations(response: response, klass: klass, mappable: mappable)
        else
          single_location(response: response, klass: klass, mappable: mappable)
        end
      end

      def multiple_locations(response:, klass:, mappable:)
        response.inject({}) do |h, pair|
          if mappable
            h.merge({ pair[0] => pair[1].map { |v| klass.new(v) } })
          else
            h.merge({ pair[0] => klass.new(pair[1]) })
          end
        end
      end

      def single_location(response:, klass:, mappable:)
        if mappable
          response.map do |result|
            klass.new result
          end
        else
          klass.new response
        end
      end
    end
  end
end
