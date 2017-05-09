# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Query Content Translation database for translations. _Generator module: for fetching pages corresponding to request._
    #
    # The "submodule" (MediaWiki API term) is included in action after setting some param, providing
    # additional tweaking for this param. Example (for {MediaWiktory::Wikipedia::Actions::Query} and
    # its submodules):
    #
    # ```ruby
    # api.query             # returns Actions::Query
    #    .prop(:revisions)  # adds prop=revisions to action URL, and includes Modules::Revisions into action
    #    .limit(10)         # method of Modules::Revisions, adds rvlimit=10 to URL
    # ```
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GContenttranslation

      # Translation ID.
      #
      # @param value [String]
      # @return [self]
      def translationid(value)
        merge(gtranslationid: value.to_s)
      end

      # The source language code.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(gfrom: value.to_s)
      end

      # The target language code.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(gto: value.to_s)
      end

      # The title of the source page.
      #
      # @param value [String]
      # @return [self]
      def sourcetitle(value)
        merge(gsourcetitle: value.to_s)
      end

      # The maximum number of translations to fetch.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(glimit: value.to_s)
      end

      # Offset into result set (optional).
      #
      # @param value [String]
      # @return [self]
      def offset(value)
        merge(goffset: value.to_s)
      end

      # State of the translation.
      #
      # @param value [String] One of "draft", "published".
      # @return [self]
      def type(value)
        _type(value) or fail ArgumentError, "Unknown value for type: #{value}"
      end

      # @private
      def _type(value)
        defined?(super) && super || ["draft", "published"].include?(value.to_s) && merge(gtype: value.to_s)
      end
    end
  end
end
