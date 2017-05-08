# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Check syntax of an AbuseFilter filter. 
    #
    # Usage:
    #
    # ```ruby
    # api.abusefilterchecksyntax(**options).perform
    # # or
    #
    # api.abusefilterchecksyntax.filter(value).perform # returns string with raw output
    # # or
    # api.abusefilterchecksyntax.filter(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
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
