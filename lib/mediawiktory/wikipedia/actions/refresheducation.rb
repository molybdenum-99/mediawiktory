# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Rebuild summary data of Education Program objects. 
    #
    # Usage:
    #
    # ```ruby
    # api.refresheducation(**options).perform
    # # or
    #
    # api.refresheducation.ids(value).perform # returns string with raw output
    # # or
    # api.refresheducation.ids(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Refresheducation < MediaWiktory::Wikipedia::Actions::Post

      # The IDs of the objects to refresh.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def ids(*values)
        values.inject(self) { |res, val| res._ids(val) }
      end

      # @private
      def _ids(value)
        merge(ids: value.to_s)
      end

      # Type of object to refresh.
      #
      # @param value [String] One of "org", "course", "student".
      # @return [self]
      def type(value)
        _type(value) or fail ArgumentError, "Unknown value for type: #{value}"
      end

      # @private
      def _type(value)
        defined?(super) && super || ["org", "course", "student"].include?(value.to_s) && merge(type: value.to_s)
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
