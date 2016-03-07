module BalihooLpcClient
  class Api
    attr_accessor :config

    def initialize(config:)
      self.config = config
    end

    def authenticate!
      auth = Request::Authentication.new(api: self)
      auth.authenticate!
    end

    def campaigns(params: {})
      validate_params_and_fetch!(params: params, class: Request::Campaigns)
    end

    def tactics(campaign_id:, params: {})
      validate_params_and_fetch!(params: params, campaign_id: campaign_id, class: Request::Tactics)
    end

    def campaigns_with_tactics(params: {})
      validate_params_and_fetch!(params: params, class: Request::CampaignsWithTactics)
    end

    def metrics(tactic_id:, params: {})
      validate_params_and_fetch!(params: params, tactic_id: tactic_id, class: Request::Metrics)
    end

    def website_metrics(params: {})
      validate_params_and_fetch!(params: params, class: Request::WebsiteMetrics)
    end

    private

    def validate_params_and_fetch!(**args)
      if config.location_key.nil? && args[:params][:locations].nil?
        raise ApiOptionError, 'must pass opts[:locations] array since no location_key given'
      end

      fetch(**args)
    end

    def fetch(**args)
      klass = args.delete(:class)
      klass.new(api: self, **args).fetch
    end
  end
end
