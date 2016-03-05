module BalihooLpcClient
  module Response
    class Metric < Hashie::Dash
      include Hashie::Extensions::Dash::PropertyTranslation

      property :tactic_ids, from: 'tacticIds', coerce: Array
      property :channel, from: 'channel'
      property :clicks, from: 'clicks'
      property :spend, from: 'spend'
      property :impressions, from: 'impressions'
      property :ctr, from: 'ctr'
      property :avg_cpc, from: 'avgCpc'
      property :avg_cpm, from: 'avgCpm'
    end
  end
end
