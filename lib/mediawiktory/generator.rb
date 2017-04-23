require 'nokogiri' # FIXME: catch if unavailable
require 'nokogiri/more'
require 'hashie'
require 'addressable'
require 'fileutils'
require 'pp'
require 'mediawiktory/version'

module MediaWiktory
  class Generator
    def initialize(url)
      @api = Api.from_url(url)
    end

    def generate(path:, namespace:)
      opts = {namespace: namespace, version: VERSION}
      FileUtils.rm_rf path
      FileUtils.mkdir_p path
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

require_relative 'generator/renderable'
require_relative 'generator/api'
require_relative 'generator/param'
require_relative 'generator/module'
