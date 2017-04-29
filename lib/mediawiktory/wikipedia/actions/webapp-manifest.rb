# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Returns a webapp manifest. 
    #
    # Usage:
    #
    # ```ruby
    # api.webapp-manifest(**options).perform # returns string with raw output
    # # or
    # api.webapp-manifest(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.webapp-manifest.(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class WebappManifest < MediaWiktory::Wikipedia::Actions::Get
    end
  end
end
