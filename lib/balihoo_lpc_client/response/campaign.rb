module BalihooLpcClient
  module Response
    class Campaign < Hashie::Dash
      include Hashie::Extensions::Dash::PropertyTranslation
      include Hashie::Extensions::Dash::Coercion

      property :id, from: 'id'
      property :title, from: 'title'
      property :description, from: 'description'
      property :start, from: 'start', with: -> (v) { Date.parse(v) }
      property :end, from: 'end', with: -> (v) { Date.parse(v) }
      property :status, from: 'status'
      property :tactics, from: 'tactics', coerce: Array[Tactic]
    end
  end
end
