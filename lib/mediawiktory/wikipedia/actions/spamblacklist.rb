# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Validate one or more URLs against the SpamBlacklist. 
    #
    # Usage:
    #
    # ```ruby
    # api.spamblacklist(**options).perform
    # # or
    #
    # api.spamblacklist.url(value).perform # returns string with raw output
    # # or
    # api.spamblacklist.url(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Spamblacklist < MediaWiktory::Wikipedia::Actions::Get

      # URLs to validate against the blacklist.
      #
      # @param values [Array<String>]
      # @return [self]
      def url(*values)
        values.inject(self) { |res, val| res._url(val) }
      end

      # @private
      def _url(value)
        merge(url: value.to_s)
      end
    end
  end
end
