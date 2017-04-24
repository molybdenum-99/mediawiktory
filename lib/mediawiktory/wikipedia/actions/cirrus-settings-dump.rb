# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Dump of CirrusSearch settings for this wiki. 
  #
  # Usage:
  #
  # ```ruby
  # api.cirrus-settings-dump(**options).perform # returns string with raw output
  # # or
  # api.cirrus-settings-dump(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.cirrus-settings-dump.(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class CirrusSettingsDump < MediaWiktory::Wikipedia::GetAction
  end
end
