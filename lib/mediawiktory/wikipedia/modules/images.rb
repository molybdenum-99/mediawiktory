# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns all files contained on the given pages. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Images

      # How many files to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(imlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(imcontinue: value.to_s)
      end

      # Only list these files. Useful for checking whether a certain page has a certain file.
      #
      # @param values [Array<String>]
      # @return [self]
      def images(*values)
        values.inject(self) { |res, val| res.images_single(val) }
      end

      protected def images_single(value)
        merge(imimages: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(imdir: value.to_s)
      end
    end
  end
end
