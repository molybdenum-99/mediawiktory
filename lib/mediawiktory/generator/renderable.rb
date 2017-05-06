# frozen_string_literal: true

require 'erb'

module MediaWiktory
  class Generator
    module Renderable
      def to_h
        stringify_hash(super, recursive: true)
      end

      def render_to(path, **vars)
        FileUtils.mkdir_p File.dirname(path)
        File.write(path, to_html(**vars))
      end

      def to_html(**vars)
        render(vars.fetch(:template, main_template), **vars)
      end

      def render(template, **vars)
        puts "Rendering #{template} with #{self}#{vars}"
        vars.each { |name, val| instance_variable_set("@#{name}", val) }
        path = File.expand_path("../templates/#{template}.erb", __FILE__)
        ERB.new(File.read(path))
           .tap { |tpl| tpl.filename = path }
           .result(binding)
      end

      def partial(template, context = nil)
        puts "Rendering #{template} with #{context || self}"
        # Never repeat this at home, dear children.
        if context
          instance_variables.each { |var| context.instance_variable_set(var, instance_variable_get(var)) }
        end
        path = File.expand_path("../templates/#{template}.erb", __FILE__)
        ERB.new(File.read(path))
           .tap { |tpl| tpl.filename = path }
           .result(context ? context.get_binding : binding)
      rescue => e
        puts "#{e} while #{template} with #{context || self}"
        raise
      end

      def get_binding # rubocop:disable Style/AccessorMethodName
        binding
      end

      private

      def stringify_hash(hash, recursive: false)
        hash.map { |k, v|
          [k.to_s, v.is_a?(Hash) && recursive ? stringify_hash(v, recursive: true) : v.to_s]
        }.to_h
      end
    end
  end
end
