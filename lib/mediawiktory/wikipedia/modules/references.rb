module MediaWiktory::Wikipedia::Modules
  # Return a data representation of references associated with the given pages. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.references(**options).perform # returns string with raw output
  # # or
  # api.some_action.references(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.references.continue(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module References
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(rfcontinue: value.to_s)
    end
  end
end
