# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get a log of campaign configuration changes. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Centralnoticelogs

      # Campaign name (optional). Separate multiple values with a "|" (vertical bar).
      #
      # @param value [String]
      # @return [self]
      def campaign(value)
        merge(campaign: value.to_s)
      end

      # Username (optional).
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(user: value.to_s)
      end

      # Maximum rows to return (optional).
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(limit: value.to_s)
      end

      # Offset into result set (optional).
      #
      # @param value [Integer]
      # @return [self]
      def offset(value)
        merge(offset: value.to_s)
      end

      # Start time of range (optional).
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(start: value.iso8601)
      end

      # End time of range (optional).
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(end: value.iso8601)
      end
    end
  end
end
