module BalihooLpcClient
  module Request
    class Campaigns < ApiBase
      def fetch
        response = self.class.get('/campaigns', opts).parsed_response
        handle_response(response: response, klass: Response::Campaign)
      end
    end
  end
end
