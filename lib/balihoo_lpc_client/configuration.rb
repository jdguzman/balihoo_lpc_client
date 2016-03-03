module BalihooLpcClient
  class Configuration
    attr_accessor :api_url

    def initialize
      self.api_url = "https://bac.dev.balihoo-connect.com"
    end
  end
end
