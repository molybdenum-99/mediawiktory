module MediaWiktory
  module Params
    class Param
      attr_reader :name, :value
      
      def initialize(name, value = nil)
        @name = name
        self.value = value if value
      end

      def value=(val)
        valid?(val) or
          fail(ArgumentError, "Invalid value #{val.inspect} for param #{name} (#{self.class})")

        @value = val
      end
      
      def to_param(prefix = nil)
        {"#{prefix}#{name}" => value_to_param}
      end

      def value_to_param
        value.to_s
      end

      def self.valid?(val)
        true
      end

      def valid?(val)
        self.class.valid?(val)
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

    class Timestamp < Param
      def self.valid?(val)
        val.kind_of?(::Time)
      end

      def value_to_param
        value.iso8601
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

      def self.valid?(val)
        allowed_values or fail(NotImplementedError, "Abstract enum used as a param type")
        allowed_values.include?(val)
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

      def value_to_param
        value.join('|')
      end
    end

    class Module < Param
      class << self
        def [](*values)
          Class.new(self){
            self.allowed_values = values
          }
        end

        attr_accessor :allowed_values
      end
      
      def value=(val)
        super(val && MWModule.coerce(val))
      end

      def to_param(prefix = nil)
        {"#{prefix}#{name}" => value.class.symbol.to_s}.merge(value.to_param)
      end

      def self.valid?(val)
        allowed_values or fail(NotImplementedError, "Abstract module used as a param type")
        allowed_values.include?(val.class.symbol)
      end
    end

    class Modules < Param
      class << self
        def [](*values)
          Class.new(self){
            self.allowed_values = values
          }
        end

        attr_accessor :allowed_values
      end

      def value=(val)
        super(val && coerce_modules(val))
      end

      def to_param(prefix = nil)
        [{"#{prefix}#{name}" => value.map{|v|v.class.symbol}.join('|')},
          *value.map(&:to_param)
        ].inject({}, :merge)
      end

      def self.valid?(val)
        allowed_values or fail(NotImplementedError, "Abstract module used as a param type")
        val.all?{|v| allowed_values.include?(v.class.symbol)}
      end

      private

      def coerce_modules(value)
        # making array of 1-item hashes
        value.map{|val|
          case val
          when Symbol
            {val => {}}
          when Hash
            val.map{|k, v| {k => v}}
          when MWModule
            val
          else
            fail(ArgumentError, "#{val} can not be coerced into module")
          end
        }.flatten.map{|h| MWModule.coerce(h)}
      end
    end
  end

  class MWModule

    class << self
      def list
        @list ||= {}
      end
      
      def symbol(sym = nil)
        return @symbol unless sym
        @symbol = sym
        MWModule.list[sym] = self
      end

      def prefix(pref = nil)
        return @prefix unless pref
        @prefix = pref
      end

      def coerce(value)
        case value
        when Symbol
          MWModule.list.key?(value) or
            fail(ArgumentError, "Unsupported module: #{value} for #{self}")
          MWModule.list[value].new
          
        when Hash
          value.count == 1 or
            fail(ArgumentError, "Too many values for module initialization")

          name, attr = value.first
          MWModule.list.key?(name) or
            fail(ArgumentError, "Unsupported module: #{name} for #{self}")

          attr.is_a?(Hash) or
            fail(ArgumentError, "Module only can be initialized with a hash, #{attr.class} given")

          MWModule.list[name].new(attr)
        when MWModule
          value
        else
          fail ArgumentError, "Can not coerce #{value} into module"
        end
      end

      def params
        @params ||= {}
      end

      def param(name, type)
        params[name] = type
        
        define_method(name){|*arg|
          return param(name).value if arg.empty?
          
          dup.tap{|dup| 
            case
            when type.ancestors.include?(Params::List) ||
                 type.ancestors.include?(Params::Modules)
              dup.param(name).value = arg.flatten
            else
              dup.param(name).value = arg.first
            end
          }
        }
      end

      def request_method
        @request_method || :get
      end

      def post!
        @request_method = :post
      end
    end

    def initialize(**values)
      @params = Hash.new{|h, name|
        self.class.params.key?(name) or
          fail(ArgumentError, "Unknown param: #{name} for #{self}")
        h[name] = self.class.params[name].new(name)
      }
      
      values.each do |k, v|
        set(k, v)
      end
    end

    def dup
      self.class.new(to_h)
    end

    def to_h
      @params.map{|n, p| [n, p.value]}.to_h
    end

    def param(name)
      @params[name]
    end

    def to_param
      @params.values.map{|p| p.to_param(self.class.prefix)}.inject({}, :merge)
    end

    protected

    def set(name, value)
      self.class.params.key?(name) or
        fail(ArgumentError, "Unknown param: #{name} for #{self}")
      @params[name] = self.class.params[name].new(name, value)
    end
  end
end
