module MediaWiktory::Wikipedia::Actions
  # Check a username against AntiSpoof's normalisation checks. 
  #
  # Usage:
  #
  # ```ruby
  # api.antispoof(**options).perform # returns string with raw output
  # # or
  # api.antispoof(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.antispoof.username(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Antispoof < MediaWiktory::GetAction
    # The username to check against AntiSpoof.
    #
    # @param value [String]
    # @return [self]
    def username(value)
      merge(username: value.to_s)
    end
  end
end
