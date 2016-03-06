module BalihooLpcClient
  module Request
    class Tactics < ApiBase
      attr_accessor :campaign_id

      def initialize(api:, params:, campaign_id:)
        super(api: api, params: params)
        self.campaign_id = campaign_id
      end

      def fetch
        self.class.get("/campaign/#{campaign_id}/tactics", opts).parsed_response['tactics'].map do |result|
          Response::Tactic.new result
        end
      end
    end
  end
end
