module MediaWiktory
  module ApiParser
    class Module < Hashie::Mash
      class << self
        def from_nodes(title, nodes)
          type, title, prefix = title.scan(/^([a-z]+)=([^(]+)(?:\s+\((.+)\))?$/).flatten

          new(
            #url: url,
            type: type.to_sym,
            title: title,
            prefix: prefix,
            description: extract_description(nodes),
            flags: extract_flags(nodes),
            params: extract_params(nodes, prefix)
          )
        end

        private

        def extract_description(nodes)
          nodes.select { |n| n.name == 'p' }.map(&:text).map(&:strip).join("\n")
        end

        def extract_flags(nodes)
          flags = nodes.detect { |n| n.matches?('.apihelp-flags') } or return []
          flags.search('ul li > span').to_a
            .map { |el| {id: el.attr('class'), text: el.text} }
            .map { |h| h.merge(role: h[:id].sub(/^apihelp-(flag-)?/, '')) }
        end

        def extract_params(nodes, prefix)
          params = nodes.detect { |n| n.matches?('.apihelp-parameters') } or return []
          params.at('dl').each_term.to_a
            .map{|dts, dds| Param.from_html_nodes(dts.first.text, dds, prefix: prefix)}
        end
      end
    end
  end
end
