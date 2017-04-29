# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Retrieve localized JSON data. 
    #
    # Usage:
    #
    # ```ruby
    # api.jsondata(**options).perform # returns string with raw output
    # # or
    # api.jsondata(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.jsondata.title(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Jsondata < MediaWiktory::Wikipedia::Actions::Get

      # Title to get. By default assumes namespace to be "Data:"
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(title: value.to_s)
      end
    end
  end
end
