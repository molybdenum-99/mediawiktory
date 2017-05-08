# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Shorten a long URL into a shorter one. 
    #
    # Usage:
    #
    # ```ruby
    # api.shortenurl.url(value).perform # returns string with raw output
    # # or
    # api.shortenurl.url(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Shortenurl < MediaWiktory::Wikipedia::Actions::Post

      # URL to be shortened.
      #
      # @param value [String]
      # @return [self]
      def url(value)
        merge(url: value.to_s)
      end
    end
  end
end
