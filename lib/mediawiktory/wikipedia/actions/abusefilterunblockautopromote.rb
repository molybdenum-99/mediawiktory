# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Unblocks a user from receiving autopromotions due to an abusefilter consequence. 
    #
    # Usage:
    #
    # ```ruby
    # api.abusefilterunblockautopromote(**options).perform # returns string with raw output
    # # or
    # api.abusefilterunblockautopromote(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.abusefilterunblockautopromote.user(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Abusefilterunblockautopromote < MediaWiktory::Wikipedia::GetAction

      # Username of the user you want to unblock.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(user: value.to_s)
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
end
