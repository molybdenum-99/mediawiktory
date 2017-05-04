# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Enumerate all wiki sets. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Wikisets

      # The name of the wiki set to start from.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(wsfrom: value.to_s)
      end

      # What pieces of information to include.
      #
      # @param values [Array<String>] Allowed values: "type" (Opt-in based (includes only specified wikis) or opt-out based (includes all wikis except specified)), "wikisincluded" (The wikis that are included in this wiki set), "wikisnotincluded" (The wikis that are not included in this wiki set).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["type", "wikisincluded", "wikisnotincluded"].include?(value.to_s) && merge(wsprop: value.to_s)
      end

      # How many wiki sets to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(wslimit: value.to_s)
      end

      # Order results by name.
      #
      # @return [self]
      def orderbyname()
        merge(wsorderbyname: 'true')
      end
    end
  end
end
