module BalihooLpcClient
  module Request
    class Authentication < Base
      def authenticate!
        response = self.class.post('/genClientAPIKey', opts)
        handle_errors_with(klass: AuthenticationError, response: response)
        handle_success(response.parsed_response)
      end

      private

      def opts
        {
          query: {
            brandKey: connection.config.brand_key,
            apiKey: connection.config.api_key,
            locationKey: connection.config.location_key,
            userId: connection.config.user_id,
            groupId: connection.config.group_id
          }
        }
      end

      def handle_success(data)
        auth = Response::Authentication.new(data)
        config.client_id = auth.client_id
        config.client_api_key = auth.client_api_key
        data
      end
    end
  end
end
