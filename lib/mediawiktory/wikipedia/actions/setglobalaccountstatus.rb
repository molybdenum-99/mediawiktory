# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Set a global user's status. 
  #
  # Usage:
  #
  # ```ruby
  # api.setglobalaccountstatus(**options).perform # returns string with raw output
  # # or
  # api.setglobalaccountstatus(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.setglobalaccountstatus.user(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Setglobalaccountstatus < MediaWiktory::GetAction
    # User to change the status of.
    #
    # @param value [String]
    # @return [self]
    def user(value)
      merge(user: value.to_s)
    end
    # Change whether this user is locked or not.
    #
    # @param value [String] One of "lock", "unlock".
    # @return [self]
    def locked(value)
      merge(locked: value.to_s)
    end
    # Change whether this user is not hidden, hidden from lists, or suppressed.
    #
    # @param value [String] One of "lists", "suppressed".
    # @return [self]
    def hidden(value)
      merge(hidden: value.to_s)
    end
    # Reason for changing the user's status.
    #
    # @param value [String]
    # @return [self]
    def reason(value)
      merge(reason: value.to_s)
    end
    # Optional MD5 of the expected current <username>:<hidden>:<locked>, to detect edit conflicts. Set <locked> to 1 for locked, 0 for unlocked.
    #
    # @param value [String]
    # @return [self]
    def statecheck(value)
      merge(statecheck: value.to_s)
    end
    # A "setglobalaccountstatus" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(token: value.to_s)
    end
  end
end
