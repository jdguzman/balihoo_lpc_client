module BalihooLpcClient
  class Configuration
    attr_accessor :api_base, :api_version, :brand_key, :api_key, :location_key,
                  :user_id, :group_id, :client_id, :client_api_key

    def initialize
      defaults.each do |k, v|
        self.send("#{k}=", v)
      end
    end

    def self.create
      config = new
      yield config if block_given?
      config
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
