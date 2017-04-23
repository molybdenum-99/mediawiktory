module MediaWiktory::Wikipedia::Modules
  # Returns information about the given categories. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.categoryinfo(**options).perform # returns string with raw output
  # # or
  # api.some_action.categoryinfo(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.categoryinfo.continue(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Categoryinfo < MediaWiktory::Submodule
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(cicontinue: value.to_s)
    end

  end
end