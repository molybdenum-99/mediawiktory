module MediaWiktory::Wikipedia::Actions
  # Receive a bounce email and process it to handle the failing recipient. 
  #
  # Usage:
  #
  # ```ruby
  # api.bouncehandler(**options).perform # returns string with raw output
  # # or
  # api.bouncehandler(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.bouncehandler.email(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Bouncehandler < MediaWiktory::GetAction
    # The bounced email.
    #
    # @param value [String]
    # @return [self]
    def email(value)
      merge(email: value.to_s)
    end

  end
end
