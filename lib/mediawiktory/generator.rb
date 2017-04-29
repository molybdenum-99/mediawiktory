# frozen_string_literal: true

require 'nokogiri' # FIXME: catch if unavailable
require 'nokogiri/more'
require 'hashie'
require 'addressable'
require 'fileutils'
require 'pp'
require 'mediawiktory/version'

require_relative 'generator/renderable'

module MediaWiktory
  class Generator
    class BaseAction
      def initialize(api)
        @api = api
      end

      include Renderable

      def main_template
        'action.rb'
      end

      def to_h
        {'main' => @api.main.to_h}
      end
    end

    class Client
      include Renderable

      def main_template
        'client.rb'
      end

      def to_h
        {}
      end
    end

    def initialize(url)
      @api = Api.from_url(url)
      @url = url
    end

    def generate(path:, namespace:)
      opts = {namespace: namespace, version: VERSION, source: @url, friendly_date: Time.now.strftime('%B %d, %Y')}
      FileUtils.rm_rf path
      FileUtils.mkdir_p path

      BaseAction.new(@api).render_to(File.join(path, 'action.rb'), opts)
      Client.new.render_to(File.join(path, 'client.rb'), opts)

      @api.render_to(File.join(path, 'api.rb'), opts)
      @api.actions.each do |a|
        a.render_to(File.join(path, "actions/#{a.name}.rb"), opts)
      end
      @api.non_actions.each do |a|
        a.render_to(
          File.join(path, "modules/#{a.name}.rb"),
          opts.merge(template: 'module_class.rb')
        )
      end
    end
  end
end

require_relative 'generator/api'
require_relative 'generator/param'
require_relative 'generator/module'
