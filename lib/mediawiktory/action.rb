require 'json'
require 'hashie'

module MediaWiktory
  class Action < MWModule
    attr_reader :client
    
    def initialize(client, **values)
      @client = client
      super(**values)
    end

    # FIXME: should be initialize_copy
    def dup
      self.class.new(client, to_h)
    end

    def perform(params = {})
      self.class::Response. # child classes can enrich and specialize their Response
        from_json(self, @client.send(self.class.request_method, to_param.merge(params)))
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
        raise RequestError, @raw.error.info unless @raw.error.nil?
      end

      def initialize_copy(other)
        @action = other.action
        @raw = other.raw.dup
      end

      def to_h
        raw.to_h
      end

      def warnings
        @raw.warnings
      end
    end

    class RequestError < StandardError
    end
  end
end
