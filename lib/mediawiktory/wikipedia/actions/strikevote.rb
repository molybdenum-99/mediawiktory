# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Allows admins to strike or unstrike a vote. 
    #
    # Usage:
    #
    # ```ruby
    # api.strikevote(**options).perform # returns string with raw output
    # # or
    # api.strikevote(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.strikevote.option(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Strikevote < MediaWiktory::Wikipedia::Actions::Post

      # Which action to take: strike or unstrike a vote.
      #
      # @param value [String] One of "strike" (Strike a vote (remove it from the count)), "unstrike" (Unstrike a vote (restore it to the count)).
      # @return [self]
      def option(value)
        defined?(super) && super || ["strike", "unstrike"].include?(value.to_s) && merge(option: value.to_s)
      end

      # The reason for striking or unstriking the vote.
      #
      # @param value [String]
      # @return [self]
      def reason(value)
        merge(reason: value.to_s)
      end

      # The ID of the vote to be struck or unstruck.
      #
      # @param value [Integer]
      # @return [self]
      def voteid(value)
        merge(voteid: value.to_s)
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
