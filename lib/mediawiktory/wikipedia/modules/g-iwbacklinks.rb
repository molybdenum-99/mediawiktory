# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GIwbacklinks

      # Prefix for the interwiki.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(giwblprefix: value.to_s)
      end

      # Interwiki link to search for. Must be used with iwblblprefix.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(giwbltitle: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(giwblcontinue: value.to_s)
      end

      # How many total pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(giwbllimit: value.to_s)
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
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(giwbldir: value.to_s)
      end
    end
  end
end
