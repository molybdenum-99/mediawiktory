# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Validate a two-factor authentication (OATH) token. 
    #
    # Usage:
    #
    # ```ruby
    # api.oathvalidate(**options).perform # returns string with raw output
    # # or
    # api.oathvalidate(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.oathvalidate.user(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Oathvalidate < MediaWiktory::Wikipedia::GetAction

      # User to validate token for. Defaults to the current user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(user: value.to_s)
      end

      # Two-factor authentication (OATH) token.
      #
      # @param value [String]
      # @return [self]
      def totp(value)
        merge(totp: value.to_s)
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
