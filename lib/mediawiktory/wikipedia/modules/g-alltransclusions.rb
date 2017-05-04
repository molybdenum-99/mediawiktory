# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GAlltransclusions

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gatcontinue: value.to_s)
      end

      # The title of the transclusion to start enumerating from.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(gatfrom: value.to_s)
      end

      # The title of the transclusion to stop enumerating at.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(gatto: value.to_s)
      end

      # Search for all transcluded titles that begin with this value.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(gatprefix: value.to_s)
      end

      # Only show distinct transcluded titles. Cannot be used with atprop=ids. When used as a generator, yields target pages instead of source pages.
      #
      # @return [self]
      def unique()
        merge(gatunique: 'true')
      end

      # The namespace to enumerate.
      #
      # @param value [String] One of "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(value)
        defined?(super) && super || ["-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(gatnamespace: value.to_s)
      end

      # How many total items to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gatlimit: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(gatdir: value.to_s)
      end
    end
  end
end
