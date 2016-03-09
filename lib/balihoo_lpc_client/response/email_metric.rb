module BalihooLpcClient
  module Response
    class EmailMetric < MetricBase
      property :sends, from: 'sends'
      property :opens, from: 'opens'
      property :clicks, from: 'clicks'
      property :delivered, from: 'delivered'
      property :bounced, from: 'bounced'
      property :unsubscribed, from: 'unsubscribed'
      property :marked_spam, from: 'markedSpam'
    end
  end
end
