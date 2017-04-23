module MediaWiktory::Wikipedia::Modules
  # Get information about what languages the user knows 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.babel(**options).perform # returns string with raw output
  # # or
  # api.some_action.babel(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.babel.user(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Babel < MediaWiktory::Submodule
    # User to get information about
    #
    # @param value [String]
    # @return [self]
    def user(value)
      merge(babuser: value.to_s)
    end

  end
end