# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns global image usage for a certain image. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Globalusage

      # Which properties to return:
      #
      # @param values [Array<String>] Allowed values: "url" (Adds url), "pageid" (Adds page ID), "namespace" (Adds namespace ID).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["url", "pageid", "namespace"].include?(value.to_s) && merge(guprop: value.to_s)
      end

      # How many links to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gulimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gucontinue: value.to_s)
      end

      # Filter local usage of the file.
      #
      # @return [self]
      def filterlocal()
        merge(gufilterlocal: 'true')
      end
    end
  end
end
