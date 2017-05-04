# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
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
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Tag < MediaWiktory::Wikipedia::Actions::Post

      # One or more recent changes IDs from which to add or remove the tag.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def rcid(*values)
        values.inject(self) { |res, val| res.rcid_single(val) }
      end

      # @private
      def rcid_single(value)
        merge(rcid: value.to_s)
      end

      # One or more revision IDs from which to add or remove the tag.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def revid(*values)
        values.inject(self) { |res, val| res.revid_single(val) }
      end

      # @private
      def revid_single(value)
        merge(revid: value.to_s)
      end

      # One or more log entry IDs from which to add or remove the tag.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def logid(*values)
        values.inject(self) { |res, val| res.logid_single(val) }
      end

      # @private
      def logid_single(value)
        merge(logid: value.to_s)
      end

      # Tags to add. Only manually defined tags can be added.
      #
      # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
      # @return [self]
      def add(*values)
        values.inject(self) { |res, val| res.add_single(val) }
      end

      # @private
      def add_single(value)
        defined?(super) && super || ["ProveIt edit", "WPCleaner", "huggle", "large plot addition"].include?(value.to_s) && merge(add: value.to_s)
      end

      # Tags to remove. Only tags that are either manually defined or completely undefined can be removed.
      #
      # @param values [Array<String>]
      # @return [self]
      def remove(*values)
        values.inject(self) { |res, val| res.remove_single(val) }
      end

      # @private
      def remove_single(value)
        merge(remove: value.to_s)
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
        values.inject(self) { |res, val| res.tags_single(val) }
      end

      # @private
      def tags_single(value)
        defined?(super) && super || ["ProveIt edit", "WPCleaner", "huggle", "large plot addition"].include?(value.to_s) && merge(tags: value.to_s)
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
end
