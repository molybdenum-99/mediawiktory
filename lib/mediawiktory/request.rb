require 'virtus'

module MediaWiktory
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
      def_setter name
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

    private

    def def_setter(name)
      define_method(name){|val|
        set(name, val)
      }
    end
  end

  class IntegerOrMax < Virtus::Attribute::Integer
    def coerce(value)
      value.to_s == 'max' ? 'max' : super
    end
  end

  module Enum
    def Enum.[](*values)
      values.map!(&:to_sym)
      
      Class.new(Virtus::Attribute) do
        primitive Symbol

        define_singleton_method :inspect do
          "#<Enum#{values}>"
        end

        define_singleton_method :to_s do
          inspect
        end

        define_method :coerce do |value|
          return nil unless value
          
          value = value.to_sym
          values.include?(value) or
            fail(ArgumentError, "Enum #{values} not accepts #{value}")

          value
        end
      end
    end
  end


  class Request
    #extend ParametersDSL
    include Virtus.model

    class << self
      def r_attribute(name, *arg)
        attribute(name, *arg)
        define_method(name){|*arg|
          return super() if arg.empty?
          self.class.new(to_h).tap{|dup| dup.send("#{name}=", *arg)}
        }
      end
    end

    #attr_reader :params

    #def initialize(params = {})
      #@params = {}
      
      #params.each{|name, val| set!(name, val)}
    #end

    #def dup_with(**hash)
      #self.class.new(params.merge(hash))
    #end

    #def set!(name, value)
      #definition = self.class.params[name] or
        #fail(ArgumentError, "Undefined param #{name}")
        
      #@params[name] =
        #case definition[:type]
        #when :boolean
          #!!value
        #else
          #fail "Undefined type for #{name}"
        #end
    #end

    #def set(name, value)
      #dup_with(name => value)
    #end
  end

  class QueryRequest < Request
    #module_array :prop,
      #categories: Modules::Categories,
      #revisions: Modules::Revisions

    #module_array :list, QUERY_LIST
    #module_array :meta, QUERY_META
    #boolean :indexpageids
    #boolean :export
    #boolean :exportnowrap
    #boolean :iwurl
    #string :continue
    #string :rawcontinue
    #str_array :titles
    #int_array :pageids
    #int_array :revids
    #module_enum :generator
    #boolean :redirects
    #boolean :converttitles
  end
end
