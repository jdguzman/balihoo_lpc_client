module BalihooLpcClient
  module Request
    class Tactics < ApiBase
      attr_accessor :campaign_id

      def initialize(api:, params:, campaign_id:)
        super(api: api, params: params)
        self.campaign_id = campaign_id
      end

      def fetch
        response = self.class.get("/campaign/#{campaign_id}/tactics", opts).parsed_response
        handle_errors_with(klass: ApiResponseError, response: response)
        handle_response(response: response, klass: Response::Tactic)
      end

      private

      def handle_response(response:, klass:, mappable: true)
        if multiple_locations?
          multiple_locations(response: response, klass: klass, mappable: mappable)
        else
          single_location(response: response['tactics'], klass: klass, mappable: mappable)
        end
      end
    end
  end
end
