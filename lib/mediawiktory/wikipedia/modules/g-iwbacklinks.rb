# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.iwbacklinks(**options).perform # returns string with raw output
    # # or
    # api.some_action.iwbacklinks(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.iwbacklinks.prefix(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
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
        merge(giwbldir: value.to_s)
      end
  end
  end
end
