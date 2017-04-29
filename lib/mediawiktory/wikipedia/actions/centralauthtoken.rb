# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Fetch a centralauthtoken for making an authenticated request to an attached wiki. 
    #
    # Usage:
    #
    # ```ruby
    # api.centralauthtoken(**options).perform # returns string with raw output
    # # or
    # api.centralauthtoken(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.centralauthtoken.(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Centralauthtoken < MediaWiktory::Wikipedia::Actions::Get
    end
  end
end
