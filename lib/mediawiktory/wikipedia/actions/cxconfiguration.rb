# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Fetch the Content Translation configuration json for the given language pair. 
    #
    # Usage:
    #
    # ```ruby
    # api.cxconfiguration(**options).perform # returns string with raw output
    # # or
    # api.cxconfiguration(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.cxconfiguration.from(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Cxconfiguration < MediaWiktory::Wikipedia::GetAction

      # The source language code.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(from: value.to_s)
      end

      # The target language code.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(to: value.to_s)
      end
  end
  end
end
