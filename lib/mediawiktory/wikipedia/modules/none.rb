# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Output nothing. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.none(**options).perform # returns string with raw output
    # # or
    # api.some_action.none(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.none.(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module None
    end
  end
end
