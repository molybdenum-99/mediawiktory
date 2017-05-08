# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Get JWT tokens to authenticate with cxserver. 
    #
    # Usage:
    #
    # ```ruby
    # api.cxtoken.token(value).perform # returns string with raw output
    # # or
    # api.cxtoken.token(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Cxtoken < MediaWiktory::Wikipedia::Actions::Post

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end
    end
  end
end
