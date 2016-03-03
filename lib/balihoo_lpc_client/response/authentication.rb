module BalihooLpcClient
  module Response
    class Authentication < Hashie::Dash
      property 'clientId'
      property 'clientApiKey'

      alias_method :client_id, :clientId
      alias_method :client_api_key, :clientApiKey
    end
  end
end
