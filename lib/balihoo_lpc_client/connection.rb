module BalihooLpcClient
  class Connection
    attr_accessor :config

    def initialize(config:)
      self.config = config
    end

    def authenticate!
      auth = Request::Authentication.new(connection: self)
      auth.authenticate!
    end

    def campaigns(params: {})
      if config.location_key.nil? && params[:locations].nil?
        raise ApiOptionError, 'must pass opts[:locations] array since no location_key given'
      end
      Request::Campaigns.new(connection: self, params: params).fetch
    end
  end
end
