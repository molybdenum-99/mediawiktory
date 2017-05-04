# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Show events that were caught by one of the abuse filters. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Abuselog

      # The timestamp to start enumerating from.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(aflstart: value.iso8601)
      end

      # The timestamp to stop enumerating at.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(aflend: value.iso8601)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: aflstart has to be before aflend), "older" (List newest first (default). Note: aflstart has to be later than aflend).
      # @return [self]
      def dir(value)
        defined?(super) && super || ["newer", "older"].include?(value.to_s) && merge(afldir: value.to_s)
      end

      # Show only entries done by a given user or IP address.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(afluser: value.to_s)
      end

      # Show only entries occurring on a given page.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(afltitle: value.to_s)
      end

      # Show only entries that were caught by a given filter ID.
      #
      # @param values [Array<String>]
      # @return [self]
      def filter(*values)
        values.inject(self) { |res, val| res.filter_single(val) }
      end

      protected def filter_single(value)
        merge(aflfilter: value.to_s)
      end

      # The maximum amount of entries to list.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(afllimit: value.to_s)
      end

      # Which properties to get.
      #
      # @param values [Array<String>] Allowed values: "ids", "filter", "user", "ip", "title", "action", "details", "result", "timestamp", "hidden", "revid".
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      protected def prop_single(value)
        defined?(super) && super || ["ids", "filter", "user", "ip", "title", "action", "details", "result", "timestamp", "hidden", "revid"].include?(value.to_s) && merge(aflprop: value.to_s)
      end
    end
  end
end
