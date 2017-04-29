# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all globally blocked IP addresses. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.globalblocks(**options).perform # returns string with raw output
    # # or
    # api.some_action.globalblocks(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.globalblocks.start(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Globalblocks

      # The timestamp to start enumerating from.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(bgstart: value.iso8601)
      end

      # The timestamp to stop enumerating at.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(bgend: value.iso8601)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: bgstart has to be before bgend), "older" (List newest first (default). Note: bgstart has to be later than bgend).
      # @return [self]
      def dir(value)
        merge(bgdir: value.to_s)
      end

      # Pipe-separated list of block IDs to list.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def ids(*values)
        merge(bgids: values.join('|'))
      end

      # Pipe-separated list of IP addresses to search for.
      #
      # @param values [Array<String>]
      # @return [self]
      def addresses(*values)
        merge(bgaddresses: values.join('|'))
      end

      # Get all blocks applying to this IP address or CIDR range, including range blocks. Cannot be used together with bgaddresses. CIDR ranges broader than /16 are not accepted.
      #
      # @param value [String]
      # @return [self]
      def ip(value)
        merge(bgip: value.to_s)
      end

      # The maximum amount of blocks to list.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(bglimit: value.to_s)
      end

      # Which properties to get.
      #
      # @param values [Array<String>] Allowed values: "id", "address", "by", "timestamp", "expiry", "reason", "range".
      # @return [self]
      def prop(*values)
        merge(bgprop: values.join('|'))
      end
    end
  end
end
