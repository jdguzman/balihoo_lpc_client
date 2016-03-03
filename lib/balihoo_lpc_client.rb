require "balihoo_lpc_client/version"
require "balihoo_lpc_client/configuration"

module BalihooLpcClient
  def self.configure
    yield configuration
  end

  def self.configuration
    @configuration ||= Configuration.new
  end
end
