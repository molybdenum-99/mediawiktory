# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns all redirects to the given pages. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Redirects

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "pageid" (Page ID of each redirect), "title" (Title of each redirect), "fragment" (Fragment of each redirect, if any).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["pageid", "title", "fragment"].include?(value.to_s) && merge(rdprop: value.to_s)
      end

      # Only include pages in these namespaces.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res.namespace_single(val) }
      end

      # @private
      def namespace_single(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(rdnamespace: value.to_s)
      end

      # Show only items that meet these criteria:
      #
      # @param values [Array<String>] Allowed values: "fragment" (Only show redirects with a fragment), "!fragment" (Only show redirects without a fragment).
      # @return [self]
      def show(*values)
        values.inject(self) { |res, val| res.show_single(val) }
      end

      # @private
      def show_single(value)
        defined?(super) && super || ["fragment", "!fragment"].include?(value.to_s) && merge(rdshow: value.to_s)
      end

      # How many redirects to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(rdlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(rdcontinue: value.to_s)
      end
    end
  end
end
