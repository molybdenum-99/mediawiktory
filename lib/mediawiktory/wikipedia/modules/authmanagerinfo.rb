module MediaWiktory::Wikipedia::Modules
  # Retrieve information about the current authentication status. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.authmanagerinfo(**options).perform # returns string with raw output
  # # or
  # api.some_action.authmanagerinfo(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.authmanagerinfo.securitysensitiveoperation(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Authmanagerinfo < MediaWiktory::Submodule
    # Test whether the user's current authentication status is sufficient for the specified security-sensitive operation.
    #
    # @param value [String]
    # @return [self]
    def securitysensitiveoperation(value)
      merge(amisecuritysensitiveoperation: value.to_s)
    end
    # Fetch information about the authentication requests needed for the specified authentication action.
    #
    # @param value [String] One of "login", "login-continue", "create", "create-continue", "link", "link-continue", "change", "remove", "unlink".
    # @return [self]
    def requestsfor(value)
      merge(amirequestsfor: value.to_s)
    end
    # Merge field information for all authentication requests into one array.
    #
    # @return [self]
    def mergerequestfields()
      merge(amimergerequestfields: 'true')
    end
    # Format to use for returning messages.
    #
    # @param value [String] One of "html", "wikitext", "raw", "none".
    # @return [self]
    def messageformat(value)
      merge(amimessageformat: value.to_s)
    end

  end
end