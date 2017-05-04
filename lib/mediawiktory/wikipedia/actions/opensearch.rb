# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Search the wiki using the OpenSearch protocol. 
    #
    # Usage:
    #

    # ```ruby
    # api.opensearch(**options).perform # returns string with raw output
    # # or
    # api.opensearch(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.opensearch.search(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Opensearch < MediaWiktory::Wikipedia::Actions::Get

      # Search string.
      #
      # @param value [String]
      # @return [self]
      def search(value)
        merge(search: value.to_s)
      end

      # Namespaces to search.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res.namespace_single(val) }
      end

      protected def namespace_single(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(namespace: value.to_s)
      end

      # Maximum number of results to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(limit: value.to_s)
      end

      # Search profile to use.
      #
      # @param value [String] One of "strict" (Strict profile with few punctuation characters removed but diacritics and stress marks are kept), "normal" (Few punctuation characters, some diacritics and stopwords removed), "fuzzy" (Similar to normal with typo correction (two typos supported)), "fast-fuzzy" (Experimental fuzzy profile (may be removed at any time)), "classic" (Classic prefix, few punctuation characters and some diacritics removed).
      # @return [self]
      def profile(value)
        defined?(super) && super || ["strict", "normal", "fuzzy", "fast-fuzzy", "classic"].include?(value.to_s) && merge(profile: value.to_s)
      end

      # Do nothing if $wgEnableOpenSearchSuggest is false.
      #
      # @return [self]
      def suggest()
        merge(suggest: 'true')
      end

      # How to handle redirects:
      #
      # @param value [String] One of "return" (Return the redirect itself), "resolve" (Return the target page. May return fewer than limit results).
      # @return [self]
      def redirects(value)
        defined?(super) && super || ["return", "resolve"].include?(value.to_s) && merge(redirects: value.to_s)
      end

      # The format of the output.
      #
      # @param value [String] One of "json", "jsonfm", "xml", "xmlfm".
      # @return [self]
      def format(value)
        defined?(super) && super || ["json", "jsonfm", "xml", "xmlfm"].include?(value.to_s) && merge(format: value.to_s)
      end

      # If warnings are raised with format=json, return an API error instead of ignoring them.
      #
      # @return [self]
      def warningsaserror()
        merge(warningsaserror: 'true')
      end
    end
  end
end
