# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Change a user's group membership. 
    #
    # Usage:
    #

    # ```ruby
    # api.userrights(**options).perform # returns string with raw output
    # # or
    # api.userrights(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.userrights.user(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Userrights < MediaWiktory::Wikipedia::Actions::Post

      # User name.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(user: value.to_s)
      end

      # User ID.
      #
      # @param value [Integer]
      # @return [self]
      def userid(value)
        merge(userid: value.to_s)
      end

      # Add the user to these groups, or if they are already a member, update the expiry of their membership in that group.
      #
      # @param values [Array<String>] Allowed values: "bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor".
      # @return [self]
      def add(*values)
        values.inject(self) { |res, val| res.add_single(val) }
      end

      protected def add_single(value)
        defined?(super) && super || ["bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor"].include?(value.to_s) && merge(add: value.to_s)
      end

      # Expiry timestamps. May be relative (e.g. 5 months or 2 weeks) or absolute (e.g. 2014-09-18T12:34:56Z). If only one timestamp is set, it will be used for all groups passed to the add parameter. Use infinite, indefinite, infinity, or never for a never-expiring user group.
      #
      # @param values [Array<String>]
      # @return [self]
      def expiry(*values)
        values.inject(self) { |res, val| res.expiry_single(val) }
      end

      protected def expiry_single(value)
        merge(expiry: value.to_s)
      end

      # Remove the user from these groups.
      #
      # @param values [Array<String>] Allowed values: "bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor".
      # @return [self]
      def remove(*values)
        values.inject(self) { |res, val| res.remove_single(val) }
      end

      protected def remove_single(value)
        defined?(super) && super || ["bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor"].include?(value.to_s) && merge(remove: value.to_s)
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

      # Change tags to apply to the entry in the user rights log.
      #
      # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
      # @return [self]
      def tags(*values)
        values.inject(self) { |res, val| res.tags_single(val) }
      end

      protected def tags_single(value)
        defined?(super) && super || ["ProveIt edit", "WPCleaner", "huggle", "large plot addition"].include?(value.to_s) && merge(tags: value.to_s)
      end
    end
  end
end
