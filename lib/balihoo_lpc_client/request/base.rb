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
        if response.is_a?(String)
          if response =~ /session has expired/
            raise ApiSessionExpiredError, response
          else
            raise klass, response
          end
        end
      end
    end
  end
end
