# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Change authentication data for the current user. 
    #
    # Usage:
    #
    # ```ruby
    # api.changeauthenticationdata(**options).perform
    # # or
    #
    # api.changeauthenticationdata.request(value).perform # returns string with raw output
    # # or
    # api.changeauthenticationdata.request(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Changeauthenticationdata < MediaWiktory::Wikipedia::Actions::Post

      # Use this authentication request, by the id returned from action=query&meta=authmanagerinfo with amirequestsfor=change.
      #
      # @param value [String]
      # @return [self]
      def request(value)
        merge(changeauthrequest: value.to_s)
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(changeauthtoken: value.to_s)
      end
    end
  end
end
