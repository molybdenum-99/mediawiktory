# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GPageswithprop

      # Page property for which to enumerate pages (action=query&list=pagepropnames returns page property names in use).
      #
      # @param value [String]
      # @return [self]
      def propname(value)
        merge(gpwppropname: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gpwpcontinue: value.to_s)
      end

      # The maximum number of pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gpwplimit: value.to_s)
      end

      # In which direction to sort.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(gpwpdir: value.to_s)
      end
    end
  end
end
