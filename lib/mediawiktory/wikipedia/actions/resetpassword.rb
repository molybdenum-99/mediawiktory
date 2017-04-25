# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Send a password reset email to a user. 
    #
    # Usage:
    #
    # ```ruby
    # api.resetpassword(**options).perform # returns string with raw output
    # # or
    # api.resetpassword(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.resetpassword.user(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Resetpassword < MediaWiktory::Wikipedia::GetAction

    # User being reset.
    #
    # @param value [String]
    # @return [self]
    def user(value)
      merge(user: value.to_s)
    end

    # Email address of the user being reset.
    #
    # @param value [String]
    # @return [self]
    def email(value)
      merge(email: value.to_s)
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
