# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Log out and clear session data. 
    #
    # Usage:
    #
    # ```ruby
    # api.logout(**options).perform # returns string with raw output
    # # or
    # api.logout(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.logout.(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Logout < MediaWiktory::Wikipedia::Actions::Get
  end
  end
end
