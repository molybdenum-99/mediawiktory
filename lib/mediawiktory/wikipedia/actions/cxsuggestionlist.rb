# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Manage the suggestion lists. Add suggestions to lists and remove them. 
    #
    # Usage:
    #
    # ```ruby
    # api.cxsuggestionlist(**options).perform # returns string with raw output
    # # or
    # api.cxsuggestionlist(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.cxsuggestionlist.listname(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Cxsuggestionlist < MediaWiktory::Wikipedia::PostAction

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
        merge(listaction: value.to_s)
      end

      # Page titles.
      #
      # @param values [Array<String>]
      # @return [self]
      def titles(*values)
        merge(titles: values.join('|'))
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
