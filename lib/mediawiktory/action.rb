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
        from_json(@client.send(self.class.request_method, to_param))
    end

    def to_param
      super.merge('action' => self.class.symbol.to_s, 'format' => 'json')
    end

    class Response < Hashie::Mash
      def self.from_json(data)
        new(JSON.parse(data))
      end
    end
  end
end
