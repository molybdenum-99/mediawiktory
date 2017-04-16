module MediaWiktory
  module ApiParser
    class Api
      def self.from_html(source)
        doc = Nokogiri::HTML(source)
        modules = doc.at('#mw-content-text').children_groups('h3,h4', 'div,p')
          .map { |title, components| Module.from_nodes(title.first&.text.to_s, components) }

        new(modules)
      end

      attr_reader :actions, :modules

      def initialize(modules)
        @main = modules.detect { |m| m.type == :main }
        @modules = modules.reject { |m| m.type == :main }.map { |m| [m.name, m] }.to_h
        @actions = modules.select { |m| m.type == :action }
      end
    end
  end
end
