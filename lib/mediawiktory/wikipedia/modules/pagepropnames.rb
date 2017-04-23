# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # List all page property names in use on the wiki. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.pagepropnames(**options).perform # returns string with raw output
  # # or
  # api.some_action.pagepropnames(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.pagepropnames.continue(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Pagepropnames
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(ppncontinue: value.to_s)
    end
    # The maximum number of names to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(ppnlimit: value.to_s)
    end
  end
end
