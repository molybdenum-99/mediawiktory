# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get a list of files in the current user's upload stash. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Mystashedfiles

      # Which properties to fetch for the files.
      #
      # @param values [Array<String>] Allowed values: "size" (Fetch the file size and image dimensions), "type" (Fetch the file's MIME type and media type).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["size", "type"].include?(value.to_s) && merge(msfprop: value.to_s)
      end

      # How many files to get.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(msflimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(msfcontinue: value.to_s)
      end
    end
  end
end
