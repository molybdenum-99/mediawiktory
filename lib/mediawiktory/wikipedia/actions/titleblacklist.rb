module MediaWiktory::Wikipedia::Actions
  # Validate an article title, filename, or username against the TitleBlacklist. 
  #
  # Usage:
  #
  # ```ruby
  # api.titleblacklist(**options).perform # returns string with raw output
  # # or
  # api.titleblacklist(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.titleblacklist.title(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Titleblacklist < MediaWiktory::GetAction
    # The string to validate against the blacklist.
    #
    # @param value [String]
    # @return [self]
    def title(value)
      merge(tbtitle: value.to_s)
    end
    # The action to be checked.
    #
    # @param value [String] One of "create", "edit", "upload", "createtalk", "createpage", "move", "new-account".
    # @return [self]
    def action(value)
      merge(tbaction: value.to_s)
    end
    # Don't try to override the titleblacklist.
    #
    # @return [self]
    def nooverride()
      merge(tbnooverride: 'true')
    end

  end
end
