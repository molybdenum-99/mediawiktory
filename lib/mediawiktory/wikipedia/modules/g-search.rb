# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.search(**options).perform # returns string with raw output
    # # or
    # api.some_action.search(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.search.search(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GSearch

      # Search for page titles or content matching this value. You can use the search string to invoke special search features, depending on what the wiki's search backend implements.
      #
      # @param value [String]
      # @return [self]
      def search(value)
        merge(gsrsearch: value.to_s)
      end

      # Search only within these namespaces.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        merge(gsrnamespace: values.join('|'))
      end

      # How many total pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gsrlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def offset(value)
        merge(gsroffset: value.to_s)
      end

      # Query independent profile to use (affects ranking algorithm).
      #
      # @param value [String] One of "classic" (Ranking based on the number of incoming links, some templates, article language and recency (templates/language/recency may not be activated on this wiki)), "classic_noboostlinks" (Ranking based on some templates, article language and recency when activated on this wiki), "empty" (Ranking based solely on query dependent features (for debug only)), "wsum_inclinks" ((no description)), "wsum_inclinks_pv" ((no description)), "popular_inclinks_pv" (Ranking based primarily on page views), "popular_inclinks" (Ranking based primarily on incoming link counts).
      # @return [self]
      def qiprofile(value)
        merge(gsrqiprofile: value.to_s)
      end

      # Which type of search to perform.
      #
      # @param value [String] One of "title", "text", "nearmatch".
      # @return [self]
      def what(value)
        merge(gsrwhat: value.to_s)
      end

      # Which metadata to return.
      #
      # @param values [Array<String>] Allowed values: "totalhits", "suggestion", "rewrittenquery".
      # @return [self]
      def info(*values)
        merge(gsrinfo: values.join('|'))
      end

      # Include interwiki results in the search, if available.
      #
      # @return [self]
      def interwiki()
        merge(gsrinterwiki: 'true')
      end

      # Enable internal query rewriting. Some search backends can rewrite the query into one its thinks gives better results, such as correcting spelling errors.
      #
      # @return [self]
      def enablerewrites()
        merge(gsrenablerewrites: 'true')
      end
  end
  end
end
