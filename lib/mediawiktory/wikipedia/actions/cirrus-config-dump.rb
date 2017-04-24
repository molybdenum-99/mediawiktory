# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Dump of CirrusSearch configuration. 
  #
  # Usage:
  #
  # ```ruby
  # api.cirrus-config-dump(**options).perform # returns string with raw output
  # # or
  # api.cirrus-config-dump(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.cirrus-config-dump.(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class CirrusConfigDump < MediaWiktory::Wikipedia::GetAction
  end
end
