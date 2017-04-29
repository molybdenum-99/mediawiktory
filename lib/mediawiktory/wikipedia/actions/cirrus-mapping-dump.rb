# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Dump of CirrusSearch mapping for this wiki. 
    #
    # Usage:
    #
    # ```ruby
    # api.cirrus-mapping-dump(**options).perform # returns string with raw output
    # # or
    # api.cirrus-mapping-dump(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.cirrus-mapping-dump.(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class CirrusMappingDump < MediaWiktory::Wikipedia::Actions::Get
  end
  end
end
