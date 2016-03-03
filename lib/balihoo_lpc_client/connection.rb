module BalihooLpcClient
  class Connection
    attr_accessor :config

    def initialize(config:)
      self.config = config
    end

    def authenticate!
      auth = Request::Authentication.new(connection: self)
      auth.authenticate!
    end
  end
end
