# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
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
    module GCategorymembers

      # Which category to enumerate (required). Must include the Category: prefix. Cannot be used together with cmpageid.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(gcmtitle: value.to_s)
      end

      # Page ID of the category to enumerate. Cannot be used together with cmtitle.
      #
      # @param value [Integer]
      # @return [self]
      def pageid(value)
        merge(gcmpageid: value.to_s)
      end

      # Only include pages in these namespaces. Note that cmtype=subcat or cmtype=file may be used instead of cmnamespace=14 or 6.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        merge(gcmnamespace: values.join('|'))
      end

      # Which type of category members to include. Ignored when cmsort=timestamp is set.
      #
      # @param values [Array<String>] Allowed values: "page", "subcat", "file".
      # @return [self]
      def type(*values)
        merge(gcmtype: values.join('|'))
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gcmcontinue: value.to_s)
      end

      # The maximum number of pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gcmlimit: value.to_s)
      end

      # Property to sort by.
      #
      # @param value [String] One of "sortkey", "timestamp".
      # @return [self]
      def sort(value)
        merge(gcmsort: value.to_s)
      end

      # In which direction to sort.
      #
      # @param value [String] One of "asc", "desc", "ascending", "descending", "newer", "older".
      # @return [self]
      def dir(value)
        merge(gcmdir: value.to_s)
      end

      # Timestamp to start listing from. Can only be used with cmsort=timestamp.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(gcmstart: value.iso8601)
      end

      # Timestamp to end listing at. Can only be used with cmsort=timestamp.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(gcmend: value.iso8601)
      end

      # Sortkey to start listing from, as returned by cmprop=sortkey. Can only be used with cmsort=sortkey.
      #
      # @param value [String]
      # @return [self]
      def starthexsortkey(value)
        merge(gcmstarthexsortkey: value.to_s)
      end

      # Sortkey to end listing at, as returned by cmprop=sortkey. Can only be used with cmsort=sortkey.
      #
      # @param value [String]
      # @return [self]
      def endhexsortkey(value)
        merge(gcmendhexsortkey: value.to_s)
      end

      # Sortkey prefix to start listing from. Can only be used with cmsort=sortkey. Overrides cmstarthexsortkey.
      #
      # @param value [String]
      # @return [self]
      def startsortkeyprefix(value)
        merge(gcmstartsortkeyprefix: value.to_s)
      end

      # Sortkey prefix to end listing before (not at; if this value occurs it will not be included!). Can only be used with cmsort=sortkey. Overrides cmendhexsortkey.
      #
      # @param value [String]
      # @return [self]
      def endsortkeyprefix(value)
        merge(gcmendsortkeyprefix: value.to_s)
      end

      # Use cmstarthexsortkey instead.
      #
      # @param value [String]
      # @return [self]
      def startsortkey(value)
        merge(gcmstartsortkey: value.to_s)
      end

      # Use cmendhexsortkey instead.
      #
      # @param value [String]
      # @return [self]
      def endsortkey(value)
        merge(gcmendsortkey: value.to_s)
      end
    end
  end
end
