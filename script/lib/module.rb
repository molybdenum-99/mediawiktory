module ApiParser
  # API "module": combination of parameters and values with its own sense
  class Module < Hashie::Mash
    class << self
      def from_url(url)
        doc = Nokogiri::HTML(ApiParser.client.get(url).body)
        title, prefix = extract_title(doc)

        new(
          title: title,
          prefix: prefix,
          description: extract_description(doc),
          flags: extract_flags(doc),
          params: extract_params(doc, prefix)
        )
      end

      private

      def extract_title(doc)
        title = doc.at('.apihelp-header').text
        if title =~ /^(.+)\s+\((.+)\)$/
          [$1, $2]
        else
          [title, nil]
        end
      end

      def extract_description(doc)
        if desc = doc.at('.apihelp-flags + p')
          desc.text.strip
        end 
      end

      def extract_flags(doc)
        doc.at('.apihelp-flags').search('ul li > span').to_a.map{|el|
          {id: el.attr('class'), text: el.text}
        }.map{|h|
          h.merge(role: h[:id].sub(/^apihelp-(flag-)?/, ''))
        }
      end

      def extract_params(doc, prefix)
        return [] unless doc.at('.apihelp-parameters > dl')
        doc.at('.apihelp-parameters > dl').
          each_term.to_a.
          map{|dts, dds| Parameter.from_html(dts.first, dds, prefix)}
      end
    end

    def to_yaml
      to_hash.reject{|k,v| !v}.to_yaml
    end
  end
end
