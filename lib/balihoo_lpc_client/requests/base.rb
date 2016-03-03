module BalihooLpcClient
  module Requests
    class Base
      include HTTParty

      attr_accessor :connection

      def initialize(connection:)
        self.connection = connection
        self.class.base_uri config.url
      end

      private

      def config
        connection.config
      end
    end
  end
end
