module BalihooLpcClient
  module Response
    class Tactic < Hashie::Dash
      include Hashie::Extensions::Dash::PropertyTranslation

      property :id, from: 'id'
      property :title, from: 'title'
      property :start, from: 'start', with: -> (v) { Date.parse(v) }
      property :end, from: 'end', with: -> (v) { Date.parse(v) }
      property :channel, from: 'channel'
      property :description, from: 'description'
      property :creative, from: 'creative'
    end
  end
end
