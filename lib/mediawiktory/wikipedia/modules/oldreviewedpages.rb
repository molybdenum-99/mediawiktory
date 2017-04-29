# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Enumerates pages that have changes pending review. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.oldreviewedpages(**options).perform # returns string with raw output
    # # or
    # api.some_action.oldreviewedpages(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.oldreviewedpages.start(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Oldreviewedpages

      # Start listing at this timestamp.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(orstart: value.iso8601)
      end

      # Stop listing at this timestamp.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(orend: value.iso8601)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: orstart has to be before orend), "older" (List newest first (default). Note: orstart has to be later than orend).
      # @return [self]
      def dir(value)
        merge(ordir: value.to_s)
      end

      # Maximum character count change size.
      #
      # @param value [Integer]
      # @return [self]
      def maxsize(value)
        merge(ormaxsize: value.to_s)
      end

      # How to filter for pages on your watchlist.
      #
      # @param value [String] One of "watched", "all".
      # @return [self]
      def filterwatched(value)
        merge(orfilterwatched: value.to_s)
      end

      # The namespaces to enumerate.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        merge(ornamespace: values.join('|'))
      end

      # Show pages only in the given category.
      #
      # @param value [String]
      # @return [self]
      def category(value)
        merge(orcategory: value.to_s)
      end

      # How to filter for redirects.
      #
      # @param value [String] One of "redirects", "nonredirects", "all".
      # @return [self]
      def filterredir(value)
        merge(orfilterredir: value.to_s)
      end

      # How many total pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(orlimit: value.to_s)
      end
    end
  end
end
