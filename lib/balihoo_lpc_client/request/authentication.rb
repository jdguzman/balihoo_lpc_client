module BalihooLpcClient
  module Request
    class Authentication < Base
      def authenticate!
        response = JSON.parse self.class.post('/genClientAPIKey')
        auth = Response::Authentication.new(response)
        config.client_id = auth.client_id
        config.client_api_key = auth.client_api_key
      end
    end
  end
end
