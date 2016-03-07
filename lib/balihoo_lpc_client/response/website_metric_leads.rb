module BalihooLpcClient
  module Response
    class WebsiteMetricLeads < Hashie::Dash
      include Hashie::Extensions::Dash::PropertyTranslation

      property :total, from: 'total'
      property :total_web, from: 'totalWeb'
      property :total_phone, from: 'totalPhone'
      property :organic_web, from: 'organicWeb'
      property :paid_web, from: 'paidWeb'
      property :organic_phone, from: 'organicPhone'
      property :paid_phone, from: 'paidPhone'
    end
  end
end
