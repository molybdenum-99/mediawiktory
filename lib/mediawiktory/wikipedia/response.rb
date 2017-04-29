# frozen_string_literal: true

require 'json'

module MediaWiktory::Wikipedia
  class Response
    Error = Class.new(RuntimeError)

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
      fail 'This is the last page' unless continue?

      action = @action.merge(@data.fetch('continue'))

      self.class.new(action, deep_merge(@data, JSON.parse(action.perform)))
    end

    def inspect
      "#<#{self.class.name}(#{@action.name}): #{to_h.keys.join(', ')}#{' (can continue)' if continue?}>"
    end

    private

    def deep_merge(hash1, hash2)
      merger = ->(_k, v1, v2) { v1.is_a?(Hash) && v2.is_a?(Hash) ? v1.merge(v2, &merger) : v2 }

      # Newest page is responsible for continuation
      hash1.merge(hash2, &merger)
           .tap { |res| res['continue'] = hash2['continue'] }
           .reject { |_, val| val.nil? }
    end

    def error!
      fail Error, @data.dig('error', 'info')
    end
  end
end
