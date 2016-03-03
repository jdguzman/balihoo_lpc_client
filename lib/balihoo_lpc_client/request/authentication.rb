module BalihooLpcClient
  module Request
    class Authentication < Base
      def authenticate!
        self.class.post('genClientAPIKey')
      end
    end
  end
end
