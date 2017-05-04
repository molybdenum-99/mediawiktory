# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Mark an article as reviewed or unreviewed. 
    #
    # Usage:
    #

    # ```ruby
    # api.pagetriageaction(**options).perform # returns string with raw output
    # # or
    # api.pagetriageaction(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.pagetriageaction.pageid(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Pagetriageaction < MediaWiktory::Wikipedia::Actions::Post

      # The article for which to be marked as reviewed or unreviewed.
      #
      # @param value [Integer]
      # @return [self]
      def pageid(value)
        merge(pageid: value.to_s)
      end

      # Whether the article is reviewed.
      #
      # @param value [String] One of "1", "0".
      # @return [self]
      def reviewed(value)
        defined?(super) && super || ["1", "0"].include?(value.to_s) && merge(reviewed: value.to_s)
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end

      # Personal note to page creators from reviewers.
      #
      # @param value [String]
      # @return [self]
      def note(value)
        merge(note: value.to_s)
      end

      # Whether to skip notification.
      #
      # @return [self]
      def skipnotif()
        merge(skipnotif: 'true')
      end
    end
  end
end
