# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get the list of logged-in contributors and the count of anonymous contributors to a page. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Contributors

      # Only include users in the given groups. Does not include implicit or auto-promoted groups like *, user, or autoconfirmed.
      #
      # @param values [Array<String>] Allowed values: "bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor".
      # @return [self]
      def group(*values)
        values.inject(self) { |res, val| res._group(val) or fail ArgumentError, "Unknown value for group: #{val}" }
      end

      # @private
      def _group(value)
        defined?(super) && super || ["bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor"].include?(value.to_s) && merge(pcgroup: value.to_s)
      end

      # Exclude users in the given groups. Does not include implicit or auto-promoted groups like *, user, or autoconfirmed.
      #
      # @param values [Array<String>] Allowed values: "bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor".
      # @return [self]
      def excludegroup(*values)
        values.inject(self) { |res, val| res._excludegroup(val) or fail ArgumentError, "Unknown value for excludegroup: #{val}" }
      end

      # @private
      def _excludegroup(value)
        defined?(super) && super || ["bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor"].include?(value.to_s) && merge(pcexcludegroup: value.to_s)
      end

      # Only include users having the given rights. Does not include rights granted by implicit or auto-promoted groups like *, user, or autoconfirmed.
      #
      # @param values [Array<String>] Allowed values: "apihighlimits", "applychangetags", "autoconfirmed", "autocreateaccount", "autopatrol", "bigdelete", "block", "blockemail", "bot", "browsearchive", "changetags", "createaccount", "createpage", "createtalk", "delete", "deletechangetags", "deletedhistory", "deletedtext", "deletelogentry", "deleterevision", "edit", "editcontentmodel", "editinterface", "editprotected", "editmyoptions", "editmyprivateinfo", "editmyusercss", "editmyuserjs", "editmywatchlist", "editsemiprotected", "editusercss", "edituserjs", "hideuser", "import", "importupload", "ipblock-exempt", "managechangetags", "markbotedits", "mergehistory", "minoredit", "move", "movefile", "move-categorypages", "move-rootuserpages", "move-subpages", "nominornewtalk", "noratelimit", "override-export-depth", "pagelang", "patrol", "patrolmarks", "protect", "purge", "read", "reupload", "reupload-own", "reupload-shared", "rollback", "sendemail", "siteadmin", "suppressionlog", "suppressredirect", "suppressrevision", "unblockself", "undelete", "unwatchedpages", "upload", "upload_by_url", "userrights", "userrights-interwiki", "viewmyprivateinfo", "viewmywatchlist", "viewsuppressed", "writeapi", "spamblacklistlog", "tboverride", "tboverride-account", "titleblacklistlog", "gadgets-edit", "gadgets-definition-edit", "globalblock", "globalblock-whitelist", "globalblock-exempt", "securepoll-create-poll", "renameuser", "nuke", "torunblocked", "skipcaptcha", "override-antispoof", "centralauth-merge", "centralauth-unmerge", "centralauth-lock", "centralauth-oversight", "globalgrouppermissions", "globalgroupmembership", "centralauth-rename", "centralauth-usermerge", "abusefilter-modify", "abusefilter-log-detail", "abusefilter-view", "abusefilter-log", "abusefilter-private", "abusefilter-modify-restricted", "abusefilter-revert", "abusefilter-view-private", "abusefilter-log-private", "abusefilter-hidden-log", "abusefilter-hide-log", "abusefilter-modify-global", "massmessage", "vipsscaler-test", "ep-org", "ep-course", "ep-token", "ep-enroll", "ep-remstudent", "ep-online", "ep-campus", "ep-instructor", "ep-beonline", "ep-becampus", "ep-beinstructor", "ep-bereviewer", "ep-remreviewer", "ep-bulkdelorgs", "ep-bulkdelcourses", "ep-remarticle", "ep-addstudent", "usermerge", "mwoauthproposeconsumer", "mwoauthupdateownconsumer", "mwoauthmanageconsumer", "mwoauthsuppress", "mwoauthviewsuppressed", "mwoauthviewprivate", "mwoauthmanagemygrants", "oathauth-enable", "oathauth-api-all", "checkuser", "checkuser-log", "autoreviewrestore", "stablesettings", "review", "unreviewedpages", "movestable", "validate", "templateeditor", "editeditorprotected", "editextendedsemiprotected", "extendedconfirmed", "flow-create-board", "flow-edit-post", "flow-suppress", "flow-hide", "flow-delete", "viewdeletedfile", "autoreview", "transcode-reset", "transcode-status", "collectionsaveasuserpage", "collectionsaveascommunitypage".
      # @return [self]
      def rights(*values)
        values.inject(self) { |res, val| res._rights(val) or fail ArgumentError, "Unknown value for rights: #{val}" }
      end

      # @private
      def _rights(value)
        defined?(super) && super || ["apihighlimits", "applychangetags", "autoconfirmed", "autocreateaccount", "autopatrol", "bigdelete", "block", "blockemail", "bot", "browsearchive", "changetags", "createaccount", "createpage", "createtalk", "delete", "deletechangetags", "deletedhistory", "deletedtext", "deletelogentry", "deleterevision", "edit", "editcontentmodel", "editinterface", "editprotected", "editmyoptions", "editmyprivateinfo", "editmyusercss", "editmyuserjs", "editmywatchlist", "editsemiprotected", "editusercss", "edituserjs", "hideuser", "import", "importupload", "ipblock-exempt", "managechangetags", "markbotedits", "mergehistory", "minoredit", "move", "movefile", "move-categorypages", "move-rootuserpages", "move-subpages", "nominornewtalk", "noratelimit", "override-export-depth", "pagelang", "patrol", "patrolmarks", "protect", "purge", "read", "reupload", "reupload-own", "reupload-shared", "rollback", "sendemail", "siteadmin", "suppressionlog", "suppressredirect", "suppressrevision", "unblockself", "undelete", "unwatchedpages", "upload", "upload_by_url", "userrights", "userrights-interwiki", "viewmyprivateinfo", "viewmywatchlist", "viewsuppressed", "writeapi", "spamblacklistlog", "tboverride", "tboverride-account", "titleblacklistlog", "gadgets-edit", "gadgets-definition-edit", "globalblock", "globalblock-whitelist", "globalblock-exempt", "securepoll-create-poll", "renameuser", "nuke", "torunblocked", "skipcaptcha", "override-antispoof", "centralauth-merge", "centralauth-unmerge", "centralauth-lock", "centralauth-oversight", "globalgrouppermissions", "globalgroupmembership", "centralauth-rename", "centralauth-usermerge", "abusefilter-modify", "abusefilter-log-detail", "abusefilter-view", "abusefilter-log", "abusefilter-private", "abusefilter-modify-restricted", "abusefilter-revert", "abusefilter-view-private", "abusefilter-log-private", "abusefilter-hidden-log", "abusefilter-hide-log", "abusefilter-modify-global", "massmessage", "vipsscaler-test", "ep-org", "ep-course", "ep-token", "ep-enroll", "ep-remstudent", "ep-online", "ep-campus", "ep-instructor", "ep-beonline", "ep-becampus", "ep-beinstructor", "ep-bereviewer", "ep-remreviewer", "ep-bulkdelorgs", "ep-bulkdelcourses", "ep-remarticle", "ep-addstudent", "usermerge", "mwoauthproposeconsumer", "mwoauthupdateownconsumer", "mwoauthmanageconsumer", "mwoauthsuppress", "mwoauthviewsuppressed", "mwoauthviewprivate", "mwoauthmanagemygrants", "oathauth-enable", "oathauth-api-all", "checkuser", "checkuser-log", "autoreviewrestore", "stablesettings", "review", "unreviewedpages", "movestable", "validate", "templateeditor", "editeditorprotected", "editextendedsemiprotected", "extendedconfirmed", "flow-create-board", "flow-edit-post", "flow-suppress", "flow-hide", "flow-delete", "viewdeletedfile", "autoreview", "transcode-reset", "transcode-status", "collectionsaveasuserpage", "collectionsaveascommunitypage"].include?(value.to_s) && merge(pcrights: value.to_s)
      end

      # Exclude users having the given rights. Does not include rights granted by implicit or auto-promoted groups like *, user, or autoconfirmed.
      #
      # @param values [Array<String>] Allowed values: "apihighlimits", "applychangetags", "autoconfirmed", "autocreateaccount", "autopatrol", "bigdelete", "block", "blockemail", "bot", "browsearchive", "changetags", "createaccount", "createpage", "createtalk", "delete", "deletechangetags", "deletedhistory", "deletedtext", "deletelogentry", "deleterevision", "edit", "editcontentmodel", "editinterface", "editprotected", "editmyoptions", "editmyprivateinfo", "editmyusercss", "editmyuserjs", "editmywatchlist", "editsemiprotected", "editusercss", "edituserjs", "hideuser", "import", "importupload", "ipblock-exempt", "managechangetags", "markbotedits", "mergehistory", "minoredit", "move", "movefile", "move-categorypages", "move-rootuserpages", "move-subpages", "nominornewtalk", "noratelimit", "override-export-depth", "pagelang", "patrol", "patrolmarks", "protect", "purge", "read", "reupload", "reupload-own", "reupload-shared", "rollback", "sendemail", "siteadmin", "suppressionlog", "suppressredirect", "suppressrevision", "unblockself", "undelete", "unwatchedpages", "upload", "upload_by_url", "userrights", "userrights-interwiki", "viewmyprivateinfo", "viewmywatchlist", "viewsuppressed", "writeapi", "spamblacklistlog", "tboverride", "tboverride-account", "titleblacklistlog", "gadgets-edit", "gadgets-definition-edit", "globalblock", "globalblock-whitelist", "globalblock-exempt", "securepoll-create-poll", "renameuser", "nuke", "torunblocked", "skipcaptcha", "override-antispoof", "centralauth-merge", "centralauth-unmerge", "centralauth-lock", "centralauth-oversight", "globalgrouppermissions", "globalgroupmembership", "centralauth-rename", "centralauth-usermerge", "abusefilter-modify", "abusefilter-log-detail", "abusefilter-view", "abusefilter-log", "abusefilter-private", "abusefilter-modify-restricted", "abusefilter-revert", "abusefilter-view-private", "abusefilter-log-private", "abusefilter-hidden-log", "abusefilter-hide-log", "abusefilter-modify-global", "massmessage", "vipsscaler-test", "ep-org", "ep-course", "ep-token", "ep-enroll", "ep-remstudent", "ep-online", "ep-campus", "ep-instructor", "ep-beonline", "ep-becampus", "ep-beinstructor", "ep-bereviewer", "ep-remreviewer", "ep-bulkdelorgs", "ep-bulkdelcourses", "ep-remarticle", "ep-addstudent", "usermerge", "mwoauthproposeconsumer", "mwoauthupdateownconsumer", "mwoauthmanageconsumer", "mwoauthsuppress", "mwoauthviewsuppressed", "mwoauthviewprivate", "mwoauthmanagemygrants", "oathauth-enable", "oathauth-api-all", "checkuser", "checkuser-log", "autoreviewrestore", "stablesettings", "review", "unreviewedpages", "movestable", "validate", "templateeditor", "editeditorprotected", "editextendedsemiprotected", "extendedconfirmed", "flow-create-board", "flow-edit-post", "flow-suppress", "flow-hide", "flow-delete", "viewdeletedfile", "autoreview", "transcode-reset", "transcode-status", "collectionsaveasuserpage", "collectionsaveascommunitypage".
      # @return [self]
      def excluderights(*values)
        values.inject(self) { |res, val| res._excluderights(val) or fail ArgumentError, "Unknown value for excluderights: #{val}" }
      end

      # @private
      def _excluderights(value)
        defined?(super) && super || ["apihighlimits", "applychangetags", "autoconfirmed", "autocreateaccount", "autopatrol", "bigdelete", "block", "blockemail", "bot", "browsearchive", "changetags", "createaccount", "createpage", "createtalk", "delete", "deletechangetags", "deletedhistory", "deletedtext", "deletelogentry", "deleterevision", "edit", "editcontentmodel", "editinterface", "editprotected", "editmyoptions", "editmyprivateinfo", "editmyusercss", "editmyuserjs", "editmywatchlist", "editsemiprotected", "editusercss", "edituserjs", "hideuser", "import", "importupload", "ipblock-exempt", "managechangetags", "markbotedits", "mergehistory", "minoredit", "move", "movefile", "move-categorypages", "move-rootuserpages", "move-subpages", "nominornewtalk", "noratelimit", "override-export-depth", "pagelang", "patrol", "patrolmarks", "protect", "purge", "read", "reupload", "reupload-own", "reupload-shared", "rollback", "sendemail", "siteadmin", "suppressionlog", "suppressredirect", "suppressrevision", "unblockself", "undelete", "unwatchedpages", "upload", "upload_by_url", "userrights", "userrights-interwiki", "viewmyprivateinfo", "viewmywatchlist", "viewsuppressed", "writeapi", "spamblacklistlog", "tboverride", "tboverride-account", "titleblacklistlog", "gadgets-edit", "gadgets-definition-edit", "globalblock", "globalblock-whitelist", "globalblock-exempt", "securepoll-create-poll", "renameuser", "nuke", "torunblocked", "skipcaptcha", "override-antispoof", "centralauth-merge", "centralauth-unmerge", "centralauth-lock", "centralauth-oversight", "globalgrouppermissions", "globalgroupmembership", "centralauth-rename", "centralauth-usermerge", "abusefilter-modify", "abusefilter-log-detail", "abusefilter-view", "abusefilter-log", "abusefilter-private", "abusefilter-modify-restricted", "abusefilter-revert", "abusefilter-view-private", "abusefilter-log-private", "abusefilter-hidden-log", "abusefilter-hide-log", "abusefilter-modify-global", "massmessage", "vipsscaler-test", "ep-org", "ep-course", "ep-token", "ep-enroll", "ep-remstudent", "ep-online", "ep-campus", "ep-instructor", "ep-beonline", "ep-becampus", "ep-beinstructor", "ep-bereviewer", "ep-remreviewer", "ep-bulkdelorgs", "ep-bulkdelcourses", "ep-remarticle", "ep-addstudent", "usermerge", "mwoauthproposeconsumer", "mwoauthupdateownconsumer", "mwoauthmanageconsumer", "mwoauthsuppress", "mwoauthviewsuppressed", "mwoauthviewprivate", "mwoauthmanagemygrants", "oathauth-enable", "oathauth-api-all", "checkuser", "checkuser-log", "autoreviewrestore", "stablesettings", "review", "unreviewedpages", "movestable", "validate", "templateeditor", "editeditorprotected", "editextendedsemiprotected", "extendedconfirmed", "flow-create-board", "flow-edit-post", "flow-suppress", "flow-hide", "flow-delete", "viewdeletedfile", "autoreview", "transcode-reset", "transcode-status", "collectionsaveasuserpage", "collectionsaveascommunitypage"].include?(value.to_s) && merge(pcexcluderights: value.to_s)
      end

      # How many contributors to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(pclimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(pccontinue: value.to_s)
      end
    end
  end
end
