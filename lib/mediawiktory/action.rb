require 'json'
require 'hashie'

module MediaWiktory
  class Action
    attr_reader :client

    def initialize(client, hash = {})
      @client = client
      @params = Util.stringify_hash(hash)
    end

    def merge(hash)
      self.class.new(@client, @params.merge(Util.stringify_hash(hash)))
    end

    def to_h
      @params.dup
    end

    def to_param
      to_h.merge('action' => action_name)
    end

    def perform
      fail NotImplementedError, "Action is abstract, all actions should descend from GetAction or PostAction"
    end

    private

    def action_name
      self.class.name.scan(/(\w+)Action$/).flatten.first&.downcase or
        fail ArgumentError, "Can't guess action name from #{self.class.name}"
    end

    # Used by generated code in methods like
    #
    # ```ruby
    # action.format(:json)
    # action.format(json: {callback: '__wpcallback__'})
    # ```
    #
    # ...converting param setting and options into flat hash.
    def module_to_hash(name, arg, prefix: nil)
      case arg
      when Symbol, String
        {name.to_s => arg.to_s}
      when Hash
        arg.size == 1 or fail ArgumentError, "Can't merge #{name}(#{arg.inspect})"
        key, options = arg.first
        # TODO: more through options type check.
        {name.to_s => key.to_s}.merge(options.reject { |k, v| !v }.map { |k, v| ["#{prefix}#{k}", v.to_s] }.to_h)
      else
        fail ArgumentError, "Can't merge #{name}(#{arg.inspect})"
      end
    end
  end

  class GetAction < Action
    def perform
      client.get(to_param)
    end
  end

  class PostAction < Action
    def perform
      client.post(to_param)
    end
  end
end

__END__
  class Mash < Hashie::Mash
    disable_warnings
  end

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
        @raw = Mash.new(raw)
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
