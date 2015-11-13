require 'virtus'

module MediaWiktory
  class IntegerOrMax < Virtus::Attribute::Integer
    def coerce(value)
      value.to_s == 'max' ? 'max' : super
    end
  end

  class List < Virtus::Attribute
  end

  module Enum
    module_function

    def coerce(value, values)
      value = value.to_sym
      values.include?(value) or
        fail(ArgumentError, "Enum #{values} not accepts #{value}")

      value
    end
    
    def [](*values)
      values.map!(&:to_sym)
      
      Class.new(Virtus::Attribute) do
        primitive Symbol

        define_method :coerce do |value|
          return nil unless value
          
          Enum.coerce(value, values)
        end
      end
    end

    def list(*values)
      values.map!(&:to_sym)
      
      Class.new(List) do
        define_method :coerce do |value|
          return nil unless value
          
          value.map{|v| Enum.coerce(v, values)}
        end
      end
    end
  end

  module ModuleAttr
    module_function
    
    def coerce(value, values)
      case value
      when Symbol
        values.include?(value) && MWModule.list.key?(value) or
          fail(ArgumentError, "Unsupported module: #{value}")
        MWModule.list[value].new
        
      when Hash
        value.count == 1 or
          fail(ArgumentError, "Too many values for module initialization")

        name, attr = value.first
        values.include?(name) && MWModule.list.key?(name) or
          fail(ArgumentError, "Unsupported module: #{name}")

        attr.is_a?(Hash) or
          fail(ArgumentError, "Module only can be initialized with a hash, #{attr.class} given")

        MWModule.list[name].new(attr)
      else
        fail ArgumentError, "Can not coerce #{value} into module"
      end
    end
    
    def [](*values)
      values.map!(&:to_sym)
      
      Class.new(Virtus::Attribute) do
        define_method :coerce do |value|
          return nil unless value
          
          ModuleAttr.coerce(value, values)
        end
      end
    end

    def list(*values)
      values.map!(&:to_sym)
      
      Class.new(List) do
        define_method :coerce do |value|
          return nil unless value

          # converting to homogenouse array of one-key hashes
          value.map{|val|
            case val
            when Symbol
              {val => {}}
            when Hash
              val.map{|k, v| {k => v}}
            else
              fail(ArgumentError, "Unprocessable entry in module list: #{val}")
            end
          }.flatten.map{|v| ModuleAttr.coerce(v, values)}
        end
      end
    end
  end

  class MWModule
    include Virtus.model

    class << self
      def list
        @list ||= {}
      end
      
      def symbol(sym)
        MWModule.list[sym] = self
      end
      
      def r_attribute(name, type, *arg)
        attribute(name, type, *arg)
        define_method(name){|*arg|
          return super() if arg.empty?
          self.class.new(to_h).tap{|dup| 
            case type
            when Array, ->(t){t.is_a?(Class) && t.ancestors.include?(List)}
              dup.send("#{name}=", arg.flatten)
            else
              dup.send("#{name}=", *arg)
            end
          }
        }
      end
    end
  end
end
