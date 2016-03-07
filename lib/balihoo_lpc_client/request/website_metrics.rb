module BalihooLpcClient
  module Request
    class WebsiteMetrics < ApiBase
      def fetch
        r = self.class.get("/websitemetrics", opts).parsed_response
        Response::WebsiteMetric.new r
      end
    end
  end
end
