require 'mediawiktory/util'

module MediaWiktory
  class Generator
    module Renderable
      def to_h
        Util.stringify_hash(super, recursive: true)
      end

      def render_to(path, **vars)
        File.write(path, to_html(**vars))
      end

      def to_html(**vars)
        liquid(main_template, **vars)
      end

      def liquid(template, **vars)
        Liquid::Template.file_system = Liquid::LocalFileSystem.new(File.expand_path('../templates/', __FILE__))
        Liquid::Template
          .parse(File.read(File.expand_path("../templates/#{template}.liquid", __FILE__)))
          .render({'object' => to_h}.merge(Util.stringify_hash(vars)))
          .chomp # templates files in most editors add empty line to an ending
      end
    end
  end
end
