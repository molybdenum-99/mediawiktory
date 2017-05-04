# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Find all pages that link to the given language link. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Langbacklinks

      # Language for the language link.
      #
      # @param value [String]
      # @return [self]
      def lang(value)
        merge(lbllang: value.to_s)
      end

      # Language link to search for. Must be used with lbllang.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(lbltitle: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(lblcontinue: value.to_s)
      end

      # How many total pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(lbllimit: value.to_s)
      end

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "lllang" (Adds the language code of the language link), "lltitle" (Adds the title of the language link).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["lllang", "lltitle"].include?(value.to_s) && merge(lblprop: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(lbldir: value.to_s)
      end
    end
  end
end
