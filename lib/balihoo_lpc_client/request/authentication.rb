module BalihooLpcClient
  module Request
    class Authentication < Base
      def authenticate!
        result = JSON.parse self.class.post('/genClientAPIKey')
        auth = Response::Authentication.new(result)
        config.client_id = auth.client_id
        config.client_api_key = auth.client_api_key
      end
    end
  end
end
