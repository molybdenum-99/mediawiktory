# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get information about the Wikibase client and the associated Wikibase repository. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Wikibase

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "url" ( Base URL, script path and article path of the Wikibase repository), "siteid" ( The siteid of this site).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      protected def prop_single(value)
        defined?(super) && super || ["url", "siteid"].include?(value.to_s) && merge(wbprop: value.to_s)
      end
    end
  end
end
