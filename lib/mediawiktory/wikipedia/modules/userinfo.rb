# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Get information about the current user. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.userinfo(**options).perform # returns string with raw output
  # # or
  # api.some_action.userinfo(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.userinfo.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Userinfo
    # Which pieces of information to include:
    #
    # @param values [Array<String>] Allowed values: "blockinfo" (Tags if the current user is blocked, by whom, and for what reason), "hasmsg" (Adds a tag messages if the current user has pending messages), "groups" (Lists all the groups the current user belongs to), "groupmemberships" (Lists groups that the current user has been explicitly assigned to, including the expiry date of each group membership), "implicitgroups" (Lists all the groups the current user is automatically a member of), "rights" (Lists all the rights the current user has), "changeablegroups" (Lists the groups the current user can add to and remove from), "options" (Lists all preferences the current user has set), "preferencestoken" (Deprecated. Get a token to change current user's preferences), "editcount" (Adds the current user's edit count), "ratelimits" (Lists all rate limits applying to the current user), "email" (Adds the user's email address and email authentication date), "realname" (Adds the user's real name), "acceptlang" (Echoes the Accept-Language header sent by the client in a structured format), "registrationdate" (Adds the user's registration date), "unreadcount" (Adds the count of unread pages on the user's watchlist (maximum 999; returns 1000+ if more)), "centralids" (Adds the central IDs and attachment status for the user).
    # @return [self]
    def prop(*values)
      merge(uiprop: values.join('|'))
    end
    # With uiprop=centralids, indicate whether the user is attached with the wiki identified by this ID.
    #
    # @param value [String]
    # @return [self]
    def attachedwiki(value)
      merge(uiattachedwiki: value.to_s)
    end
  end
end
