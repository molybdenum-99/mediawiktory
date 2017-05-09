# frozen_string_literal: true

require 'open-uri'
require 'json'

module MediaWiktory
  class Generator
    class Api < OpenStruct
      class << self
        def from_html(source, **metadata)
          doc = Nokogiri::HTML(source)
          modules =
            doc
            .at('#mw-content-text').children_groups('h3,h4', 'div,p')
            .map { |title, components| Module.from_html_nodes(title.first._n.text.to_s, components) }

          new(**metadata.merge(modules: modules))
        end

        def from_url(url)
          uri = Addressable::URI.parse(url)
          uri.query_values = {action: :query, meta: :siteinfo, siprop: :general, format: :json}
          meta = JSON.parse(open(uri).read)['query']['general']
          uri.query_values = {action: :help, recursivesubmodules: true}
          html = open(uri).read
          from_html(html, site: OpenStruct.new(name: meta['sitename'], base: meta['base']))
        end
      end

      def initialize(**source)
        super(source.merge(
          main: source[:modules].detect(&:main?),
          actions: source[:modules].select(&:action?),
          non_actions: source[:modules].reject { |m| m.main? || m.action? }
        ))
        modules.each { |m| m.api = self }

        # "generators" parameter for action=query are special. They are not defined by modules, but
        # by "You can use this or that module, just add 'g' to it".
        query = actions.detect { |a| a.name == 'query' } or return
        query.params.detect { |p| p.name == 'generator' }
             .tap do |query_generator|

          self.generators =
            query_generator
            .modules.map { |mod|
              mod.merge(
                name: "g-#{mod.name}",
                description: "#{mod.description} _Generator module: for fetching pages corresponding to request._",
                params: mod.params.reject { |p| p.name == 'prop' }.map(&:dup)
              ).tap { |m| m.prefix = "g#{m.prefix}" }
            }

          modules.concat(generators)
          non_actions.concat(generators)
          query_generator.vals =
            query_generator.vals.map { |v| {name: v.name, module: "g-#{v.module}"} }
        end
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
    end
  end
end
