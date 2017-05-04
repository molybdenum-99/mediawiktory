# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get terms associated with a page via an associated data item. On a wikibase entity page, the entity terms are used directly. Caveat: On a repo wiki, pageterms only works directly on entity pages, not on pages connected to an item. This may change in the future. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Pageterms

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def continue(value)
        merge(wbptcontinue: value.to_s)
      end

      # The types of terms to get, e.g. 'description'. If not specified, all types are returned.
      #
      # @param values [Array<String>] Allowed values: "alias", "description", "label".
      # @return [self]
      def terms(*values)
        values.inject(self) { |res, val| res.terms_single(val) }
      end

      protected def terms_single(value)
        defined?(super) && super || ["alias", "description", "label"].include?(value.to_s) && merge(wbptterms: value.to_s)
      end
    end
  end
end
