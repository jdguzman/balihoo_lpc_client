module BalihooLpcClient
  module Request
    class CampaignsWithTactics < ApiBase
      def fetch
        self.class.get('/campaignswithtactics', opts).parsed_response.map do |result|
          Response::Campaign.new result
        end
      end
    end
  end
end
