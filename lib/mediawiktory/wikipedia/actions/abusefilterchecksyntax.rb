# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Check syntax of an AbuseFilter filter. 
    #
    # Usage:
    #
    # ```ruby
    # api.abusefilterchecksyntax(**options).perform # returns string with raw output
    # # or
    # api.abusefilterchecksyntax(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.abusefilterchecksyntax.filter(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Abusefilterchecksyntax < MediaWiktory::Wikipedia::Actions::Get

      # The full filter text to check syntax on.
      #
      # @param value [String]
      # @return [self]
      def filter(value)
        merge(filter: value.to_s)
      end
  end
  end
end
