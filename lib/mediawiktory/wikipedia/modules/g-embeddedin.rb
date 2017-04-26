# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.embeddedin(**options).perform # returns string with raw output
    # # or
    # api.some_action.embeddedin(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.embeddedin.title(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GEmbeddedin

      # Title to search. Cannot be used together with eipageid.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(geititle: value.to_s)
      end

      # Page ID to search. Cannot be used together with eititle.
      #
      # @param value [Integer]
      # @return [self]
      def pageid(value)
        merge(geipageid: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(geicontinue: value.to_s)
      end

      # The namespace to enumerate.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        merge(geinamespace: values.join('|'))
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        merge(geidir: value.to_s)
      end

      # How to filter for redirects.
      #
      # @param value [String] One of "all", "redirects", "nonredirects".
      # @return [self]
      def filterredir(value)
        merge(geifilterredir: value.to_s)
      end

      # How many total pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(geilimit: value.to_s)
      end
  end
  end
end
