# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get a set of random pages. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Random

      # Return pages in these namespaces only.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res.namespace_single(val) }
      end

      protected def namespace_single(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(rnnamespace: value.to_s)
      end

      # How to filter for redirects.
      #
      # @param value [String] One of "all", "redirects", "nonredirects".
      # @return [self]
      def filterredir(value)
        defined?(super) && super || ["all", "redirects", "nonredirects"].include?(value.to_s) && merge(rnfilterredir: value.to_s)
      end

      # Use rnfilterredir=redirects instead.
      #
      # @return [self]
      def redirect()
        merge(rnredirect: 'true')
      end

      # Limit how many random pages will be returned.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(rnlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(rncontinue: value.to_s)
      end
    end
  end
end
