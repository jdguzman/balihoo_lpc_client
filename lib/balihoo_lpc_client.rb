require 'httparty'
require 'hashie'

require 'balihoo_lpc_client/version'
require 'balihoo_lpc_client/configuration'
require 'balihoo_lpc_client/connection'
require 'balihoo_lpc_client/request/base'
require 'balihoo_lpc_client/request/api_base'
require 'balihoo_lpc_client/request/authentication'
require 'balihoo_lpc_client/request/campaigns'
require 'balihoo_lpc_client/request/campaigns_with_tactics'
require 'balihoo_lpc_client/response/authentication'
require 'balihoo_lpc_client/response/tactic'
require 'balihoo_lpc_client/response/campaign'

module BalihooLpcClient
  class BalihooLpcError < StandardError; end
  class AuthenticationError < BalihooLpcError; end
  class ApiOptionError < BalihooLpcError; end
end
