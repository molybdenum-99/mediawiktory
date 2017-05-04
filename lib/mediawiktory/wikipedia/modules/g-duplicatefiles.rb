# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GDuplicatefiles

      # How many duplicate files to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gdflimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gdfcontinue: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(gdfdir: value.to_s)
      end

      # Look only for files in the local repository.
      #
      # @return [self]
      def localonly()
        merge(gdflocalonly: 'true')
      end
    end
  end
end
