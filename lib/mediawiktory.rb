require 'addressable/uri'
require 'faraday'

module MediaWiktory
  class Client
    attr_reader :url
    
    def initialize(url)
      @url = Addressable::URI.parse(url)
      @faraday = Faraday.new(url)
    end

    def get(params)
      @faraday.get('', params)
    end
  end

  class Request
    attr_reader :action, :params
    
    def initialize(action, params = {})
      @action, @params = action, params
    end

    def query_hash
      flatten(params).merge(action: action)
    end

    private

    def flatten(hash, prefix: '')
      res = {}
      hash.each do |key, value|
        case value
        when Hash
          res[key] = value.keys.join('|')
          p value
          res.merge!(value.map{|k,v| flatten(v)}.inject(:merge)) # TODO: flatten(v, prefix_from(k))
        when Array
          res[key] = value.join('|')
        else
          res[key] = value.to_s
        end
      end
      res
    end
  end
end
