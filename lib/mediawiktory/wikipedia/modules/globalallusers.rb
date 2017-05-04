# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Enumerate all global users. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Globalallusers

      # The user name to start enumerating from.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(agufrom: value.to_s)
      end

      # The user name to stop enumerating at.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(aguto: value.to_s)
      end

      # Search for all users that begin with this value.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(aguprefix: value.to_s)
      end

      # Direction to sort in.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(agudir: value.to_s)
      end

      # Limit users to given global groups.
      #
      # @param values [Array<String>] Allowed values: "OTRS-member", "abusefilter-helper", "apihighlimits-requestor", "captcha-exempt", "delete-global", "founder", "global-bot", "global-flow-create", "global-interface-editor", "global-ipblock-exempt", "global-rollbacker", "global-sysop", "new-wikis-importer", "oathauth-tester", "ombudsman", "recursive-export", "staff", "steward", "sysadmin", "wmf-ops-monitoring", "wmf-researcher".
      # @return [self]
      def group(*values)
        values.inject(self) { |res, val| res.group_single(val) }
      end

      # @private
      def group_single(value)
        defined?(super) && super || ["OTRS-member", "abusefilter-helper", "apihighlimits-requestor", "captcha-exempt", "delete-global", "founder", "global-bot", "global-flow-create", "global-interface-editor", "global-ipblock-exempt", "global-rollbacker", "global-sysop", "new-wikis-importer", "oathauth-tester", "ombudsman", "recursive-export", "staff", "steward", "sysadmin", "wmf-ops-monitoring", "wmf-researcher"].include?(value.to_s) && merge(agugroup: value.to_s)
      end

      # Exclude users in given global groups.
      #
      # @param values [Array<String>] Allowed values: "OTRS-member", "abusefilter-helper", "apihighlimits-requestor", "captcha-exempt", "delete-global", "founder", "global-bot", "global-flow-create", "global-interface-editor", "global-ipblock-exempt", "global-rollbacker", "global-sysop", "new-wikis-importer", "oathauth-tester", "ombudsman", "recursive-export", "staff", "steward", "sysadmin", "wmf-ops-monitoring", "wmf-researcher".
      # @return [self]
      def excludegroup(*values)
        values.inject(self) { |res, val| res.excludegroup_single(val) }
      end

      # @private
      def excludegroup_single(value)
        defined?(super) && super || ["OTRS-member", "abusefilter-helper", "apihighlimits-requestor", "captcha-exempt", "delete-global", "founder", "global-bot", "global-flow-create", "global-interface-editor", "global-ipblock-exempt", "global-rollbacker", "global-sysop", "new-wikis-importer", "oathauth-tester", "ombudsman", "recursive-export", "staff", "steward", "sysadmin", "wmf-ops-monitoring", "wmf-researcher"].include?(value.to_s) && merge(aguexcludegroup: value.to_s)
      end

      # What pieces of information to include:
      #
      # @param values [Array<String>] Allowed values: "lockinfo" (Whether the user account is locked), "groups" (Lists global groups that the user is in. This uses more server resources and may return fewer results than the limit), "existslocally" (Adds the information if the user exists locally).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["lockinfo", "groups", "existslocally"].include?(value.to_s) && merge(aguprop: value.to_s)
      end

      # How many total user names to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(agulimit: value.to_s)
      end
    end
  end
end
