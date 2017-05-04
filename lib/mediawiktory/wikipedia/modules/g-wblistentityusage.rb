# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GWblistentityusage

      # Only return entity IDs that used this aspect.
      #
      # @param values [Array<String>] Allowed values: "S", "L", "T", "X", "O".
      # @return [self]
      def aspect(*values)
        values.inject(self) { |res, val| res.aspect_single(val) }
      end

      # @private
      def aspect_single(value)
        defined?(super) && super || ["S", "L", "T", "X", "O"].include?(value.to_s) && merge(gwbeuaspect: value.to_s)
      end

      # Entities that have been used.
      #
      # @param values [Array<String>]
      # @return [self]
      def entities(*values)
        values.inject(self) { |res, val| res.entities_single(val) }
      end

      # @private
      def entities_single(value)
        merge(gwbeuentities: value.to_s)
      end

      # How many entity usages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gwbeulimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gwbeucontinue: value.to_s)
      end
    end
  end
end
