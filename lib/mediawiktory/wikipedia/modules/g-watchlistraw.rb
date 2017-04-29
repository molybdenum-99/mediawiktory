# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.watchlistraw(**options).perform # returns string with raw output
    # # or
    # api.some_action.watchlistraw(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.watchlistraw.continue(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GWatchlistraw

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gwrcontinue: value.to_s)
      end

      # Only list pages in the given namespaces.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        merge(gwrnamespace: values.join('|'))
      end

      # How many total results to return per request.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gwrlimit: value.to_s)
      end

      # Only list items that meet these criteria.
      #
      # @param values [Array<String>] Allowed values: "changed", "!changed".
      # @return [self]
      def show(*values)
        merge(gwrshow: values.join('|'))
      end

      # Used along with wrtoken to access a different user's watchlist.
      #
      # @param value [String]
      # @return [self]
      def owner(value)
        merge(gwrowner: value.to_s)
      end

      # A security token (available in the user's preferences) to allow access to another user's watchlist.
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(gwrtoken: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        merge(gwrdir: value.to_s)
      end

      # Title (with namespace prefix) to begin enumerating from.
      #
      # @param value [String]
      # @return [self]
      def fromtitle(value)
        merge(gwrfromtitle: value.to_s)
      end

      # Title (with namespace prefix) to stop enumerating at.
      #
      # @param value [String]
      # @return [self]
      def totitle(value)
        merge(gwrtotitle: value.to_s)
      end
    end
  end
end
