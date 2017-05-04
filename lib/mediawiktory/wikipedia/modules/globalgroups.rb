# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Enumerate all global groups. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Globalgroups

      # What pieces of information to include.
      #
      # @param values [Array<String>] Allowed values: "rights".
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["rights"].include?(value.to_s) && merge(ggpprop: value.to_s)
      end
    end
  end
end
