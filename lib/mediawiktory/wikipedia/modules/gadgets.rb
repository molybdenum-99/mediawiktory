# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns a list of gadgets used on this wiki. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Gadgets

      # What gadget information to get:
      #
      # @param values [Array<String>] Allowed values: "id" (Internal gadget ID), "metadata" (The gadget metadata), "desc" (Gadget description transformed into HTML (can be slow, use only if really needed)).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res._prop(val) or fail ArgumentError, "Unknown value for prop: #{val}" }
      end

      # @private
      def _prop(value)
        defined?(super) && super || ["id", "metadata", "desc"].include?(value.to_s) && merge(gaprop: value.to_s)
      end

      # Gadgets from what categories to retrieve.
      #
      # @param values [Array<String>]
      # @return [self]
      def categories(*values)
        values.inject(self) { |res, val| res._categories(val) }
      end

      # @private
      def _categories(value)
        merge(gacategories: value.to_s)
      end

      # IDs of gadgets to retrieve.
      #
      # @param values [Array<String>]
      # @return [self]
      def ids(*values)
        values.inject(self) { |res, val| res._ids(val) }
      end

      # @private
      def _ids(value)
        merge(gaids: value.to_s)
      end

      # List only gadgets allowed to current user.
      #
      # @return [self]
      def allowedonly()
        merge(gaallowedonly: 'true')
      end

      # List only gadgets enabled by current user.
      #
      # @return [self]
      def enabledonly()
        merge(gaenabledonly: 'true')
      end
    end
  end
end
