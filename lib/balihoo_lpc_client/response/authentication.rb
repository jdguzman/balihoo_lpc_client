module BalihooLpcClient
  module Response
    class Authentication < Hashie::Dash
      include Hashie::Extensions::Dash::PropertyTranslation
      
      property :client_id, from: 'clientId'
      property :client_api_key, from: 'clientApiKey'
    end
  end
end
