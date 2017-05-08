# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Log out and clear session data. 
    #
    # Usage:
    #
    # ```ruby
    # api.logout.perform # returns string with raw output
    # # or
    # api.logout.response # returns output parsed and wrapped into Mash-like object
    # ```
    #
    # This action has no parameters.
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Logout < MediaWiktory::Wikipedia::Actions::Get
    end
  end
end
