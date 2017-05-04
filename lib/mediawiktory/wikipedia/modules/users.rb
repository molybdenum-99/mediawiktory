# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get information about a list of users. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Users

      # Which pieces of information to include:
      #
      # @param values [Array<String>] Allowed values: "blockinfo" (Tags if the user is blocked, by whom, and for what reason), "groups" (Lists all the groups each user belongs to), "groupmemberships" (Lists groups that each user has been explicitly assigned to, including the expiry date of each group membership), "implicitgroups" (Lists all the groups a user is automatically a member of), "rights" (Lists all the rights each user has), "editcount" (Adds the user's edit count), "registration" (Adds the user's registration timestamp), "emailable" (Tags if the user can and wants to receive email through Special:Emailuser), "gender" (Tags the gender of the user. Returns "male", "female", or "unknown"), "centralids" (Adds the central IDs and attachment status for the user), "cancreate" (Indicates whether an account for valid but unregistered usernames can be created).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["blockinfo", "groups", "groupmemberships", "implicitgroups", "rights", "editcount", "registration", "emailable", "gender", "centralids", "cancreate"].include?(value.to_s) && merge(usprop: value.to_s)
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
        values.inject(self) { |res, val| res.users_single(val) }
      end

      # @private
      def users_single(value)
        merge(ususers: value.to_s)
      end

      # A list of user IDs to obtain information for.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def userids(*values)
        values.inject(self) { |res, val| res.userids_single(val) }
      end

      # @private
      def userids_single(value)
        merge(ususerids: value.to_s)
      end

      # Use action=query&meta=tokens instead.
      #
      # @param values [Array<String>] Allowed values: "userrights".
      # @return [self]
      def token(*values)
        values.inject(self) { |res, val| res.token_single(val) }
      end

      # @private
      def token_single(value)
        defined?(super) && super || ["userrights"].include?(value.to_s) && merge(ustoken: value.to_s)
      end
    end
  end
end
