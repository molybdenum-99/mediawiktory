# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Check which IP addresses are used by a given username or which usernames are used by a given IP address. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.checkuser(**options).perform # returns string with raw output
  # # or
  # api.some_action.checkuser(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.checkuser.request(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Checkuser
    # Type of CheckUser request:
    #
    # @param value [String] One of "userips" (Get IP address of target user), "edits" (Get changes from target IP address or range), "ipusers" (Get users from target IP address or range).
    # @return [self]
    def request(value)
      merge(curequest: value.to_s)
    end
    # Username, IP address, or CIDR range to check.
    #
    # @param value [String]
    # @return [self]
    def target(value)
      merge(cutarget: value.to_s)
    end
    # Reason to check.
    #
    # @param value [String]
    # @return [self]
    def reason(value)
      merge(cureason: value.to_s)
    end
    # Limit of rows.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(culimit: value.to_s)
    end
    # Time limit of user data (like "-2 weeks" or "2 weeks ago").
    #
    # @param value [String]
    # @return [self]
    def timecond(value)
      merge(cutimecond: value.to_s)
    end
    # Use XFF data instead of IP address.
    #
    # @param value [String]
    # @return [self]
    def xff(value)
      merge(cuxff: value.to_s)
    end
    # A "csrf" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(cutoken: value.to_s)
    end
  end
end
