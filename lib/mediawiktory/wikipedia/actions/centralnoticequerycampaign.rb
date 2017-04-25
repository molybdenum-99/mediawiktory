# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Get all configuration settings for a campaign. 
    #
    # Usage:
    #
    # ```ruby
    # api.centralnoticequerycampaign(**options).perform # returns string with raw output
    # # or
    # api.centralnoticequerycampaign(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.centralnoticequerycampaign.campaign(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Centralnoticequerycampaign < MediaWiktory::Wikipedia::GetAction

    # Campaign name. Separate multiple values with a "|" (vertical bar).
    #
    # @param value [String]
    # @return [self]
    def campaign(value)
      merge(campaign: value.to_s)
    end
  end
  end
end
