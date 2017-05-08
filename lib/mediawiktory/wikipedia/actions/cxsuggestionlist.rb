# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Manage the suggestion lists. Add suggestions to lists and remove them. 
    #
    # Usage:
    #
    # ```ruby
    # api.cxsuggestionlist.listname(value).perform # returns string with raw output
    # # or
    # api.cxsuggestionlist.listname(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Cxsuggestionlist < MediaWiktory::Wikipedia::Actions::Post

      # Suggestion list name.
      #
      # @param value [String]
      # @return [self]
      def listname(value)
        merge(listname: value.to_s)
      end

      # Action to be performed on the list.
      #
      # @param value [String] One of "add", "remove".
      # @return [self]
      def listaction(value)
        _listaction(value) or fail ArgumentError, "Unknown value for listaction: #{value}"
      end

      # @private
      def _listaction(value)
        defined?(super) && super || ["add", "remove"].include?(value.to_s) && merge(listaction: value.to_s)
      end

      # Page titles.
      #
      # @param values [Array<String>]
      # @return [self]
      def titles(*values)
        values.inject(self) { |res, val| res._titles(val) }
      end

      # @private
      def _titles(value)
        merge(titles: value.to_s)
      end

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
