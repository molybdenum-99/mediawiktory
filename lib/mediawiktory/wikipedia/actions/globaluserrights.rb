# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Add/remove a user to/from global groups. 
    #
    # Usage:
    #
    # ```ruby
    # api.globaluserrights(**options).perform # returns string with raw output
    # # or
    # api.globaluserrights(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.globaluserrights.user(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Globaluserrights < MediaWiktory::Wikipedia::PostAction

      # Global user name.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(user: value.to_s)
      end

      # Global user ID.
      #
      # @param value [Integer]
      # @return [self]
      def userid(value)
        merge(userid: value.to_s)
      end

      # Add the user to these global groups.
      #
      # @param values [Array<String>] Allowed values: "OTRS-member", "abusefilter-helper", "apihighlimits-requestor", "captcha-exempt", "delete-global", "founder", "global-bot", "global-flow-create", "global-interface-editor", "global-ipblock-exempt", "global-rollbacker", "global-sysop", "new-wikis-importer", "oathauth-tester", "ombudsman", "recursive-export", "staff", "steward", "sysadmin", "wmf-ops-monitoring", "wmf-researcher".
      # @return [self]
      def add(*values)
        merge(add: values.join('|'))
      end

      # Remove the user from these global groups.
      #
      # @param values [Array<String>] Allowed values: "OTRS-member", "abusefilter-helper", "apihighlimits-requestor", "captcha-exempt", "delete-global", "founder", "global-bot", "global-flow-create", "global-interface-editor", "global-ipblock-exempt", "global-rollbacker", "global-sysop", "new-wikis-importer", "oathauth-tester", "ombudsman", "recursive-export", "staff", "steward", "sysadmin", "wmf-ops-monitoring", "wmf-researcher".
      # @return [self]
      def remove(*values)
        merge(remove: values.join('|'))
      end

      # Reason for the change.
      #
      # @param value [String]
      # @return [self]
      def reason(value)
        merge(reason: value.to_s)
      end

      # A "userrights" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end

      # This parameter is currently unused.
      #
      # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
      # @return [self]
      def tags(*values)
        merge(tags: values.join('|'))
      end
  end
  end
end
