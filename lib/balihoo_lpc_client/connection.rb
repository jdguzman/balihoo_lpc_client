module BalihooLpcClient
  class Connection
    attr_accessor :config

    def initialize(config:)
      self.config = config
    end
  end
end
