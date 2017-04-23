# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Get a new FancyCaptcha. 
  #
  # Usage:
  #
  # ```ruby
  # api.fancycaptchareload(**options).perform # returns string with raw output
  # # or
  # api.fancycaptchareload(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.fancycaptchareload.(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Fancycaptchareload < MediaWiktory::GetAction
  end
end
