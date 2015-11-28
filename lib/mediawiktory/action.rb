require 'json'
require 'hashie'

module MediaWiktory
  class Action < MWModule
    attr_reader :client
    
    def initialize(client, **values)
      @client = client
      super(**values)
    end

    def dup
      self.class.new(client, to_h)
    end

    def perform
      self.class::Response. # child classes can enrich and specialize their Response
        from_json(self, @client.send(self.class.request_method, to_param))
    end

    def to_param
      super.merge('action' => self.class.symbol.to_s, 'format' => 'json')
    end

    class Response
      def self.from_json(action, data)
        new(action, JSON.parse(data))
      end

      attr_reader :action, :raw

      def initialize(action, raw)
        @action = action
        @raw = Hashie::Mash.new(raw)
      end

      def to_h
        raw.to_h
      end
    end
  end
end
