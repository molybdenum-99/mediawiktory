module MediaWiktory
  class Action < MWModule
    def initialize(client, **values)
      @client = client
      super(**values)
    end

    def perform
      @client.get(to_param)
    end

    def to_param
      super.merge('action' => self.class.symbol.to_s, 'format' => 'json')
    end
  end
end
