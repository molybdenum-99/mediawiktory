# Block a user.
#
# Usage:
#
# ```ruby
# api.block(**options).perform # returns string with raw output
# # or
# api.block(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.block.user(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Block < GetAction
  # Username, IP address, or IP address range to block. Cannot be used together with userid
  #
  # @param value [String]
  # @return [self]
  def user(value)
    merge(user: value.to_s)
  end
  # User ID to block. Cannot be used together with user.
  #
  # @param value [Integer]
  # @return [self]
  def userid(value)
    merge(userid: value.to_s)
  end
  # Expiry time. May be relative (e.g. 5 months or 2 weeks) or absolute (e.g. 2014-09-18T12:34:56Z). If set to infinite, indefinite, or never, the block will never expire.
  #
  # @param value [String]
  # @return [self]
  def expiry(value)
    merge(expiry: value.to_s)
  end
  # Reason for block.
  #
  # @param value [String]
  # @return [self]
  def reason(value)
    merge(reason: value.to_s)
  end
  # Block anonymous users only (i.e. disable anonymous edits for this IP address).
  #
  # @param value [true, false]
  # @return [self]
  def anononly(value = true)
    merge(anononly: 'true') if value
  end
  # Prevent account creation.
  #
  # @param value [true, false]
  # @return [self]
  def nocreate(value = true)
    merge(nocreate: 'true') if value
  end
  # Automatically block the last used IP address, and any subsequent IP addresses they try to login from.
  #
  # @param value [true, false]
  # @return [self]
  def autoblock(value = true)
    merge(autoblock: 'true') if value
  end
  # Prevent user from sending email through the wiki. (Requires the blockemail right).
  #
  # @param value [true, false]
  # @return [self]
  def noemail(value = true)
    merge(noemail: 'true') if value
  end
  # Hide the username from the block log. (Requires the hideuser right).
  #
  # @param value [true, false]
  # @return [self]
  def hidename(value = true)
    merge(hidename: 'true') if value
  end
  # Allow the user to edit their own talk page (depends on $wgBlockAllowsUTEdit).
  #
  # @param value [true, false]
  # @return [self]
  def allowusertalk(value = true)
    merge(allowusertalk: 'true') if value
  end
  # If the user is already blocked, overwrite the existing block.
  #
  # @param value [true, false]
  # @return [self]
  def reblock(value = true)
    merge(reblock: 'true') if value
  end
  # Watch the user's or IP address's user and talk pages.
  #
  # @param value [true, false]
  # @return [self]
  def watchuser(value = true)
    merge(watchuser: 'true') if value
  end
  # Change tags to apply to the entry in the block log.
  #
  # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
  # @return [self]
  def tags(*values)
    merge(tags: values.join('|'))
  end
  # A "csrf" token retrieved from action=query&meta=tokens
  #
  # @param value [String]
  # @return [self]
  def token(value)
    merge(token: value.to_s)
  end

end