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
      validate_params!(params: params)
      Request::Campaigns.new(connection: self, params: params).fetch
    end

    def campaigns_with_tactics(params: {})
      validate_params!(params: params)
      Request::CampaignsWithTactics.new(connection: self, params: params).fetch
    end

    private

    def validate_params!(params:)
      if config.location_key.nil? && params[:locations].nil?
        raise ApiOptionError, 'must pass opts[:locations] array since no location_key given'
      end
    end
  end
end
