# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Clears the hasmsg flag for the current user. 
    #
    # Usage:
    #
    # ```ruby
    # api.clearhasmsg(**options).perform # returns string with raw output
    # # or
    # api.clearhasmsg(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.clearhasmsg.(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Clearhasmsg < MediaWiktory::Wikipedia::Actions::Post
    end
  end
end
