module ApiParser
  # API "module": combination of parameters and values with its own sense
  class Module < Hashie::Mash
    class << self
      def from_url(url)
        doc = Nokogiri::HTML(ApiParser.client.get(url).body)
        title, prefix = extract_title(doc)

        new(
          url: url,
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

    def to_ruby(base_path)
      [
        "module MediaWiktory",
        "  class #{class_name} < MWModule",
        "    symbol #{name.to_sym.inspect}",
        prefix && !prefix.empty? && "    prefix: #{prefix.inspect}",
        post? && "    post!",
        *params.map{|p| p.to_ruby(base_path)},
        "  end",
        "end"
      ].reject{|v| !v}.join("\n")
    end

    def to_generator_ruby
      [
        "module MediaWiktory",
        "  class G#{class_name} < #{class_name}",
        "    symbol #{('g' + name).to_sym.inspect}",
        "    prefix: #{('g' + prefix.to_s).inspect}",
        "  end",
        "end"
      ].reject{|v| !v}.join("\n")
    end

    def name
      title.split('=').last
    end

    def class_name
      name.gsub(/(^|-)\w/){|s| s.sub('-', '').upcase}
    end

    def write(base_path)
      if title == 'Main module'
        params.detect{|p| p.name == 'action'}.vals.map(&:module).each{|mod|
          mod.write(base_path)
        }
      else
        File.write(File.join(base_path, "#{name}.rb"), to_ruby(base_path))
        File.write(File.join(base_path, "g#{name}.rb"), to_generator_ruby) if generator?
      end
    end

    def post?
      flags.detect{|f| f.id == 'apihelp-flag-mustbeposted'}
    end

    def generator?
      flags.detect{|f| f.id == 'apihelp-flag-generator'}
    end
  end
end
