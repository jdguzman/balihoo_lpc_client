module BalihooLpcClient
  module Request
    class WebsiteMetrics < ApiBase
      def fetch
        response = self.class.get("/websitemetrics", opts).parsed_response
        handle_errors_with(klass: ApiResponseError, response: response)
        handle_response(response: response, klass: Response::WebsiteMetric, mappable: false)
      end
    end
  end
end
