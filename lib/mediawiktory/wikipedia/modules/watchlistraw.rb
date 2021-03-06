# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get all pages on the current user's watchlist.
    #
    # The "submodule" (MediaWiki API term) is included in action after setting some param, providing
    # additional tweaking for this param. Example (for {MediaWiktory::Wikipedia::Actions::Query} and
    # its submodules):
    #
    # ```ruby
    # api.query             # returns Actions::Query
    #    .prop(:revisions)  # adds prop=revisions to action URL, and includes Modules::Revisions into action
    #    .limit(10)         # method of Modules::Revisions, adds rvlimit=10 to URL
    # ```
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Watchlistraw

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(wrcontinue: value.to_s)
      end

      # Only list pages in the given namespaces.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res._namespace(val) or fail ArgumentError, "Unknown value for namespace: #{val}" }
      end

      # @private
      def _namespace(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(wrnamespace: value.to_s, replace: false)
      end

      # How many total results to return per request.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(wrlimit: value.to_s)
      end

      # Which additional properties to get:
      #
      # @param values [Array<String>] Allowed values: "changed" (Adds timestamp of when the user was last notified about the edit).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res._prop(val) or fail ArgumentError, "Unknown value for prop: #{val}" }
      end

      # @private
      def _prop(value)
        defined?(super) && super || ["changed"].include?(value.to_s) && merge(wrprop: value.to_s, replace: false)
      end

      # Only list items that meet these criteria.
      #
      # @param values [Array<String>] Allowed values: "changed", "!changed".
      # @return [self]
      def show(*values)
        values.inject(self) { |res, val| res._show(val) or fail ArgumentError, "Unknown value for show: #{val}" }
      end

      # @private
      def _show(value)
        defined?(super) && super || ["changed", "!changed"].include?(value.to_s) && merge(wrshow: value.to_s, replace: false)
      end

      # Used along with wrtoken to access a different user's watchlist.
      #
      # @param value [String]
      # @return [self]
      def owner(value)
        merge(wrowner: value.to_s)
      end

      # A security token (available in the user's preferences) to allow access to another user's watchlist.
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(wrtoken: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        _dir(value) or fail ArgumentError, "Unknown value for dir: #{value}"
      end

      # @private
      def _dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(wrdir: value.to_s)
      end

      # Title (with namespace prefix) to begin enumerating from.
      #
      # @param value [String]
      # @return [self]
      def fromtitle(value)
        merge(wrfromtitle: value.to_s)
      end

      # Title (with namespace prefix) to stop enumerating at.
      #
      # @param value [String]
      # @return [self]
      def totitle(value)
        merge(wrtotitle: value.to_s)
      end
    end
  end
end
