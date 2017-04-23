module MediaWiktory::Wikipedia::Actions
  # Perform management tasks relating to change tags. 
  #
  # Usage:
  #
  # ```ruby
  # api.managetags(**options).perform # returns string with raw output
  # # or
  # api.managetags(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.managetags.operation(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Managetags < MediaWiktory::GetAction
    # Which operation to perform:
    #
    # @param value [String] One of "create" (Create a new change tag for manual use), "delete" (Remove a change tag from the database, including removing the tag from all revisions, recent change entries and log entries on which it is used), "activate" (Activate a change tag, allowing users to apply it manually), "deactivate" (Deactivate a change tag, preventing users from applying it manually).
    # @return [self]
    def operation(value)
      merge(operation: value.to_s)
    end
    # Tag to create, delete, activate or deactivate. For tag creation, the tag must not exist. For tag deletion, the tag must exist. For tag activation, the tag must exist and not be in use by an extension. For tag deactivation, the tag must be currently active and manually defined.
    #
    # @param value [String]
    # @return [self]
    def tag(value)
      merge(tag: value.to_s)
    end
    # An optional reason for creating, deleting, activating or deactivating the tag.
    #
    # @param value [String]
    # @return [self]
    def reason(value)
      merge(reason: value.to_s)
    end
    # Whether to ignore any warnings that are issued during the operation.
    #
    # @return [self]
    def ignorewarnings()
      merge(ignorewarnings: 'true')
    end
    # Change tags to apply to the entry in the tag management log.
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
