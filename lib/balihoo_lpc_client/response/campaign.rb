module BalihooLpcClient
  module Response
    class Campaign < Hashie::Dash
      property 'id'
      property 'title'
      property 'description'
      property 'start'
      property 'end'
      property 'status'
    end
  end
end
