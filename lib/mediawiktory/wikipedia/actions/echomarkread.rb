# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Mark notifications as read for the current user. 
  #
  # Usage:
  #
  # ```ruby
  # api.echomarkread(**options).perform # returns string with raw output
  # # or
  # api.echomarkread(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.echomarkread.list(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Echomarkread < MediaWiktory::GetAction
    # A list of notification IDs to mark as read.
    #
    # @param values [Array<String>]
    # @return [self]
    def list(*values)
      merge(list: values.join('|'))
    end
    # A list of notification IDs to mark as unread.
    #
    # @param values [Array<String>]
    # @return [self]
    def unreadlist(*values)
      merge(unreadlist: values.join('|'))
    end
    # If set, marks all of a user's notifications as read.
    #
    # @return [self]
    def all()
      merge(all: 'true')
    end
    # A list of sections to mark as read.
    #
    # @param values [Array<String>] Allowed values: "alert", "message".
    # @return [self]
    def sections(*values)
      merge(sections: values.join('|'))
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
