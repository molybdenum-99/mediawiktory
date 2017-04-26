# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.contenttranslation(**options).perform # returns string with raw output
    # # or
    # api.some_action.contenttranslation(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.contenttranslation.translationid(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
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
        merge(gtype: value.to_s)
      end
  end
  end
end
