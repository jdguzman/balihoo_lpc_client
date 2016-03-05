module BalihooLpcClient
  module Request
    class ApiBase < Base
      attr_accessor :params

      def initialize(api:, params:)
        super(api: api)
        self.params = params
      end

      private

      def opts
        {
          headers: {
            'X-ClientId' => api.config.client_id,
            'X-ClientApiKey' => api.config.client_api_key
          },
          query: params
        }
      end
    end
  end
end
