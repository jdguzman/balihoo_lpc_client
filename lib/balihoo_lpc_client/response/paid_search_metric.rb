module BalihooLpcClient
  module Response
    class PaidSearchMetric < MetricBase
      property :clicks, from: 'clicks'
      property :spend, from: 'spend'
      property :impressions, from: 'impressions'
      property :ctr, from: 'ctr'
      property :avg_cpc, from: 'avgCpc'
      property :avg_cpm, from: 'avgCpm'
    end
  end
end
