module MediaWiktory
  class Action < MWModule
    class << self
      def request_method
        @request_method || :get
      end

      def post!
        @request_method = :post
      end
    end
    
    def initialize(client, **values)
      @client = client
      super(**values)
    end

    def perform
      @client.send(self.class.request_method, to_param)
    end

    def to_param
      super.merge('action' => self.class.symbol.to_s, 'format' => 'json')
    end
  end
end
