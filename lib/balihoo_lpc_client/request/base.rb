module BalihooLpcClient
  module Request
    class Base
      include HTTParty

      attr_accessor :api

      def initialize(api:)
        self.api = api
        self.class.base_uri config.url
      end

      private

      def config
        api.config
      end

      def handle_errors_with(klass:, response:)
        unless response.parsed_response.is_a?(Hash)
          raise klass, response.parsed_response
        end
      end
    end
  end
end
