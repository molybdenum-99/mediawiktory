# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all BetaFeatures 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.betafeatures(**options).perform # returns string with raw output
    # # or
    # api.some_action.betafeatures(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.betafeatures.counts(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
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
