module MediaWiktory::Wikipedia
  class Response
    def self.parse(action, response_body)
      new(action, JSON.parse(response_body))
    end

    def initialize(action, response_hash)
      @action = action
      @data = response_hash
      error! if @data['error']
    end

    def to_h
      @data.fetch(@action.name)
    end

    def dig(*keys)
      to_h.dig(*keys)
    end

    def raw
      @data.dup
    end

    def continue?
      @data.key?('continue')
    end

    def continue
      raise unless continue?

      action = @action.merge(@data.fetch('continue'))

      self.class.new(action, deep_merge(@data, JSON.parse(action.perform)))
    end

    def inspect
      "#<#{self.class.name}(#{@action.name}): #{to_h.keys.join(', ')}#{' (can continue)' if continue?}>"
    end

    private

    def deep_merge(hash1, hash2)
      merger = ->(k, v1, v2) { v1.is_a?(Hash) && v2.is_a?(Hash) ? v1.merge(v2, &merger) : v2 }
      hash1.merge(hash2, &merger)
        .tap { |res| res['continue'] = hash2['continue'] } # more new page is responsible for continuation
        .select(&:last)
    end

    def error!
      # TODO: proper class
      raise RuntimeError, @data.dig('error', 'info')
    end
  end
end