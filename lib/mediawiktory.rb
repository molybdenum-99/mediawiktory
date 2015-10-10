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

  class Prop
    def Prop.coerce(value)
      case value
      when Symbol, String
        new(value.to_sym)
      when Hash
        value.map{|name, params|
          new(name, params)
        }
      else
        fail("Can't coerce #{value.class} to property")
      end
    end

    attr_reader :name, :params

    def initialize(name, params = {})
      @name, @params = name, params
    end
  end

  class QueryRequest
    def initialize(params = {})
      params.each do |key, val| self.send(key, val) end
    end

    def prop(*prop)
      if prop.empty?
        @prop
      else
        @prop = prop.map(&Prop.method(:coerce)).flatten
        self
      end
    end

    def titles(*titles)
      if titles.empty?
        @titles
      else
        @titles = titles.flatten
        self
      end
    end

    def redirects(*redirects)
      if redirects.empty?
        @redirects
      else
        @redirects = !!redirects.first
        self
      end
    end
  end
end
