module MediaWiktory
  class Generator
    class Module < Hashie::Mash
      class << self
        def from_html_nodes(title, nodes)
          type, name, prefix = title.scan(/^([a-z]+)=([^(]+)(?:\s+\((.+)\))?$/).flatten

          new(
            #url: url,
            type: type&.to_sym || :main,
            name: name,
            prefix: prefix,
            description: extract_description(nodes),
            flags: extract_flags(nodes),
            params: extract_params(nodes, prefix)
          )
        end

        private

        def extract_description(nodes)
          #nodes.select { |n| n.name == 'p' }.map(&:text).map(&:strip).join("\n")
          nodes.detect { |n| n.name == 'p' }&.text.to_s.gsub("\n", ' ')
        end

        def extract_flags(nodes)
          flags = nodes.detect { |n| n['class']&.include?('apihelp-flags') } or return []
          flags.search('ul li > span').to_a
               .map { |el| {id: el.attr('class'), text: el.text} }
               .map { |h| h.merge(role: h[:id].sub(/^apihelp-(flag-)?/, '')) }
        end

        def extract_params(nodes, prefix)
          params = nodes.detect { |n| n['class']&.include?('apihelp-parameters') } or return []
          params.at('dl').each_term.to_a
                .map{ |dts, dds| Param.from_html_nodes(dts.first.text, dds, prefix: prefix) }
        end
      end

      attr_reader :api

      def inspect
        "#<#{self.class.name} #{name}>"
      end

      def action?
        type == :action
      end

      def main?
        type == :main
      end

      include Renderable

      def main_template
        'action_class.rb'
      end

      def api=(api)
        @api = api
        params.each { |p| p.api = api }
      end

      def to_h
        super.merge(
          'class_name' => class_name,
          'method_name' => name.split('-').join('_'),
          'description' => description.split("\n").join("\n#\n# "),
          'params' => params
            .reject { |p| p.name == '*' } # TODO: some actions have "rest of parameters, see there". Currently, we ignore it
            .map(&:to_h)
        )
      end

      def class_name
        name.split('-').map(&:capitalize).join
      end
    end
  end
end
