# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Perform a full text search. 
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
  module Search
    # Search for page titles or content matching this value. You can use the search string to invoke special search features, depending on what the wiki's search backend implements.
    #
    # @param value [String]
    # @return [self]
    def search(value)
      merge(srsearch: value.to_s)
    end
    # Search only within these namespaces.
    #
    # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(srnamespace: values.join('|'))
    end
    # How many total pages to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(srlimit: value.to_s)
    end
    # When more results are available, use this to continue.
    #
    # @param value [Integer]
    # @return [self]
    def offset(value)
      merge(sroffset: value.to_s)
    end
    # Query independent profile to use (affects ranking algorithm).
    #
    # @param value [String] One of "classic" (Ranking based on the number of incoming links, some templates, article language and recency (templates/language/recency may not be activated on this wiki)), "classic_noboostlinks" (Ranking based on some templates, article language and recency when activated on this wiki), "empty" (Ranking based solely on query dependent features (for debug only)), "wsum_inclinks" ((no description)), "wsum_inclinks_pv" ((no description)), "popular_inclinks_pv" (Ranking based primarily on page views), "popular_inclinks" (Ranking based primarily on incoming link counts).
    # @return [self]
    def qiprofile(value)
      merge(srqiprofile: value.to_s)
    end
    # Which type of search to perform.
    #
    # @param value [String] One of "title", "text", "nearmatch".
    # @return [self]
    def what(value)
      merge(srwhat: value.to_s)
    end
    # Which metadata to return.
    #
    # @param values [Array<String>] Allowed values: "totalhits", "suggestion", "rewrittenquery".
    # @return [self]
    def info(*values)
      merge(srinfo: values.join('|'))
    end
    # Which properties to return:
    #
    # @param values [Array<String>] Allowed values: "size" (Adds the size of the page in bytes), "wordcount" (Adds the word count of the page), "timestamp" (Adds the timestamp of when the page was last edited), "snippet" (Adds a parsed snippet of the page), "titlesnippet" (Adds a parsed snippet of the page title), "redirecttitle" (Adds the title of the matching redirect), "redirectsnippet" (Adds a parsed snippet of the redirect title), "sectiontitle" (Adds the title of the matching section), "sectionsnippet" (Adds a parsed snippet of the matching section title), "isfilematch" (Adds a boolean indicating if the search matched file content), "categorysnippet" (Adds a parsed snippet of the matching category), "score" (Deprecated and ignored), "hasrelated" (Deprecated and ignored).
    # @return [self]
    def prop(*values)
      merge(srprop: values.join('|'))
    end
    # Include interwiki results in the search, if available.
    #
    # @return [self]
    def interwiki()
      merge(srinterwiki: 'true')
    end
    # Enable internal query rewriting. Some search backends can rewrite the query into one its thinks gives better results, such as correcting spelling errors.
    #
    # @return [self]
    def enablerewrites()
      merge(srenablerewrites: 'true')
    end
  end
end
