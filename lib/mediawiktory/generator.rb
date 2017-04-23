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
      FileUtils.rm_rf path
      FileUtils.mkdir_p path
      @api.render_to(File.join(path, 'api.rb'), namespace: namespace, version: MediaWiktory::VERSION)
      @api.actions.each do |a|
        a.render_to(File.join(path, "#{a.name}.rb"), namespace: namespace, version: MediaWiktory::VERSION)
      end
    end
  end
end

require_relative 'generator/renderable'
require_relative 'generator/api'
require_relative 'generator/param'
require_relative 'generator/module'
