module MediaWiktory::Wikipedia::Actions
  # Patrol a page or revision. 
  #
  # Usage:
  #
  # ```ruby
  # api.patrol(**options).perform # returns string with raw output
  # # or
  # api.patrol(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.patrol.rcid(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Patrol < MediaWiktory::GetAction
    # Recentchanges ID to patrol.
    #
    # @param value [Integer]
    # @return [self]
    def rcid(value)
      merge(rcid: value.to_s)
    end
    # Revision ID to patrol.
    #
    # @param value [Integer]
    # @return [self]
    def revid(value)
      merge(revid: value.to_s)
    end
    # Change tags to apply to the entry in the patrol log.
    #
    # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
    # @return [self]
    def tags(*values)
      merge(tags: values.join('|'))
    end
    # A "patrol" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(token: value.to_s)
    end
  end
end
