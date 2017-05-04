# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all pages using a given page property. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Pageswithprop

      # Page property for which to enumerate pages (action=query&list=pagepropnames returns page property names in use).
      #
      # @param value [String]
      # @return [self]
      def propname(value)
        merge(pwppropname: value.to_s)
      end

      # Which pieces of information to include:
      #
      # @param values [Array<String>] Allowed values: "ids" (Adds the page ID), "title" (Adds the title and namespace ID of the page), "value" (Adds the value of the page property).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      protected def prop_single(value)
        defined?(super) && super || ["ids", "title", "value"].include?(value.to_s) && merge(pwpprop: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(pwpcontinue: value.to_s)
      end

      # The maximum number of pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(pwplimit: value.to_s)
      end

      # In which direction to sort.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(pwpdir: value.to_s)
      end
    end
  end
end
