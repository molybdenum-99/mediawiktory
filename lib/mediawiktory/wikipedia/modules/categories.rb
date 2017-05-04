# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all categories the pages belong to. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Categories

      # Which additional properties to get for each category:
      #
      # @param values [Array<String>] Allowed values: "sortkey" (Adds the sortkey (hexadecimal string) and sortkey prefix (human-readable part) for the category), "timestamp" (Adds timestamp of when the category was added), "hidden" (Tags categories that are hidden with __HIDDENCAT__).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      protected def prop_single(value)
        defined?(super) && super || ["sortkey", "timestamp", "hidden"].include?(value.to_s) && merge(clprop: value.to_s)
      end

      # Which kind of categories to show.
      #
      # @param values [Array<String>] Allowed values: "hidden", "!hidden".
      # @return [self]
      def show(*values)
        values.inject(self) { |res, val| res.show_single(val) }
      end

      protected def show_single(value)
        defined?(super) && super || ["hidden", "!hidden"].include?(value.to_s) && merge(clshow: value.to_s)
      end

      # How many categories to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(cllimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(clcontinue: value.to_s)
      end

      # Only list these categories. Useful for checking whether a certain page is in a certain category.
      #
      # @param values [Array<String>]
      # @return [self]
      def categories(*values)
        values.inject(self) { |res, val| res.categories_single(val) }
      end

      protected def categories_single(value)
        merge(clcategories: value.to_s)
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(cldir: value.to_s)
      end
    end
  end
end
