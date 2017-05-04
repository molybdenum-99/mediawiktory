# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all files that are duplicates of the given files based on hash values. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Duplicatefiles

      # How many duplicate files to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(dflimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(dfcontinue: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(dfdir: value.to_s)
      end

      # Look only for files in the local repository.
      #
      # @return [self]
      def localonly()
        merge(dflocalonly: 'true')
      end
    end
  end
end
