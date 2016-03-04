module BalihooLpcClient
  module Request
    class ApiBase < Base
      attr_accessor :params

      def initialize(connection:, params:)
        super(connection: connection)
        self.params = params
      end

      private

      def opts
        {
          headers: {
            'X-ClientId' => connection.config.client_id,
            'X-ClientApiKey' => connection.config.client_api_key
          },
          query: params
        }
      end
    end
  end
end
