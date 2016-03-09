module BalihooLpcClient
  module Response
    class MetricBase < Hashie::Dash
      include Hashie::Extensions::Dash::PropertyTranslation

      property :tactic_ids, from: 'tacticIds'
      property :channel, from: 'channel'
    end
  end
end
