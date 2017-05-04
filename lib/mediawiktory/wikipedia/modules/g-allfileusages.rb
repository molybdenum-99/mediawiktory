# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GAllfileusages

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gafcontinue: value.to_s)
      end

      # The title of the file to start enumerating from.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(gaffrom: value.to_s)
      end

      # The title of the file to stop enumerating at.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(gafto: value.to_s)
      end

      # Search for all file titles that begin with this value.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(gafprefix: value.to_s)
      end

      # Only show distinct file titles. Cannot be used with afprop=ids. When used as a generator, yields target pages instead of source pages.
      #
      # @return [self]
      def unique()
        merge(gafunique: 'true')
      end

      # How many total items to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gaflimit: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(gafdir: value.to_s)
      end
    end
  end
end
