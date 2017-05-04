# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Mark notifications as seen for the current user. 
    #
    # Usage:
    #
    # ```ruby
    # api.echomarkseen(**options).perform # returns string with raw output
    # # or
    # api.echomarkseen(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.echomarkseen.token(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Echomarkseen < MediaWiktory::Wikipedia::Actions::Post

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end

      # Type of notifications to mark as seen: 'alert', 'message' or 'all'.
      #
      # @param value [String] One of "alert", "message", "all".
      # @return [self]
      def type(value)
        defined?(super) && super || ["alert", "message", "all"].include?(value.to_s) && merge(type: value.to_s)
      end

      # Timestamp format to use for output, 'ISO_8601' or 'MW'.  'MW' is deprecated here, so all clients should switch to 'ISO_8601'.  This parameter will be removed, and 'ISO_8601' will become the only output format.
      #
      # @param value [String] One of "ISO_8601", "MW".
      # @return [self]
      def timestampFormat(value)
        defined?(super) && super || ["ISO_8601", "MW"].include?(value.to_s) && merge(timestampFormat: value.to_s)
      end
    end
  end
end
