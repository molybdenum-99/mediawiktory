# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Log in to the wiki using the interactive flow. 
    #
    # Usage:
    #
    # ```ruby
    # api.clientlogin(**options).perform # returns string with raw output
    # # or
    # api.clientlogin(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.clientlogin.requests(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Clientlogin < MediaWiktory::Wikipedia::GetAction

    # Only use these authentication requests, by the id returned from action=query&meta=authmanagerinfo with amirequestsfor=login or from a previous response from this module.
    #
    # @param values [Array<String>]
    # @return [self]
    def requests(*values)
      merge(loginrequests: values.join('|'))
    end

    # Format to use for returning messages.
    #
    # @param value [String] One of "html", "wikitext", "raw", "none".
    # @return [self]
    def messageformat(value)
      merge(loginmessageformat: value.to_s)
    end

    # Merge field information for all authentication requests into one array.
    #
    # @return [self]
    def mergerequestfields()
      merge(loginmergerequestfields: 'true')
    end

    # Preserve state from a previous failed login attempt, if possible.
    #
    # @return [self]
    def preservestate()
      merge(loginpreservestate: 'true')
    end

    # Return URL for third-party authentication flows, must be absolute. Either this or logincontinue is required.
    #
    # @param value [String]
    # @return [self]
    def returnurl(value)
      merge(loginreturnurl: value.to_s)
    end

    # This request is a continuation after an earlier UI or REDIRECT response. Either this or loginreturnurl is required.
    #
    # @return [self]
    def continue()
      merge(logincontinue: 'true')
    end

    # A "login" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(logintoken: value.to_s)
    end
  end
  end
end
