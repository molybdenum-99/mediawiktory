# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.allcategories(**options).perform # returns string with raw output
    # # or
    # api.some_action.allcategories(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.allcategories.from(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GAllcategories

      # The category to start enumerating from.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(gacfrom: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gaccontinue: value.to_s)
      end

      # The category to stop enumerating at.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(gacto: value.to_s)
      end

      # Search for all category titles that begin with this value.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(gacprefix: value.to_s)
      end

      # Direction to sort in.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        merge(gacdir: value.to_s)
      end

      # Only return categories with at least this many members.
      #
      # @param value [Integer]
      # @return [self]
      def min(value)
        merge(gacmin: value.to_s)
      end

      # Only return categories with at most this many members.
      #
      # @param value [Integer]
      # @return [self]
      def max(value)
        merge(gacmax: value.to_s)
      end

      # How many categories to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gaclimit: value.to_s)
      end
    end
  end
end
