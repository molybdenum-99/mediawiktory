require 'virtus'

module MediaWiktory
  module Params
    class Param
      attr_reader :name, :value
      
      def initialize(name, value)
        @name = name
        self.value = value
      end

      def value=(val)
        valid?(val) or
          fail(ArgumentError, "Invalid value #{val.inspect} for param #{name} (#{self.class})")

        @value = val
      end
      
      def to_param
        raise NotImplementedError
      end

      def self.valid?(val)
        true
      end

      def valid?(val)
        self.class.valid?(val)
      end
    end

    class List < Param
      class << self
        def [](type)
          Class.new(self){
            self.member_type = type
          }
        end

        attr_accessor :member_type

        def inspect
          "#<List#{member_type}>"
        end

        alias_method :to_s, :inspect
      end

      def self.valid?(val)
        member_type or fail(NotImplementedError, "Abstract list used as param type")
        val.is_a?(Array) && val.all?{|v| member_type.valid?(v)}
      end
    end
    
    class String < Param
      def self.valid?(val)
        val.kind_of?(::String)
      end
    end

    class Boolean < Param
      def self.valid?(val)
        [true, false].include?(val)
      end
    end

    class Integer < Param
      def self.valid?(val)
        val.kind_of?(::Integer)
      end
    end

    class IntegerOrMax < Integer
      def self.valid?(val)
        super || val == 'max'
      end
    end

    class Enum < Param
      class << self
        def [](*values)
          Class.new(self){
            self.allowed_values = values
          }
        end

        attr_accessor :allowed_values

        def inspect
          "#<Enum#{allowed_values}>"
        end

        alias_method :to_s, :inspect
      end

      def valid?(val)
        self.class.allowed_values or fail(NotImplementedError, "Abstract enum used as a param type")
        self.class.allowed_values.include?(val)
      end
    end
  end

  #class IntegerOrMax < Virtus::Attribute::Integer
    #def coerce(value)
      #value.to_s == 'max' ? 'max' : super
    #end
  #end

  #class List < Virtus::Attribute
  #end

  #module Enum
    #module_function

    #def coerce(value, values)
      #value = value.to_sym
      #values.include?(value) or
        #fail(ArgumentError, "Enum #{values} not accepts #{value}")

      #value
    #end
    
    #def [](*values)
      #values.map!(&:to_sym)
      
      #Class.new(Virtus::Attribute) do
        #primitive Symbol

        #define_method :coerce do |value|
          #return nil unless value
          
          #Enum.coerce(value, values)
        #end
      #end
    #end

    #def list(*values)
      #values.map!(&:to_sym)
      
      #Class.new(List) do
        #define_method :coerce do |value|
          #return nil unless value
          
          #value.map{|v| Enum.coerce(v, values)}
        #end
      #end
    #end
  #end

  #module ModuleAttr
    #module_function
    
    #def coerce(value, values)
      #case value
      #when Symbol
        #values.include?(value) && MWModule.list.key?(value) or
          #fail(ArgumentError, "Unsupported module: #{value}")
        #MWModule.list[value].new
        
      #when Hash
        #value.count == 1 or
          #fail(ArgumentError, "Too many values for module initialization")

        #name, attr = value.first
        #values.include?(name) && MWModule.list.key?(name) or
          #fail(ArgumentError, "Unsupported module: #{name}")

        #attr.is_a?(Hash) or
          #fail(ArgumentError, "Module only can be initialized with a hash, #{attr.class} given")

        #MWModule.list[name].new(attr)
      #else
        #fail ArgumentError, "Can not coerce #{value} into module"
      #end
    #end
    
    #def [](*values)
      #values.map!(&:to_sym)
      
      #Class.new(Virtus::Attribute) do
        #define_method :coerce do |value|
          #return nil unless value
          
          #ModuleAttr.coerce(value, values)
        #end
      #end
    #end

    #def list(*values)
      #values.map!(&:to_sym)
      
      #Class.new(List) do
        #define_method :coerce do |value|
          #return nil unless value

          ## converting to homogenouse array of one-key hashes
          #value.map{|val|
            #case val
            #when Symbol
              #{val => {}}
            #when Hash
              #val.map{|k, v| {k => v}}
            #else
              #fail(ArgumentError, "Unprocessable entry in module list: #{val}")
            #end
          #}.flatten.map{|v| ModuleAttr.coerce(v, values)}
        #end
      #end
    #end
  #end

  class MWModule
    #include Virtus.model

    #class << self
      #def list
        #@list ||= {}
      #end
      
      #def symbol(sym)
        #MWModule.list[sym] = self
      #end
      
      #def r_attribute(name, type, *arg)
        #attribute(name, type, *arg)
        #define_method(name){|*arg|
          #return super() if arg.empty?
          #self.class.new(to_h).tap{|dup| 
            #case type
            #when Array, ->(t){t.is_a?(Class) && t.ancestors.include?(List)}
              #dup.send("#{name}=", arg.flatten)
            #else
              #dup.send("#{name}=", *arg)
            #end
          #}
        #}
      #end
    #end
    class << self
      def params
        @params ||= {}
      end

      def param(name, type)
        params[name] = type
        
        define_method(name){|*arg|
          return param(name).value if arg.empty?
          
          self.class.new(to_h).tap{|dup| 
            case
            when type.ancestors.include?(Params::List)
              dup.param(name).value = arg.flatten
            else
              dup.param(name).value = arg.first
            end
          }
        }
      end
    end

    def initialize(**values)
      @params = {}
      
      values.each do |k, v|
        set(k, v)
      end
    end

    def to_h
      @params.map{|n, p| [n, p.value]}.to_h
    end

    def param(name)
      @params[name]
    end

    protected

    def set(name, value)
      @params[name] = self.class.params[name].new(name, value)
    end
  end
end
