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
# api.userrights.user(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Userrights < GetAction
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
    merge(add: values.join('|'))
  end
  # Remove the user from these groups.
  #
  # @param values [Array<String>] Allowed values: "bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor".
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
For compatibility, the token used in the web UI is also accepted.
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
    merge(tags: values.join('|'))
  end

end