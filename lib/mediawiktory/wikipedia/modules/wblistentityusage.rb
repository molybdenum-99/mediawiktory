# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns all pages that use the given entity IDs. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Wblistentityusage

      # Properties to add to the result.
      #
      # @param values [Array<String>] Allowed values: "url" (If enabled the url of the entity will be added to the result).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      protected def prop_single(value)
        defined?(super) && super || ["url"].include?(value.to_s) && merge(wbeuprop: value.to_s)
      end

      # Only return entity IDs that used this aspect.
      #
      # @param values [Array<String>] Allowed values: "S", "L", "T", "X", "O".
      # @return [self]
      def aspect(*values)
        values.inject(self) { |res, val| res.aspect_single(val) }
      end

      protected def aspect_single(value)
        defined?(super) && super || ["S", "L", "T", "X", "O"].include?(value.to_s) && merge(wbeuaspect: value.to_s)
      end

      # Entities that have been used.
      #
      # @param values [Array<String>]
      # @return [self]
      def entities(*values)
        values.inject(self) { |res, val| res.entities_single(val) }
      end

      protected def entities_single(value)
        merge(wbeuentities: value.to_s)
      end

      # How many entity usages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(wbeulimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(wbeucontinue: value.to_s)
      end
    end
  end
end
