# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Import a page from another wiki, or from an XML file. 
    #
    # Usage:
    #
    # ```ruby
    # api.import(**options).perform # returns string with raw output
    # # or
    # api.import(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.import.summary(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Import < MediaWiktory::Wikipedia::Actions::Post

      # Log entry import summary.
      #
      # @param value [String]
      # @return [self]
      def summary(value)
        merge(summary: value.to_s)
      end

      # Uploaded XML file.
      #
      # @param value [String]
      # @return [self]
      def xml(value)
        merge(xml: value.to_s)
      end

      # For interwiki imports: wiki to import from.
      #
      # @param value [String] One of "meta", "nost", "de", "es", "fr", "it", "pl", "outreachwiki", "test2wiki".
      # @return [self]
      def interwikisource(value)
        merge(interwikisource: value.to_s)
      end

      # For interwiki imports: page to import.
      #
      # @param value [String]
      # @return [self]
      def interwikipage(value)
        merge(interwikipage: value.to_s)
      end

      # For interwiki imports: import the full history, not just the current version.
      #
      # @return [self]
      def fullhistory()
        merge(fullhistory: 'true')
      end

      # For interwiki imports: import all included templates as well.
      #
      # @return [self]
      def templates()
        merge(templates: 'true')
      end

      # Import to this namespace. Cannot be used together with rootpage.
      #
      # @param value [String] One of "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(value)
        merge(namespace: value.to_s)
      end

      # Import as subpage of this page. Cannot be used together with namespace.
      #
      # @param value [String]
      # @return [self]
      def rootpage(value)
        merge(rootpage: value.to_s)
      end

      # Change tags to apply to the entry in the import log and to the null revision on the imported pages.
      #
      # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
      # @return [self]
      def tags(*values)
        merge(tags: values.join('|'))
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end
    end
  end
end
