# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # The module is included in action after setting some param, providing additional tweaking for
    # this param. Example:
    #
    # ```ruby
    # api.query             # returns Actions::Query
    #    .prop(:revisions)  # adds prop=revisions to action URL, and includes Modules::Revisions into action
    #    .limit(10)         # method of Modules::Revisions, adds rvlimit=10 to URL
    # ```
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GOldreviewedpages

      # Start listing at this timestamp.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(gorstart: value.iso8601)
      end

      # Stop listing at this timestamp.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(gorend: value.iso8601)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: orstart has to be before orend), "older" (List newest first (default). Note: orstart has to be later than orend).
      # @return [self]
      def dir(value)
        _dir(value) or fail ArgumentError, "Unknown value for dir: #{value}"
      end

      # @private
      def _dir(value)
        defined?(super) && super || ["newer", "older"].include?(value.to_s) && merge(gordir: value.to_s)
      end

      # Maximum character count change size.
      #
      # @param value [Integer]
      # @return [self]
      def maxsize(value)
        merge(gormaxsize: value.to_s)
      end

      # How to filter for pages on your watchlist.
      #
      # @param value [String] One of "watched", "all".
      # @return [self]
      def filterwatched(value)
        _filterwatched(value) or fail ArgumentError, "Unknown value for filterwatched: #{value}"
      end

      # @private
      def _filterwatched(value)
        defined?(super) && super || ["watched", "all"].include?(value.to_s) && merge(gorfilterwatched: value.to_s)
      end

      # The namespaces to enumerate.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res._namespace(val) or fail ArgumentError, "Unknown value for namespace: #{val}" }
      end

      # @private
      def _namespace(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(gornamespace: value.to_s)
      end

      # Show pages only in the given category.
      #
      # @param value [String]
      # @return [self]
      def category(value)
        merge(gorcategory: value.to_s)
      end

      # How to filter for redirects.
      #
      # @param value [String] One of "redirects", "nonredirects", "all".
      # @return [self]
      def filterredir(value)
        _filterredir(value) or fail ArgumentError, "Unknown value for filterredir: #{value}"
      end

      # @private
      def _filterredir(value)
        defined?(super) && super || ["redirects", "nonredirects", "all"].include?(value.to_s) && merge(gorfilterredir: value.to_s)
      end

      # How many total pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gorlimit: value.to_s)
      end
    end
  end
end
