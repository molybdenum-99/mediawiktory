# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Returns a webapp manifest.
    #
    # Usage:
    #
    # ```ruby
    # api.webapp-manifest.perform # returns string with raw output
    # # or
    # api.webapp-manifest.response # returns output parsed and wrapped into Mash-like object
    # ```
    #
    # This action has no parameters.
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class WebappManifest < MediaWiktory::Wikipedia::Actions::Get
    end
  end
end
