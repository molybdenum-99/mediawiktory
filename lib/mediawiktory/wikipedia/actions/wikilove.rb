module MediaWiktory::Wikipedia::Actions
  # Give WikiLove to another user. 
  #
  # Usage:
  #
  # ```ruby
  # api.wikilove(**options).perform # returns string with raw output
  # # or
  # api.wikilove(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.wikilove.title(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Wikilove < MediaWiktory::GetAction
    # Full pagename of the user page or user talk page of the user to send WikiLove to.
    #
    # @param value [String]
    # @return [self]
    def title(value)
      merge(title: value.to_s)
    end
    # Raw wikitext to add in the new section.
    #
    # @param value [String]
    # @return [self]
    def text(value)
      merge(text: value.to_s)
    end
    # Actual message the user has entered, for logging purposes.
    #
    # @param value [String]
    # @return [self]
    def message(value)
      merge(message: value.to_s)
    end
    # A "csrf" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(token: value.to_s)
    end
    # Subject header of the new section.
    #
    # @param value [String]
    # @return [self]
    def subject(value)
      merge(subject: value.to_s)
    end
    # Type of WikiLove (for statistics); this corresponds with a type selected in the menu, and optionally a subtype after that (e.g. as in "The Original Barnstar" or "A kitten for you!").
    #
    # @param value [String]
    # @return [self]
    def type(value)
      merge(type: value.to_s)
    end
    # Content of the optional email message to send to the user. A warning will be returned if the user cannot be emailed. WikiLove will be sent to the users talk page either way.
    #
    # @param value [String]
    # @return [self]
    def email(value)
      merge(email: value.to_s)
    end

  end
end
