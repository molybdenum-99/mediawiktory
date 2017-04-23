module MediaWiktory::Wikipedia::Actions
  # Export an RSD (Really Simple Discovery) schema. 
  #
  # Usage:
  #
  # ```ruby
  # api.rsd(**options).perform # returns string with raw output
  # # or
  # api.rsd(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.rsd.(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Rsd < MediaWiktory::GetAction

  end
end