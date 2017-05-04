# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Find all pages that transclude the given pages. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Transcludedin

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "pageid" (Page ID of each page), "title" (Title of each page), "redirect" (Flag if the page is a redirect).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["pageid", "title", "redirect"].include?(value.to_s) && merge(tiprop: value.to_s)
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
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(tinamespace: value.to_s)
      end

      # Show only items that meet these criteria:
      #
      # @param values [Array<String>] Allowed values: "redirect" (Only show redirects), "!redirect" (Only show non-redirects).
      # @return [self]
      def show(*values)
        values.inject(self) { |res, val| res.show_single(val) }
      end

      # @private
      def show_single(value)
        defined?(super) && super || ["redirect", "!redirect"].include?(value.to_s) && merge(tishow: value.to_s)
      end

      # How many to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(tilimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(ticontinue: value.to_s)
      end
    end
  end
end
