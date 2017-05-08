# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Configure review-protection settings for a page. 
    #
    # Usage:
    #
    # ```ruby
    # api.stabilize(**options).perform
    # # or
    #
    # api.stabilize.protectlevel(value).perform # returns string with raw output
    # # or
    # api.stabilize.protectlevel(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Stabilize < MediaWiktory::Wikipedia::Actions::Post

      # The review-protection level.
      #
      # @param value [String] One of "autoconfirmed", "none".
      # @return [self]
      def protectlevel(value)
        _protectlevel(value) or fail ArgumentError, "Unknown value for protectlevel: #{value}"
      end

      # @private
      def _protectlevel(value)
        defined?(super) && super || ["autoconfirmed", "none"].include?(value.to_s) && merge(protectlevel: value.to_s)
      end

      # Review-protection expiry.
      #
      # @param value [String]
      # @return [self]
      def expiry(value)
        merge(expiry: value.to_s)
      end

      # Reason.
      #
      # @param value [String]
      # @return [self]
      def reason(value)
        merge(reason: value.to_s)
      end

      # Watch this page.
      #
      # @param value [String]
      # @return [self]
      def watch(value)
        merge(watch: value.to_s)
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end

      # Title of the page to be review-protected.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(title: value.to_s)
      end
    end
  end
end
