module MediaWiktory::Wikipedia::Actions
  # Link an account from a third-party provider to the current user. 
  #
  # Usage:
  #
  # ```ruby
  # api.linkaccount(**options).perform # returns string with raw output
  # # or
  # api.linkaccount(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.linkaccount.requests(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Linkaccount < MediaWiktory::GetAction
    # Only use these authentication requests, by the id returned from action=query&meta=authmanagerinfo with amirequestsfor=link or from a previous response from this module.
    #
    # @param values [Array<String>]
    # @return [self]
    def requests(*values)
      merge(linkrequests: values.join('|'))
    end
    # Format to use for returning messages.
    #
    # @param value [String] One of "html", "wikitext", "raw", "none".
    # @return [self]
    def messageformat(value)
      merge(linkmessageformat: value.to_s)
    end
    # Merge field information for all authentication requests into one array.
    #
    # @return [self]
    def mergerequestfields()
      merge(linkmergerequestfields: 'true')
    end
    # Return URL for third-party authentication flows, must be absolute. Either this or linkcontinue is required.
    #
    # @param value [String]
    # @return [self]
    def returnurl(value)
      merge(linkreturnurl: value.to_s)
    end
    # This request is a continuation after an earlier UI or REDIRECT response. Either this or linkreturnurl is required.
    #
    # @return [self]
    def continue()
      merge(linkcontinue: 'true')
    end
    # A "csrf" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(linktoken: value.to_s)
    end

  end
end