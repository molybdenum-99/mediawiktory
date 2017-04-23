module MediaWiktory::Wikipedia::Modules
  # Get information about a list of users. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.users(**options).perform # returns string with raw output
  # # or
  # api.some_action.users(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.users.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Users < MediaWiktory::Submodule
    # Which pieces of information to include:
    #
    # @param values [Array<String>] Allowed values: "blockinfo" (Tags if the user is blocked, by whom, and for what reason), "groups" (Lists all the groups each user belongs to), "groupmemberships" (Lists groups that each user has been explicitly assigned to, including the expiry date of each group membership), "implicitgroups" (Lists all the groups a user is automatically a member of), "rights" (Lists all the rights each user has), "editcount" (Adds the user's edit count), "registration" (Adds the user's registration timestamp), "emailable" (Tags if the user can and wants to receive email through Special:Emailuser), "gender" (Tags the gender of the user. Returns "male", "female", or "unknown"), "centralids" (Adds the central IDs and attachment status for the user), "cancreate" (Indicates whether an account for valid but unregistered usernames can be created).
    # @return [self]
    def prop(*values)
      merge(usprop: values.join('|'))
    end
    # With usprop=centralids, indicate whether the user is attached with the wiki identified by this ID.
    #
    # @param value [String]
    # @return [self]
    def attachedwiki(value)
      merge(usattachedwiki: value.to_s)
    end
    # A list of users to obtain information for.
    #
    # @param values [Array<String>]
    # @return [self]
    def users(*values)
      merge(ususers: values.join('|'))
    end
    # A list of user IDs to obtain information for.
    #
    # @param values [Array<Integer>]
    # @return [self]
    def userids(*values)
      merge(ususerids: values.join('|'))
    end
    # Use action=query&meta=tokens instead.
    #
    # @param values [Array<String>] Allowed values: "userrights".
    # @return [self]
    def token(*values)
      merge(ustoken: values.join('|'))
    end

  end
end
