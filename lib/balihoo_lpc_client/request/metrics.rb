module BalihooLpcClient
  module Request
    class Metrics < ApiBase
      attr_accessor :tactic_id

      def initialize(api:, params:, tactic_id:)
        super(api: api, params: params)
        self.tactic_id = tactic_id
      end

      def fetch
        response = self.class.get("/tactic/#{tactic_id}/metrics", opts).parsed_response
        handle_errors_with(klass: ApiResponseError, response: response)
        handle_response(response: response, klass: klass_for(response: response), mappable: false)
      end

      private

      def klass_for(response:)
        case (multiple_locations? ? response.values.first['channel'] : response['channel'])
        when /Email/
          Response::EmailMetric
        when /Paid Search/
          Response::PaidSearchMetric
        when /Display/
          Response::DisplayMetric
        end
      end
    end
  end
end
