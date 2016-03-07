module BalihooLpcClient
  module Response
    class WebsiteMetric < Hashie::Dash
      include Hashie::Extensions::Dash::PropertyTranslation
      include Hashie::Extensions::Dash::Coercion

      property :visits, from: 'visits', coerce: WebsiteMetricVisits
      property :leads, from: 'leads', coerce: WebsiteMetricLeads
    end
  end
end
