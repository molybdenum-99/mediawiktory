module MediaWiktory::Wikipedia::Modules
  # Return ORES configuration and model data for this wiki. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.ores(**options).perform # returns string with raw output
  # # or
  # api.some_action.ores(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.ores.(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Ores < MediaWiktory::Submodule

  end
end