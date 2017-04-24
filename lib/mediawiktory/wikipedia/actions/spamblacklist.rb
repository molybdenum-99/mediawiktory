# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Validate one or more URLs against the SpamBlacklist. 
  #
  # Usage:
  #
  # ```ruby
  # api.spamblacklist(**options).perform # returns string with raw output
  # # or
  # api.spamblacklist(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.spamblacklist.url(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Spamblacklist < MediaWiktory::Wikipedia::GetAction

    # URLs to validate against the blacklist.
    #
    # @param values [Array<String>]
    # @return [self]
    def url(*values)
      merge(url: values.join('|'))
    end
  end
end
