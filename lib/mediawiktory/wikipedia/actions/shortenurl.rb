# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Shorten a long URL into a shorter one. 
  #
  # Usage:
  #
  # ```ruby
  # api.shortenurl(**options).perform # returns string with raw output
  # # or
  # api.shortenurl(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.shortenurl.url(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Shortenurl < MediaWiktory::GetAction
    # URL to be shortened.
    #
    # @param value [String]
    # @return [self]
    def url(value)
      merge(url: value.to_s)
    end
  end
end
