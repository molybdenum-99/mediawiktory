# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # This module has been disabled. 
  #
  # Usage:
  #
  # ```ruby
  # api.imagerotate(**options).perform # returns string with raw output
  # # or
  # api.imagerotate(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.imagerotate.(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Imagerotate < MediaWiktory::Wikipedia::GetAction
  end
end
