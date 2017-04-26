# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Enumerate all categories. 
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
    module Allcategories

      # The category to start enumerating from.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(acfrom: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(accontinue: value.to_s)
      end

      # The category to stop enumerating at.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(acto: value.to_s)
      end

      # Search for all category titles that begin with this value.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(acprefix: value.to_s)
      end

      # Direction to sort in.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        merge(acdir: value.to_s)
      end

      # Only return categories with at least this many members.
      #
      # @param value [Integer]
      # @return [self]
      def min(value)
        merge(acmin: value.to_s)
      end

      # Only return categories with at most this many members.
      #
      # @param value [Integer]
      # @return [self]
      def max(value)
        merge(acmax: value.to_s)
      end

      # How many categories to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(aclimit: value.to_s)
      end

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "size" (Adds number of pages in the category), "hidden" (Tags categories that are hidden with __HIDDENCAT__).
      # @return [self]
      def prop(*values)
        merge(acprop: values.join('|'))
      end
  end
  end
end
