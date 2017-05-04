# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all blocked users and IP addresses. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Blocks

      # The timestamp to start enumerating from.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(bkstart: value.iso8601)
      end

      # The timestamp to stop enumerating at.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(bkend: value.iso8601)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: bkstart has to be before bkend), "older" (List newest first (default). Note: bkstart has to be later than bkend).
      # @return [self]
      def dir(value)
        defined?(super) && super || ["newer", "older"].include?(value.to_s) && merge(bkdir: value.to_s)
      end

      # List of block IDs to list (optional).
      #
      # @param values [Array<Integer>]
      # @return [self]
      def ids(*values)
        values.inject(self) { |res, val| res.ids_single(val) }
      end

      # @private
      def ids_single(value)
        merge(bkids: value.to_s)
      end

      # List of users to search for (optional).
      #
      # @param values [Array<String>]
      # @return [self]
      def users(*values)
        values.inject(self) { |res, val| res.users_single(val) }
      end

      # @private
      def users_single(value)
        merge(bkusers: value.to_s)
      end

      # Get all blocks applying to this IP address or CIDR range, including range blocks. Cannot be used together with bkusers. CIDR ranges broader than IPv4/16 or IPv6/19 are not accepted.
      #
      # @param value [String]
      # @return [self]
      def ip(value)
        merge(bkip: value.to_s)
      end

      # The maximum number of blocks to list.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(bklimit: value.to_s)
      end

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "id" (Adds the ID of the block), "user" (Adds the username of the blocked user), "userid" (Adds the user ID of the blocked user), "by" (Adds the username of the blocking user), "byid" (Adds the user ID of the blocking user), "timestamp" (Adds the timestamp of when the block was given), "expiry" (Adds the timestamp of when the block expires), "reason" (Adds the reason given for the block), "range" (Adds the range of IP addresses affected by the block), "flags" (Tags the ban with (autoblock, anononly, etc.)).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["id", "user", "userid", "by", "byid", "timestamp", "expiry", "reason", "range", "flags"].include?(value.to_s) && merge(bkprop: value.to_s)
      end

      # Show only items that meet these criteria. For example, to see only indefinite blocks on IP addresses, set bkshow=ip|!temp.
      #
      # @param values [Array<String>] Allowed values: "account", "!account", "temp", "!temp", "ip", "!ip", "range", "!range".
      # @return [self]
      def show(*values)
        values.inject(self) { |res, val| res.show_single(val) }
      end

      # @private
      def show_single(value)
        defined?(super) && super || ["account", "!account", "temp", "!temp", "ip", "!ip", "range", "!range"].include?(value.to_s) && merge(bkshow: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(bkcontinue: value.to_s)
      end
    end
  end
end
