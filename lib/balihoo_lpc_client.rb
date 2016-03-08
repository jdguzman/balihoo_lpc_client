require 'httparty'
require 'hashie'

require 'balihoo_lpc_client/version'
require 'balihoo_lpc_client/configuration'
require 'balihoo_lpc_client/api'
require 'balihoo_lpc_client/request/base'
require 'balihoo_lpc_client/request/api_base'
require 'balihoo_lpc_client/request/authentication'
require 'balihoo_lpc_client/request/campaigns'
require 'balihoo_lpc_client/request/campaigns_with_tactics'
require 'balihoo_lpc_client/request/metrics'
require 'balihoo_lpc_client/request/tactics'
require 'balihoo_lpc_client/request/website_metrics'
require 'balihoo_lpc_client/response/authentication'
require 'balihoo_lpc_client/response/tactic'
require 'balihoo_lpc_client/response/campaign'
require 'balihoo_lpc_client/response/metric'
require 'balihoo_lpc_client/response/website_metric_visits'
require 'balihoo_lpc_client/response/website_metric_leads'
require 'balihoo_lpc_client/response/website_metric'

module BalihooLpcClient
  class BalihooLpcError < StandardError; end
  class AuthenticationError < BalihooLpcError; end
  class ApiOptionError < BalihooLpcError; end
  class NotAuthenticatedError < BalihooLpcError; end
end
