# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Fetch the Content Translation configuration json for the given language pair. 
    #
    # Usage:
    #
    # ```ruby
    # api.cxconfiguration.from(value).perform # returns string with raw output
    # # or
    # api.cxconfiguration.from(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Cxconfiguration < MediaWiktory::Wikipedia::Actions::Get

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
