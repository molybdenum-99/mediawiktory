module MediaWiktory::Wikipedia::Modules
  # Get information about the flagging status of the given pages. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.flagged(**options).perform # returns string with raw output
  # # or
  # api.some_action.flagged(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.flagged.(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Flagged < MediaWiktory::Submodule

  end
end
