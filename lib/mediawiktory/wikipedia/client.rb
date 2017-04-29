# frozen_string_literal: true

require 'addressable'
require 'faraday'
require 'faraday_middleware'

module MediaWiktory::Wikipedia
  class Client
    # Default MediaWiktory User-Agent header.
    #
    # You can set yours as an option to {#initialize}
    UA = 'MediaWiktory/0.1.0 '\
         '(https://github.com/molybdenum-99/mediawiktory; zverok.offline@gmail.com)'

    class << self
      # User agent getter/setter.
      #
      # Default value is {UA}.
      #
      # You can also use per-instance option, see {#initialize}
      attr_accessor :user_agent
    end

    attr_reader :url

    def initialize(url, **options)
      @url = Addressable::URI.parse(url)
      @faraday = Faraday.new(url) do |f|
        f.request :url_encoded
        f.use FaradayMiddleware::FollowRedirects, limit: 5
        f.adapter Faraday.default_adapter
      end
      @faraday.headers.merge!(headers(options))
    end

    def get(params)
      @faraday.get('', params).body
    end

    def post(params)
      @faraday.post('', params).body
    end

    private

    def headers(options)
      {'User-Agent' => options[:user_agent] || options[:ua] || self.class.user_agent || UA}
    end
  end
end
