module MediaWiktory::Wikipedia::Actions
  # Restore revisions of a deleted page. 
  #
  # Usage:
  #
  # ```ruby
  # api.undelete(**options).perform # returns string with raw output
  # # or
  # api.undelete(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.undelete.title(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Undelete < MediaWiktory::GetAction
    # Title of the page to restore.
    #
    # @param value [String]
    # @return [self]
    def title(value)
      merge(title: value.to_s)
    end
    # Reason for restoring.
    #
    # @param value [String]
    # @return [self]
    def reason(value)
      merge(reason: value.to_s)
    end
    # Change tags to apply to the entry in the deletion log.
    #
    # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
    # @return [self]
    def tags(*values)
      merge(tags: values.join('|'))
    end
    # Timestamps of the revisions to restore. If both timestamps and fileids are empty, all will be restored.
    #
    # @param values [Array<Time>]
    # @return [self]
    def timestamps(*values)
      merge(timestamps: values.map(&:iso8601).join('|'))
    end
    # IDs of the file revisions to restore. If both timestamps and fileids are empty, all will be restored.
    #
    # @param values [Array<Integer>]
    # @return [self]
    def fileids(*values)
      merge(fileids: values.join('|'))
    end
    # Unconditionally add or remove the page from the current user's watchlist, use preferences or do not change watch.
    #
    # @param value [String] One of "watch", "unwatch", "preferences", "nochange".
    # @return [self]
    def watchlist(value)
      merge(watchlist: value.to_s)
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