# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all BetaFeatures 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Betafeatures

      # Whether to fetch how many users have enabled a certain preference.
      #
      # @param value [String]
      # @return [self]
      def counts(value)
        merge(bfcounts: value.to_s)
      end
    end
  end
end
