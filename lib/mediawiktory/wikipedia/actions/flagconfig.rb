# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Get basic information about review flag configuration for this site. 
  #
  # Usage:
  #
  # ```ruby
  # api.flagconfig(**options).perform # returns string with raw output
  # # or
  # api.flagconfig(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.flagconfig.(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Flagconfig < MediaWiktory::Wikipedia::GetAction
  end
end
