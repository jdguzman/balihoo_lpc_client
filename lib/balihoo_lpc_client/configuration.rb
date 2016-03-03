module BalihooLpcClient
  class Configuration
    attr_accessor :api_base, :api_version

    def initialize
      defaults.each do |k, v|
        self.send("#{k}=", v)
      end
    end

    def url
      [api_base, api_version].join(?/)
    end

    private

    def defaults
      {
        api_base: "https://bac.dev.balihoo-connect.com/localdata",
        api_version: "v1.0"
      }
    end
  end
end
