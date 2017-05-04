# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Show details of the abuse filters. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Abusefilters

      # The filter ID to start enumerating from.
      #
      # @param value [Integer]
      # @return [self]
      def startid(value)
        merge(abfstartid: value.to_s)
      end

      # The filter ID to stop enumerating at.
      #
      # @param value [Integer]
      # @return [self]
      def endid(value)
        merge(abfendid: value.to_s)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: abfstart has to be before abfend), "older" (List newest first (default). Note: abfstart has to be later than abfend).
      # @return [self]
      def dir(value)
        defined?(super) && super || ["newer", "older"].include?(value.to_s) && merge(abfdir: value.to_s)
      end

      # Show only filters which meet these criteria.
      #
      # @param values [Array<String>] Allowed values: "enabled", "!enabled", "deleted", "!deleted", "private", "!private".
      # @return [self]
      def show(*values)
        values.inject(self) { |res, val| res.show_single(val) }
      end

      # @private
      def show_single(value)
        defined?(super) && super || ["enabled", "!enabled", "deleted", "!deleted", "private", "!private"].include?(value.to_s) && merge(abfshow: value.to_s)
      end

      # The maximum number of filters to list.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(abflimit: value.to_s)
      end

      # Which properties to get.
      #
      # @param values [Array<String>] Allowed values: "id", "description", "pattern", "actions", "hits", "comments", "lasteditor", "lastedittime", "status", "private".
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["id", "description", "pattern", "actions", "hits", "comments", "lasteditor", "lastedittime", "status", "private"].include?(value.to_s) && merge(abfprop: value.to_s)
      end
    end
  end
end
