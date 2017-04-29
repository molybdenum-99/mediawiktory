# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Remove a linked third-party account from the current user. 
    #
    # Usage:
    #
    # ```ruby
    # api.unlinkaccount(**options).perform # returns string with raw output
    # # or
    # api.unlinkaccount(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.unlinkaccount.request(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Unlinkaccount < MediaWiktory::Wikipedia::Actions::Post

      # Use this authentication request, by the id returned from action=query&meta=authmanagerinfo with amirequestsfor=unlink.
      #
      # @param value [String]
      # @return [self]
      def request(value)
        merge(request: value.to_s)
      end

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
