# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all redirects to a namespace. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Allredirects

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(arcontinue: value.to_s)
      end

      # The title of the redirect to start enumerating from.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(arfrom: value.to_s)
      end

      # The title of the redirect to stop enumerating at.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(arto: value.to_s)
      end

      # Search for all target pages that begin with this value.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(arprefix: value.to_s)
      end

      # Only show distinct target pages. Cannot be used with arprop=ids|fragment|interwiki. When used as a generator, yields target pages instead of source pages.
      #
      # @return [self]
      def unique()
        merge(arunique: 'true')
      end

      # Which pieces of information to include:
      #
      # @param values [Array<String>] Allowed values: "ids" (Adds the page ID of the redirecting page (cannot be used with arunique)), "title" (Adds the title of the redirect), "fragment" (Adds the fragment from the redirect, if any (cannot be used with arunique)), "interwiki" (Adds the interwiki prefix from the redirect, if any (cannot be used with arunique)).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res._prop(val) or fail ArgumentError, "Unknown value for prop: #{val}" }
      end

      # @private
      def _prop(value)
        defined?(super) && super || ["ids", "title", "fragment", "interwiki"].include?(value.to_s) && merge(arprop: value.to_s)
      end

      # The namespace to enumerate.
      #
      # @param value [String] One of "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(value)
        _namespace(value) or fail ArgumentError, "Unknown value for namespace: #{value}"
      end

      # @private
      def _namespace(value)
        defined?(super) && super || ["-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(arnamespace: value.to_s)
      end

      # How many total items to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(arlimit: value.to_s)
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
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(ardir: value.to_s)
      end
    end
  end
end
