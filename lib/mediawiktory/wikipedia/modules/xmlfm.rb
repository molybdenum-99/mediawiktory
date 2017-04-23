module MediaWiktory::Wikipedia::Modules
  # Output data in XML format (pretty-print in HTML). 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.xmlfm(**options).perform # returns string with raw output
  # # or
  # api.some_action.xmlfm(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.xmlfm.wrappedhtml(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Xmlfm
    # Return the pretty-printed HTML and associated ResourceLoader modules as a JSON object.
    #
    # @return [self]
    def wrappedhtml()
      merge(wrappedhtml: 'true')
    end
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
