# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all pages in a given category. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.categorymembers(**options).perform # returns string with raw output
    # # or
    # api.some_action.categorymembers(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.categorymembers.title(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Categorymembers

      # Which category to enumerate (required). Must include the Category: prefix. Cannot be used together with cmpageid.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(cmtitle: value.to_s)
      end

      # Page ID of the category to enumerate. Cannot be used together with cmtitle.
      #
      # @param value [Integer]
      # @return [self]
      def pageid(value)
        merge(cmpageid: value.to_s)
      end

      # Which pieces of information to include:
      #
      # @param values [Array<String>] Allowed values: "ids" (Adds the page ID), "title" (Adds the title and namespace ID of the page), "sortkey" (Adds the sortkey used for sorting in the category (hexadecimal string)), "sortkeyprefix" (Adds the sortkey prefix used for sorting in the category (human-readable part of the sortkey)), "type" (Adds the type that the page has been categorised as (page, subcat or file)), "timestamp" (Adds the timestamp of when the page was included).
      # @return [self]
      def prop(*values)
        merge(cmprop: values.join('|'))
      end

      # Only include pages in these namespaces. Note that cmtype=subcat or cmtype=file may be used instead of cmnamespace=14 or 6.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        merge(cmnamespace: values.join('|'))
      end

      # Which type of category members to include. Ignored when cmsort=timestamp is set.
      #
      # @param values [Array<String>] Allowed values: "page", "subcat", "file".
      # @return [self]
      def type(*values)
        merge(cmtype: values.join('|'))
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(cmcontinue: value.to_s)
      end

      # The maximum number of pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(cmlimit: value.to_s)
      end

      # Property to sort by.
      #
      # @param value [String] One of "sortkey", "timestamp".
      # @return [self]
      def sort(value)
        merge(cmsort: value.to_s)
      end

      # In which direction to sort.
      #
      # @param value [String] One of "asc", "desc", "ascending", "descending", "newer", "older".
      # @return [self]
      def dir(value)
        merge(cmdir: value.to_s)
      end

      # Timestamp to start listing from. Can only be used with cmsort=timestamp.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(cmstart: value.iso8601)
      end

      # Timestamp to end listing at. Can only be used with cmsort=timestamp.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(cmend: value.iso8601)
      end

      # Sortkey to start listing from, as returned by cmprop=sortkey. Can only be used with cmsort=sortkey.
      #
      # @param value [String]
      # @return [self]
      def starthexsortkey(value)
        merge(cmstarthexsortkey: value.to_s)
      end

      # Sortkey to end listing at, as returned by cmprop=sortkey. Can only be used with cmsort=sortkey.
      #
      # @param value [String]
      # @return [self]
      def endhexsortkey(value)
        merge(cmendhexsortkey: value.to_s)
      end

      # Sortkey prefix to start listing from. Can only be used with cmsort=sortkey. Overrides cmstarthexsortkey.
      #
      # @param value [String]
      # @return [self]
      def startsortkeyprefix(value)
        merge(cmstartsortkeyprefix: value.to_s)
      end

      # Sortkey prefix to end listing before (not at; if this value occurs it will not be included!). Can only be used with cmsort=sortkey. Overrides cmendhexsortkey.
      #
      # @param value [String]
      # @return [self]
      def endsortkeyprefix(value)
        merge(cmendsortkeyprefix: value.to_s)
      end

      # Use cmstarthexsortkey instead.
      #
      # @param value [String]
      # @return [self]
      def startsortkey(value)
        merge(cmstartsortkey: value.to_s)
      end

      # Use cmendhexsortkey instead.
      #
      # @param value [String]
      # @return [self]
      def endsortkey(value)
        merge(cmendsortkey: value.to_s)
      end
  end
  end
end
