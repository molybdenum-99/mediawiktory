# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Mark notifications as read for the current user. 
    #
    # Usage:
    #
    # ```ruby
    # api.echomarkread(**options).perform # returns string with raw output
    # # or
    # api.echomarkread(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.echomarkread.list(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Echomarkread < MediaWiktory::Wikipedia::Actions::Post

      # A list of notification IDs to mark as read.
      #
      # @param values [Array<String>]
      # @return [self]
      def list(*values)
        values.inject(self) { |res, val| res.list_single(val) }
      end

      # @private
      def list_single(value)
        merge(list: value.to_s)
      end

      # A list of notification IDs to mark as unread.
      #
      # @param values [Array<String>]
      # @return [self]
      def unreadlist(*values)
        values.inject(self) { |res, val| res.unreadlist_single(val) }
      end

      # @private
      def unreadlist_single(value)
        merge(unreadlist: value.to_s)
      end

      # If set, marks all of a user's notifications as read.
      #
      # @return [self]
      def all()
        merge(all: 'true')
      end

      # A list of sections to mark as read.
      #
      # @param values [Array<String>] Allowed values: "alert", "message".
      # @return [self]
      def sections(*values)
        values.inject(self) { |res, val| res.sections_single(val) }
      end

      # @private
      def sections_single(value)
        defined?(super) && super || ["alert", "message"].include?(value.to_s) && merge(sections: value.to_s)
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
