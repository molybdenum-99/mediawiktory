# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Delete a draft translation created using the Content Translation extension. 
    #
    # Usage:
    #
    # ```ruby
    # api.cxdelete(**options).perform # returns string with raw output
    # # or
    # api.cxdelete(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.cxdelete.from(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Cxdelete < MediaWiktory::Wikipedia::Actions::Post

      # The source language code.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(from: value.to_s)
      end

      # The target language code.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(to: value.to_s)
      end

      # The title of the source page.
      #
      # @param value [String]
      # @return [self]
      def sourcetitle(value)
        merge(sourcetitle: value.to_s)
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
