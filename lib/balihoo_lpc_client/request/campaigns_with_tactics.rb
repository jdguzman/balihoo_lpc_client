module BalihooLpcClient
  module Request
    class CampaignsWithTactics < ApiBase
      def fetch
        response = self.class.get('/campaignswithtactics', opts).parsed_response
        handle_response(response: response, klass: Response::Campaign)
      end
    end
  end
end
