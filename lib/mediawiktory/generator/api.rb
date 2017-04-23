require 'open-uri'
require 'json'

module MediaWiktory
  class Generator
    class Api < OpenStruct
      class << self
        def from_html(source, **metadata)
          doc = Nokogiri::HTML(source)
          modules = doc.at('#mw-content-text').children_groups('h3,h4', 'div,p')
                       .map { |title, components| Module.from_html_nodes(title.first&.text.to_s, components) }

          new(**metadata.merge(modules: modules))
        end

        def from_url(url)
          uri = Addressable::URI.parse(url)
          uri.query_values = {action: :query, meta: :siteinfo, siprop: :general, format: :json}
          meta = JSON.parse(open(uri).read).dig('query', 'general')
          uri.query_values = {action: :help, recursivesubmodules: true}
          html = open(uri).read
          from_html(html, source: url, site: {name: meta['sitename'], base: meta['base']})
        end
      end

      def initialize(**source)
        super(source.merge(
          main: source[:modules].detect(&:main?),
          actions: source[:modules].select(&:action?),
          non_actions: source[:modules].reject { |m| m.main? || m.action? }
        ))
        modules.each { |m| m.api = self }
      end

      def module(name)
        candidates = modules.reject(&:action?).select { |m| m.name == name }
        candidates.empty? and fail ArgumentError, "Module #{name} not found"
        candidates.count == 1 or fail ArgumentError, "Module #{name} is ambigous"
        candidates.first
      end

      include Renderable

      def main_template
        'api.rb'
      end

      def to_h
        super.merge('friendly_date' => Time.now.strftime('%B %d, %Y'), 'actions' => actions.map(&:to_h))
      end
    end
  end
end
