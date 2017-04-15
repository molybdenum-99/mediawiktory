module MediaWiktory
  module ApiParser
    class Api
      def self.from_html(source)
        doc = Nokogiri::HTML(source)
        modules = doc.at('#mw-content-text').children_groups('h3', 'div,p,h4')
          .select { |title, components| title.first&.text.to_s.start_with?('action=') }
          .map { |title, components| Module.from_nodes(title.first.text, components) }

        new(modules)
      end

      attr_reader :actions

      def initialize(actions)
        @actions = actions
      end
    end
  end
end
