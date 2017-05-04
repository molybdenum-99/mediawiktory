# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Enumerate all registered users. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Allusers

      # The user name to start enumerating from.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(aufrom: value.to_s)
      end

      # The user name to stop enumerating at.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(auto: value.to_s)
      end

      # Search for all users that begin with this value.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(auprefix: value.to_s)
      end

      # Direction to sort in.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        defined?(super) && super || ["ascending", "descending"].include?(value.to_s) && merge(audir: value.to_s)
      end

      # Only include users in the given groups.
      #
      # @param values [Array<String>] Allowed values: "bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor".
      # @return [self]
      def group(*values)
        values.inject(self) { |res, val| res.group_single(val) }
      end

      # @private
      def group_single(value)
        defined?(super) && super || ["bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor"].include?(value.to_s) && merge(augroup: value.to_s)
      end

      # Exclude users in the given groups.
      #
      # @param values [Array<String>] Allowed values: "bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor".
      # @return [self]
      def excludegroup(*values)
        values.inject(self) { |res, val| res.excludegroup_single(val) }
      end

      # @private
      def excludegroup_single(value)
        defined?(super) && super || ["bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor"].include?(value.to_s) && merge(auexcludegroup: value.to_s)
      end

      # Only include users with the given rights. Does not include rights granted by implicit or auto-promoted groups like *, user, or autoconfirmed.
      #
      # @param values [Array<String>] Allowed values: "apihighlimits", "applychangetags", "autoconfirmed", "autocreateaccount", "autopatrol", "bigdelete", "block", "blockemail", "bot", "browsearchive", "changetags", "createaccount", "createpage", "createtalk", "delete", "deletechangetags", "deletedhistory", "deletedtext", "deletelogentry", "deleterevision", "edit", "editcontentmodel", "editinterface", "editprotected", "editmyoptions", "editmyprivateinfo", "editmyusercss", "editmyuserjs", "editmywatchlist", "editsemiprotected", "editusercss", "edituserjs", "hideuser", "import", "importupload", "ipblock-exempt", "managechangetags", "markbotedits", "mergehistory", "minoredit", "move", "movefile", "move-categorypages", "move-rootuserpages", "move-subpages", "nominornewtalk", "noratelimit", "override-export-depth", "pagelang", "patrol", "patrolmarks", "protect", "purge", "read", "reupload", "reupload-own", "reupload-shared", "rollback", "sendemail", "siteadmin", "suppressionlog", "suppressredirect", "suppressrevision", "unblockself", "undelete", "unwatchedpages", "upload", "upload_by_url", "userrights", "userrights-interwiki", "viewmyprivateinfo", "viewmywatchlist", "viewsuppressed", "writeapi", "spamblacklistlog", "tboverride", "tboverride-account", "titleblacklistlog", "gadgets-edit", "gadgets-definition-edit", "globalblock", "globalblock-whitelist", "globalblock-exempt", "securepoll-create-poll", "renameuser", "nuke", "torunblocked", "skipcaptcha", "override-antispoof", "centralauth-merge", "centralauth-unmerge", "centralauth-lock", "centralauth-oversight", "globalgrouppermissions", "globalgroupmembership", "centralauth-rename", "centralauth-usermerge", "abusefilter-modify", "abusefilter-log-detail", "abusefilter-view", "abusefilter-log", "abusefilter-private", "abusefilter-modify-restricted", "abusefilter-revert", "abusefilter-view-private", "abusefilter-log-private", "abusefilter-hidden-log", "abusefilter-hide-log", "abusefilter-modify-global", "massmessage", "vipsscaler-test", "ep-org", "ep-course", "ep-token", "ep-enroll", "ep-remstudent", "ep-online", "ep-campus", "ep-instructor", "ep-beonline", "ep-becampus", "ep-beinstructor", "ep-bereviewer", "ep-remreviewer", "ep-bulkdelorgs", "ep-bulkdelcourses", "ep-remarticle", "ep-addstudent", "usermerge", "mwoauthproposeconsumer", "mwoauthupdateownconsumer", "mwoauthmanageconsumer", "mwoauthsuppress", "mwoauthviewsuppressed", "mwoauthviewprivate", "mwoauthmanagemygrants", "oathauth-enable", "oathauth-api-all", "checkuser", "checkuser-log", "autoreviewrestore", "stablesettings", "review", "unreviewedpages", "movestable", "validate", "templateeditor", "editeditorprotected", "editextendedsemiprotected", "extendedconfirmed", "flow-create-board", "flow-edit-post", "flow-suppress", "flow-hide", "flow-delete", "viewdeletedfile", "autoreview", "transcode-reset", "transcode-status", "collectionsaveasuserpage", "collectionsaveascommunitypage".
      # @return [self]
      def rights(*values)
        values.inject(self) { |res, val| res.rights_single(val) }
      end

      # @private
      def rights_single(value)
        defined?(super) && super || ["apihighlimits", "applychangetags", "autoconfirmed", "autocreateaccount", "autopatrol", "bigdelete", "block", "blockemail", "bot", "browsearchive", "changetags", "createaccount", "createpage", "createtalk", "delete", "deletechangetags", "deletedhistory", "deletedtext", "deletelogentry", "deleterevision", "edit", "editcontentmodel", "editinterface", "editprotected", "editmyoptions", "editmyprivateinfo", "editmyusercss", "editmyuserjs", "editmywatchlist", "editsemiprotected", "editusercss", "edituserjs", "hideuser", "import", "importupload", "ipblock-exempt", "managechangetags", "markbotedits", "mergehistory", "minoredit", "move", "movefile", "move-categorypages", "move-rootuserpages", "move-subpages", "nominornewtalk", "noratelimit", "override-export-depth", "pagelang", "patrol", "patrolmarks", "protect", "purge", "read", "reupload", "reupload-own", "reupload-shared", "rollback", "sendemail", "siteadmin", "suppressionlog", "suppressredirect", "suppressrevision", "unblockself", "undelete", "unwatchedpages", "upload", "upload_by_url", "userrights", "userrights-interwiki", "viewmyprivateinfo", "viewmywatchlist", "viewsuppressed", "writeapi", "spamblacklistlog", "tboverride", "tboverride-account", "titleblacklistlog", "gadgets-edit", "gadgets-definition-edit", "globalblock", "globalblock-whitelist", "globalblock-exempt", "securepoll-create-poll", "renameuser", "nuke", "torunblocked", "skipcaptcha", "override-antispoof", "centralauth-merge", "centralauth-unmerge", "centralauth-lock", "centralauth-oversight", "globalgrouppermissions", "globalgroupmembership", "centralauth-rename", "centralauth-usermerge", "abusefilter-modify", "abusefilter-log-detail", "abusefilter-view", "abusefilter-log", "abusefilter-private", "abusefilter-modify-restricted", "abusefilter-revert", "abusefilter-view-private", "abusefilter-log-private", "abusefilter-hidden-log", "abusefilter-hide-log", "abusefilter-modify-global", "massmessage", "vipsscaler-test", "ep-org", "ep-course", "ep-token", "ep-enroll", "ep-remstudent", "ep-online", "ep-campus", "ep-instructor", "ep-beonline", "ep-becampus", "ep-beinstructor", "ep-bereviewer", "ep-remreviewer", "ep-bulkdelorgs", "ep-bulkdelcourses", "ep-remarticle", "ep-addstudent", "usermerge", "mwoauthproposeconsumer", "mwoauthupdateownconsumer", "mwoauthmanageconsumer", "mwoauthsuppress", "mwoauthviewsuppressed", "mwoauthviewprivate", "mwoauthmanagemygrants", "oathauth-enable", "oathauth-api-all", "checkuser", "checkuser-log", "autoreviewrestore", "stablesettings", "review", "unreviewedpages", "movestable", "validate", "templateeditor", "editeditorprotected", "editextendedsemiprotected", "extendedconfirmed", "flow-create-board", "flow-edit-post", "flow-suppress", "flow-hide", "flow-delete", "viewdeletedfile", "autoreview", "transcode-reset", "transcode-status", "collectionsaveasuserpage", "collectionsaveascommunitypage"].include?(value.to_s) && merge(aurights: value.to_s)
      end

      # Which pieces of information to include:
      #
      # @param values [Array<String>] Allowed values: "blockinfo" (Adds the information about a current block on the user), "groups" (Lists groups that the user is in. This uses more server resources and may return fewer results than the limit), "implicitgroups" (Lists all the groups the user is automatically in), "rights" (Lists rights that the user has), "editcount" (Adds the edit count of the user), "registration" (Adds the timestamp of when the user registered if available (may be blank)), "centralids" (Adds the central IDs and attachment status for the user).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      # @private
      def prop_single(value)
        defined?(super) && super || ["blockinfo", "groups", "implicitgroups", "rights", "editcount", "registration", "centralids"].include?(value.to_s) && merge(auprop: value.to_s)
      end

      # How many total user names to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(aulimit: value.to_s)
      end

      # Only list users who have made edits.
      #
      # @return [self]
      def witheditsonly()
        merge(auwitheditsonly: 'true')
      end

      # Only list users active in the last 30 days.
      #
      # @return [self]
      def activeusers()
        merge(auactiveusers: 'true')
      end

      # With auprop=centralids, also indicate whether the user is attached with the wiki identified by this ID.
      #
      # @param value [String]
      # @return [self]
      def attachedwiki(value)
        merge(auattachedwiki: value.to_s)
      end
    end
  end
end
