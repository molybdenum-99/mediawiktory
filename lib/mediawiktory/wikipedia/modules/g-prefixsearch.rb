# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.prefixsearch(**options).perform # returns string with raw output
    # # or
    # api.some_action.prefixsearch(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.prefixsearch.search(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GPrefixsearch

      # Search string.
      #
      # @param value [String]
      # @return [self]
      def search(value)
        merge(gpssearch: value.to_s)
      end

      # Namespaces to search.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        merge(gpsnamespace: values.join('|'))
      end

      # Maximum number of results to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gpslimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def offset(value)
        merge(gpsoffset: value.to_s)
      end

      # Search profile to use.
      #
      # @param value [String] One of "strict" (Strict profile with few punctuation characters removed but diacritics and stress marks are kept), "normal" (Few punctuation characters, some diacritics and stopwords removed), "fuzzy" (Similar to normal with typo correction (two typos supported)), "fast-fuzzy" (Experimental fuzzy profile (may be removed at any time)), "classic" (Classic prefix, few punctuation characters and some diacritics removed).
      # @return [self]
      def profile(value)
        merge(gpsprofile: value.to_s)
      end
    end
  end
end
