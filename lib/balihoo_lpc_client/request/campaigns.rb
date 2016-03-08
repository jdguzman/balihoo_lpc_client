module BalihooLpcClient
  module Request
    class Campaigns < ApiBase
      def fetch
        response = get_response
        handle_errors_with(klass: ApiResponseError, response: response)
        handle_response(response: response, klass: Response::Campaign)
      end

      private

      def get_response
        self.class.get('/campaigns', opts).parsed_response
      end
    end
  end
end
