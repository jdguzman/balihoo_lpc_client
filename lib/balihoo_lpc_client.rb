require 'httparty'
require 'hashie'

require 'balihoo_lpc_client/version'
require 'balihoo_lpc_client/configuration'
require 'balihoo_lpc_client/connection'
require 'balihoo_lpc_client/request/base'
require 'balihoo_lpc_client/request/authentication'
require 'balihoo_lpc_client/response/authentication'

module BalihooLpcClient
  class BalihooLpcError < StandardError; end
  class AuthenticationError < BalihooLpcError; end
end
