module BalihooLpcClient
  module Response
    class WebsiteMetricVisits < Hashie::Dash
      include Hashie::Extensions::Dash::PropertyTranslation

      property :total, from: 'total'
      property :organic, from: 'organic'
      property :direct, from: 'direct'
      property :referral, from: 'referral'
      property :paid, from: 'paid'
      property :new_visits_percent, from: 'newVisitsPercent'
    end
  end
end
