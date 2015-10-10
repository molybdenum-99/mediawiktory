module ApiParser
  # Parameter of some call
  class Parameter < Hashie::Mash
    class << self
      def from_html(dt, dds, prefix = nil)
        new(
          name: dt.text,
          prefix: prefix,
          description: extract_description(dds),
          type: extract_type(dds),
          values: extract_values(dds),
          default: extract_default(dds) #,
          #limit: extract_limit(dds),
          # TODO: extract mandatoriness (optional, mandatory, this OR that is mandatory, this AND that can't intersect and so on
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
            return 'several'
          when /^One of the following values:/
            return 'one-of'
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
              return $1.split(',').map(&:strip).map{|val|
                  val.sub(/^(Can be |or )/, '') # Wtf?.. https://en.wikipedia.org/w/api.php?action=help&modules=query%2Bextlinks
                }.map{|n| {name: n}}
            end
          end
        end

        nil
      end
    end

    def to_yaml
      to_hash.reject{|k,v| !v}.to_yaml
    end

  end
end
