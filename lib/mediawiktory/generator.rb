# frozen_string_literal: true

require 'nokogiri' # FIXME: catch if unavailable
require 'nokogiri/more'
require 'hashie'
require 'addressable'
require 'fileutils'
require 'pp'
require 'mediawiktory/version'

require_relative 'generator/renderable'

# @private
class Object
  # Just a loosy implementation of Ruby 2.3's `&.` operator
  # It is used only in generator and will not pollute your scopes.
  def _n
    self
  end
end

# @private
class NilClass
  class BlackHole
    def method_missing(*) # rubocop:disable Style/MethodMissing
      nil
    end
  end

  def _n
    BlackHole.new
  end
end

module MediaWiktory
  # @private
  # Used only by mediawiktory-gen, should not be necessary to read :)
  class Generator
    class BaseAction
      def initialize(api)
        @api = api
      end

      include Renderable

      def main_template
        'action.rb'
      end

      def main
        @api.main
      end
    end

    class Client
      include Renderable

      def main_template
        'client.rb'
      end
    end

    class Response
      include Renderable

      def main_template
        'response.rb'
      end
    end

    def initialize(url)
      @api = Api.from_url(url)
      @url = url
    end

    def generate(path:, namespace:)
      opts = {
        namespace: namespace,
        version: VERSION,
        source: @url,
        friendly_date: Time.now.strftime('%B %d, %Y')
      }
      FileUtils.rm_rf path
      FileUtils.mkdir_p path

      BaseAction.new(@api).render_to(File.join(path, 'actions/base.rb'), opts)
      Client.new.render_to(File.join(path, 'client.rb'), opts)
      Response.new.render_to(File.join(path, 'response.rb'), opts)

      @api.render_to(File.join(path, 'api.rb'), opts)
      @api.render_to(File.join(path, 'actions.rb'), opts.merge(template: 'actions.rb'))
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
