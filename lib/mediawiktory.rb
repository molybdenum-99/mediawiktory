require 'addressable/uri'
require 'faraday'

module MediaWiktory
  %w[request].each do |mod|
    require_relative "mediawiktory/#{mod}"
  end
end

__END__
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

  #class Request
    #attr_reader :action, :params
    
    #def initialize(action, params = {})
      #@action, @params = action, params
    #end

    #def query_hash
      #flatten(params).merge(action: action)
    #end

    #private

    #def flatten(hash, prefix: '')
      #res = {}
      #hash.each do |key, value|
        #case value
        #when Hash
          #res[key] = value.keys.join('|')
          #res.merge!(value.map{|k,v| flatten(v)}.inject(:merge)) # TODO: flatten(v, prefix_from(k))
        #when Array
          #res[key] = value.join('|')
        #else
          #res[key] = value.to_s
        #end
      #end
      #res
    #end
  #end

  #class Prop
    #def Prop.coerce(value)
      #case value
      #when Symbol, String
        #new(value.to_sym)
      #when Hash
        #value.map{|name, params|
          #new(name, params)
        #}
      #else
        #fail("Can't coerce #{value.class} to property")
      #end
    #end

    #attr_reader :name, :params

    #def initialize(name, params = {})
      #@name, @params = name, params
    #end
  #end

  module ParametersDSL
    def params
      @params ||= {}
    end
    
    #def module_array(name, **values)
      #define_method(name){|*vals|
        #vals.each do |v|
          #values.key?(v) or fail(ArgumentError, "Unknown value for #{name}: #{v}")
        #end
        #dup_with(name => vals.map{|v| [v.to_s, {}]}.to_h)
      #}
    #end

    def boolean(name)
      params[name] = {type: :boolean}
      #define_method(name){|val|
        #dup_with(name => !!val)
      #}
    end

    #def str_array(name)
      #define_method(name){|*values|
        #dup_with(name => values.map(&:to_s))
      #}
    #end

    #def int_array(name)
      #define_method(name){|*values|
        #dup_with(name => values.map(&:to_i))
      #}
    #end
  end

  class Request
    extend ParametersDSL

    attr_reader :params

    def initialize(params = {})
      @params = params.dup
    end

    def dup_with(**hash)
      self.class.new(params.merge(hash))
    end

    def set!(name, value)
      definition = self.class.params[name] or
        fail(ArgumentError, "Undefined param #{name}")
        
      @params[name] =
        case definition[:type]
        when :boolean
          !!value
        else
          fail "Undefined type for #{name}"
        end
    end
  end

  #class Siteinfo
    #prefix :si
    
    #array :prop,
      #%w[general namespaces namespacealiases specialpagealiases magicwords interwikimap dbrepllag statistics usergroups libraries extensions fileextensions rightsinfo restrictions languages skins extensiontags functionhooks showhooks variables protocols defaultoptions]
    #enum :filteriw, %w[local !local]
    #boolean :showalldb
    #boolean :numberingroup
    #string :inlanguagecode
  #end

  module Modules
    class Categories
    end

    class Revisions
    end
  end

  class QueryRequest < Request
    #QUERY_PROP = {
      #categories: Categories,
      #categoryinfo: Categoryinfo,
      #contributors: Contrybutors
      ## and so on, coordinates, deletedrevisions, duplicatefiles, extlinks, extracts, fileusage, flagged, flowinfo, globalusage, imageinfo, images, info, iwlinks, langlinks, links, linkshere, listmembership, pageimages, pageprops, pageterms, redirects, revisions, stashimageinfo, templates, transcludedin, transcodestatus, videoinfo
    #}
    
    #module_array :prop,
      #categories: Modules::Categories,
      #revisions: Modules::Revisions

    #module_array :list, QUERY_LIST
    #module_array :meta, QUERY_META
    boolean :indexpageids
    boolean :export
    boolean :exportnowrap
    boolean :iwurl
    #string :continue
    #string :rawcontinue
    #str_array :titles
    #int_array :pageids
    #int_array :revids
    #module_enum :generator
    boolean :redirects
    boolean :converttitles
    
    #def initialize(params = {})
      #super()
      #params.each do |key, val| self.send(key, val) end
    #end

    #def prop(*prop)
      #if prop.empty?
        #@prop
      #else
        #@prop = prop.map(&Prop.method(:coerce)).flatten
        #self
      #end
    #end

    #def titles(*titles)
      #if titles.empty?
        #@titles
      #else
        #@titles = titles.flatten
        #self
      #end
    #end

    #def redirects(*redirects)
      #if redirects.empty?
        #@redirects
      #else
        #@redirects = !!redirects.first
        #self
      #end
    #end
  end
end
