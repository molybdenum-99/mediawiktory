# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get entries from the CheckUser log. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Checkuserlog

      # Username of the CheckUser.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(culuser: value.to_s)
      end

      # Checked user, IP address, or CIDR range.
      #
      # @param value [String]
      # @return [self]
      def target(value)
        merge(cultarget: value.to_s)
      end

      # Limit of rows.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(cullimit: value.to_s)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: culstart has to be before culend), "older" (List newest first (default). Note: culstart has to be later than culend).
      # @return [self]
      def dir(value)
        defined?(super) && super || ["newer", "older"].include?(value.to_s) && merge(culdir: value.to_s)
      end

      # The timestamp to start enumerating from.
      #
      # @param value [Time]
      # @return [self]
      def from(value)
        merge(culfrom: value.iso8601)
      end

      # The timestamp to end enumerating.
      #
      # @param value [Time]
      # @return [self]
      def to(value)
        merge(culto: value.iso8601)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(culcontinue: value.to_s)
      end
    end
  end
end
