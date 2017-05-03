# frozen_string_literal: true

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
        vars.each { |name, val| instance_variable_set("@#{name}", val) }
        ERB.new(File.read(File.expand_path("../templates/#{template}.erb", __FILE__)))
          .result(binding)
      end

      def partial(template, context = nil)
        # Never repeat this at home, dear children.
        if context
          instance_variables.each { |var| context.instance_variable_set(var, instance_variable_get(var)) }
        end
        ERB.new(File.read(File.expand_path("../templates/#{template}.erb", __FILE__)))
          .result(context ? context.get_binding : binding)
      end

      def get_binding
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
