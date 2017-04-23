module MediaWiktory::Wikipedia::Actions
  # Create a new user account. 
  #
  # Usage:
  #
  # ```ruby
  # api.createaccount(**options).perform # returns string with raw output
  # # or
  # api.createaccount(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.createaccount.requests(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Createaccount < MediaWiktory::GetAction
    # Only use these authentication requests, by the id returned from action=query&meta=authmanagerinfo with amirequestsfor=create or from a previous response from this module.
    #
    # @param values [Array<String>]
    # @return [self]
    def requests(*values)
      merge(createrequests: values.join('|'))
    end
    # Format to use for returning messages.
    #
    # @param value [String] One of "html", "wikitext", "raw", "none".
    # @return [self]
    def messageformat(value)
      merge(createmessageformat: value.to_s)
    end
    # Merge field information for all authentication requests into one array.
    #
    # @return [self]
    def mergerequestfields()
      merge(createmergerequestfields: 'true')
    end
    # Preserve state from a previous failed login attempt, if possible.
    #
    # @return [self]
    def preservestate()
      merge(createpreservestate: 'true')
    end
    # Return URL for third-party authentication flows, must be absolute. Either this or createcontinue is required.
    #
    # @param value [String]
    # @return [self]
    def returnurl(value)
      merge(createreturnurl: value.to_s)
    end
    # This request is a continuation after an earlier UI or REDIRECT response. Either this or createreturnurl is required.
    #
    # @return [self]
    def continue()
      merge(createcontinue: 'true')
    end
    # A "createaccount" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(createtoken: value.to_s)
    end

  end
end