# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get various page properties defined in the page content. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Pageprops

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(ppcontinue: value.to_s)
      end

      # Only list these page properties (action=query&list=pagepropnames returns page property names in use). Useful for checking whether pages use a certain page property.
      #
      # @param values [Array<String>]
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      protected def prop_single(value)
        merge(ppprop: value.to_s)
      end
    end
  end
end
