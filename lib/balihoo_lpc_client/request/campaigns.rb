module BalihooLpcClient
  module Request
    class Campaigns < Base
      attr_accessor :params

      def initialize(connection:, params:)
        super(connection: connection)
        self.params = params
      end

      def fetch
        self.class.get('/campaigns', opts).parsed_response.map do |result|
          Response::Campaign.new result
        end
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
