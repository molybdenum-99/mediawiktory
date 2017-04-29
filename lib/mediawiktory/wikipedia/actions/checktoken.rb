# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Check the validity of a token from action=query&meta=tokens. 
    #
    # Usage:
    #
    # ```ruby
    # api.checktoken(**options).perform # returns string with raw output
    # # or
    # api.checktoken(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.checktoken.type(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Checktoken < MediaWiktory::Wikipedia::Actions::Get

      # Type of token being tested.
      #
      # @param value [String] One of "createaccount", "csrf", "deleteglobalaccount", "login", "patrol", "rollback", "setglobalaccountstatus", "userrights", "watch".
      # @return [self]
      def type(value)
        merge(type: value.to_s)
      end

      # Token to test.
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end

      # Maximum allowed age of the token, in seconds.
      #
      # @param value [Integer]
      # @return [self]
      def maxtokenage(value)
        merge(maxtokenage: value.to_s)
      end
    end
  end
end
