# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Get basic information about review flag configuration for this site. 
    #
    # Usage:
    #
    # ```ruby
    # api.flagconfig.perform # returns string with raw output
    # # or
    # api.flagconfig.response # returns output parsed and wrapped into Mash-like object
    # ```
    #
    # This action has no parameters.
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Flagconfig < MediaWiktory::Wikipedia::Actions::Get
    end
  end
end
