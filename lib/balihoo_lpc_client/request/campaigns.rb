module BalihooLpcClient
  module Request
    class Campaigns < ApiBase
      def fetch
        self.class.get('/campaigns', opts).parsed_response.map do |result|
          Response::Campaign.new result
        end
      end
    end
  end
end