module BalihooLpcClient
  module Request
    class CampaignsWithTactics < Campaigns
      private

      def get_response
        self.class.get('/campaignswithtactics', opts).parsed_response
      end
    end
  end
end
