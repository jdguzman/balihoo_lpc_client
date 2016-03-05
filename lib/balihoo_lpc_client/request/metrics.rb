module BalihooLpcClient
  module Request
    class Metrics < ApiBase
      attr_accessor :tactic_id

      def initialize(api:, params:, tactic_id:)
        super(api: api, params: params)
        self.tactic_id = tactic_id
      end

      def fetch
        r = self.class.get("/tactic/#{tactic_id}/metrics", opts).parsed_response
        Response::Metric.new r
      end
    end
  end
end
