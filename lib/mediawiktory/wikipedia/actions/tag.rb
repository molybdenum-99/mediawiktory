# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Add or remove change tags from individual revisions or log entries. 
  #
  # Usage:
  #
  # ```ruby
  # api.tag(**options).perform # returns string with raw output
  # # or
  # api.tag(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.tag.rcid(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Tag < MediaWiktory::Wikipedia::GetAction

    # One or more recent changes IDs from which to add or remove the tag.
    #
    # @param values [Array<Integer>]
    # @return [self]
    def rcid(*values)
      merge(rcid: values.join('|'))
    end

    # One or more revision IDs from which to add or remove the tag.
    #
    # @param values [Array<Integer>]
    # @return [self]
    def revid(*values)
      merge(revid: values.join('|'))
    end

    # One or more log entry IDs from which to add or remove the tag.
    #
    # @param values [Array<Integer>]
    # @return [self]
    def logid(*values)
      merge(logid: values.join('|'))
    end

    # Tags to add. Only manually defined tags can be added.
    #
    # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
    # @return [self]
    def add(*values)
      merge(add: values.join('|'))
    end

    # Tags to remove. Only tags that are either manually defined or completely undefined can be removed.
    #
    # @param values [Array<String>]
    # @return [self]
    def remove(*values)
      merge(remove: values.join('|'))
    end

    # Reason for the change.
    #
    # @param value [String]
    # @return [self]
    def reason(value)
      merge(reason: value.to_s)
    end

    # Tags to apply to the log entry that will be created as a result of this action.
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
