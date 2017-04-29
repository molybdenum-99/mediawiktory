# frozen_string_literal: true

require 'json'

module MediaWiktory::Wikipedia
  # Thin wrapper around MediaWiki API response.
  #
  # It provides services for separating metadata of response of its essential data, continuing multi-
  # page responses, and converting response errors into exceptions.
  #
  # You should not instantiate this class, it is obtained by some {Actions Action}'s {Actions::Base#response #response}.
  class Response
    # Response fail was returned by target MediaWiki API.
    Error = Class.new(RuntimeError)

    # @private
    def self.parse(action, response_body)
      new(action, JSON.parse(response_body))
    end

    # @private
    def initialize(action, response_hash)
      @action = action
      @data = response_hash
      error! if @data['error']
    end

    # "Content" part of the response as a plain Ruby Hash.
    #
    # @return [Hash]
    def to_h
      @data.fetch(@action.name)
    end

    # Fetches a key from response content.
    #
    # @param key [String] Key name.
    def [](key)
      to_h[key]
    end

    # Digs for a keys from response content.
    #
    # @param keys [Array<String>] Key names.
    def dig(*keys)
      to_h.dig(*keys)
    end

    # Entire response "as is", including contents and metadata parts.
    #
    # @return [Hash]
    def raw
      @data.dup
    end

    # Returns `true` if there is next pages of response. See also {#continue}
    def continue?
      @data.key?('continue')
    end

    # Continues current request and returns current & next page. (It is necessary because MediaWiki
    # tends to return the same page's data continued on the next request page.)
    #
    # @return [Response]
    def continue
      fail 'This is the last page' unless continue?

      action = @action.merge(@data.fetch('continue'))

      self.class.new(action, deep_merge(@data, JSON.parse(action.perform)))
    end

    # @return [String]
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
