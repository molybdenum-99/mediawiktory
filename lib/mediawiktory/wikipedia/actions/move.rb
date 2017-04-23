module MediaWiktory::Wikipedia::Actions
  # Move a page. 
  #
  # Usage:
  #
  # ```ruby
  # api.move(**options).perform # returns string with raw output
  # # or
  # api.move(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.move.from(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Move < MediaWiktory::GetAction
    # Title of the page to rename. Cannot be used together with fromid.
    #
    # @param value [String]
    # @return [self]
    def from(value)
      merge(from: value.to_s)
    end
    # Page ID of the page to rename. Cannot be used together with from.
    #
    # @param value [Integer]
    # @return [self]
    def fromid(value)
      merge(fromid: value.to_s)
    end
    # Title to rename the page to.
    #
    # @param value [String]
    # @return [self]
    def to(value)
      merge(to: value.to_s)
    end
    # Reason for the rename.
    #
    # @param value [String]
    # @return [self]
    def reason(value)
      merge(reason: value.to_s)
    end
    # Rename the talk page, if it exists.
    #
    # @return [self]
    def movetalk()
      merge(movetalk: 'true')
    end
    # Rename subpages, if applicable.
    #
    # @return [self]
    def movesubpages()
      merge(movesubpages: 'true')
    end
    # Don't create a redirect.
    #
    # @return [self]
    def noredirect()
      merge(noredirect: 'true')
    end
    # Add the page and the redirect to the current user's watchlist.
    #
    # @return [self]
    def watch()
      merge(watch: 'true')
    end
    # Remove the page and the redirect from the current user's watchlist.
    #
    # @return [self]
    def unwatch()
      merge(unwatch: 'true')
    end
    # Unconditionally add or remove the page from the current user's watchlist, use preferences or do not change watch.
    #
    # @param value [String] One of "watch", "unwatch", "preferences", "nochange".
    # @return [self]
    def watchlist(value)
      merge(watchlist: value.to_s)
    end
    # Ignore any warnings.
    #
    # @return [self]
    def ignorewarnings()
      merge(ignorewarnings: 'true')
    end
    # Change tags to apply to the entry in the move log and to the null revision on the destination page.
    #
    # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
    # @return [self]
    def tags(*values)
      merge(tags: values.join('|'))
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
