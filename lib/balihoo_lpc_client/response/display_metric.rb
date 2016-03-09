module BalihooLpcClient
  module Response
    class DisplayMetric < MetricBase
      property :impressions, from: 'impressions'
      property :spend, from: 'spend'
      property :ctr, from: 'ctr'
      property :avg_cpc, from: 'avgCpc'
      property :avg_cpm, from: 'avgCpm'
    end
  end
end
