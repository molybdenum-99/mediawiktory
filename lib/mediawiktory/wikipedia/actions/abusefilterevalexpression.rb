# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Evaluates an AbuseFilter expression. 
    #
    # Usage:
    #
    # ```ruby
    # api.abusefilterevalexpression(**options).perform # returns string with raw output
    # # or
    # api.abusefilterevalexpression(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.abusefilterevalexpression.expression(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Abusefilterevalexpression < MediaWiktory::Wikipedia::Actions::Get

      # The expression to evaluate.
      #
      # @param value [String]
      # @return [self]
      def expression(value)
        merge(expression: value.to_s)
      end
    end
  end
end
