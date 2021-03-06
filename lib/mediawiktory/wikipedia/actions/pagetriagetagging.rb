# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Add tags to an article.
    #
    # Usage:
    #
    # ```ruby
    # api.pagetriagetagging.pageid(value).perform # returns string with raw output
    # # or
    # api.pagetriagetagging.pageid(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Pagetriagetagging < MediaWiktory::Wikipedia::Actions::Post

      # The article for which to be tagged.
      #
      # @param value [Integer]
      # @return [self]
      def pageid(value)
        merge(pageid: value.to_s)
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end

      # The tagging text to be added to the top of an article.
      #
      # @param value [String]
      # @return [self]
      def top(value)
        merge(top: value.to_s)
      end

      # The tagging text to be added to the bottom of an article.
      #
      # @param value [String]
      # @return [self]
      def bottom(value)
        merge(bottom: value.to_s)
      end

      # Whether or not the tagging is for a deletion nomination.
      #
      # @return [self]
      def deletion()
        merge(deletion: 'true')
      end

      # Personal note to page creators from reviewers.
      #
      # @param value [String]
      # @return [self]
      def note(value)
        merge(note: value.to_s)
      end

      # Pipe-separated list of tags.
      #
      # @param values [Array<String>]
      # @return [self]
      def taglist(*values)
        values.inject(self) { |res, val| res._taglist(val) }
      end

      # @private
      def _taglist(value)
        merge(taglist: value.to_s, replace: false)
      end
    end
  end
end
