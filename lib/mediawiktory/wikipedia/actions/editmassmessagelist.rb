module MediaWiktory::Wikipedia::Actions
  # Edit a mass message delivery list. 
  #
  # Usage:
  #
  # ```ruby
  # api.editmassmessagelist(**options).perform # returns string with raw output
  # # or
  # api.editmassmessagelist(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.editmassmessagelist.spamlist(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Editmassmessagelist < MediaWiktory::GetAction
    # Title of the delivery list to update.
    #
    # @param value [String]
    # @return [self]
    def spamlist(value)
      merge(spamlist: value.to_s)
    end
    # Titles to add to the list.
    #
    # @param values [Array<String>]
    # @return [self]
    def add(*values)
      merge(add: values.join('|'))
    end
    # Titles to remove from the list.
    #
    # @param values [Array<String>]
    # @return [self]
    def remove(*values)
      merge(remove: values.join('|'))
    end
    # A "csrf" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(token: value.to_s)
    end

  end
end