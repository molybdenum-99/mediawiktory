# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Output data in XML format. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Xml

      # If specified, adds the named page as an XSL stylesheet. The value must be a title in the MediaWiki namespace ending in .xsl.
      #
      # @param value [String]
      # @return [self]
      def xslt(value)
        merge(xslt: value.to_s)
      end

      # If specified, adds an XML namespace.
      #
      # @return [self]
      def includexmlnamespace()
        merge(includexmlnamespace: 'true')
      end
    end
  end
end
