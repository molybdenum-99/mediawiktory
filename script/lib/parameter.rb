module ApiParser
  # Parameter of some call
  class Parameter < Hashie::Mash
    class << self
      def from_html(dt, dds, prefix = nil)
        new(
          full_name: dt.text,
          name: dt.text.sub(/^#{prefix}/, ''),
          prefix: prefix,
          description: extract_description(dds),
          type: extract_type(dds),
          vals: extract_values(dds),
          default: extract_default(dds)

          # TODO: limit: extract_limit(dds),
          
          # TODO: mandatoriness:
          # * optional
          # * mandatory
          # * this OR that is mandatory
          # * this AND that can't intersect
          # * and so on
        )
      end

      def extract_description(els)
        if p = els.detect{|e| e.attr('class') == 'description'}.at('p')
          p.text.strip
        end
      end

      def extract_type(els)
        els.select{|e| e.attr('class') == 'info'}.each do |el|
          case el.text
          when /^Type: ([^\(]+)\s*($|\()/
            return $1.strip
          when /^Values \(separate with \|\):/,
               /^Separate values with \|/
            return 'list'
          when /^One of the following values:/
            return 'enum'
          end
        end
        'string'
      end

      def extract_default(els)
        els.each{|el| return $1 if el =~ /^Default:\s*(.+)$/}
        nil
      end

      def extract_values(els)
        # 1. try dl from definition
        els.detect{|e| e.attr('class') == 'description'}.tap{|d|
          if d.at('dl')
            return d.at('dl').each_term.map{|dts, dds|
              {name: dts.first.text, description: dds.first.text}
            }
          end
        }
        
        # 2. ...or take from info
        els.select{|e| e.attr('class') == 'info'}.each do |el|
          if el.text =~ /^(?:One of the following values||Values \(separate with \|\)):\s*(.+)$/
            if el.at('a')
              return el.search('a').map{|a|
                {name: a.text, module: Module.from_url(a.attr('href'))}
              }
            else
              return $1.sub(/^Can be empty, or/, '').split(',').
                map{|s| s.gsub(/[[:space:]]/, '')}.
                map{|n| {name: n}}
            end
          end
        end

        nil
      end
    end

    def initialize(hash)
      super(hash.reject{|k,v| !v || v.respond_to?(:empty?) && v.empty?})
    end

    def to_yaml
      to_hash.to_yaml
    end

    def to_ruby(base_path)
      type_str = case type
      when 'boolean'
        'Params::Boolean'
      when 'string', 'user name'
        'Params::String'
      when 'integer'
        'Params::Integer'
      when 'integer or max'
        'Params::IntegerOrMax'
      when 'timestamp'
        'Params::Timestamp'
      when 'list'
        case
        when !vals
          'Params::List[Params::String]'
        when vals.first.module
          vals.map(&:module).each{|m| m.write(base_path)}
          "Params::Modules#{vals.map(&:name).map(&:to_sym)}"
        else
          "Params::List[Params::Enum#{vals.map(&:name).map(&:to_sym)}]"
        end
      when 'list of integers'
        'Params::List[Params::Integer]'
      when 'list of timestamps'
        'Params::List[Params::Timestamp]'
      when 'enum'
        case
        when vals.first.module
          vals.map(&:module).each{|m| m.write(base_path)}
          "Params::Module#{vals.map(&:name).map(&:to_sym)}"
        else
          "Params::Enum#{vals.map(&:name).map(&:to_sym)}"
        end
      else
        fail("Unrecognized param type: #{type}")
      end
      "    param #{name.to_sym.inspect}, #{type_str}"
    end

  end
end
