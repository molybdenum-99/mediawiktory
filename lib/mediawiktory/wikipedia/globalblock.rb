# Globally block or unblock a user.
#
# Usage:
#
# ```ruby
# api.globalblock(**options).perform # returns string with raw output
# # or
# api.globalblock(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.globalblock.target(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Globalblock < GetAction
  # The target IP address.
  #
  # @param value [String]
  # @return [self]
  def target(value)
    merge(target: value.to_s)
  end
  # If specified, will block or reblock the user. Determines how long the block will last for, e.g. "5 months" or "2 weeks". If set to "infinite" or "indefinite" the block will never expire.
  #
  # @param value [String]
  # @return [self]
  def expiry(value)
    merge(expiry: value.to_s)
  end
  # If specified, will unblock the user.
  #
  # @param value [true, false]
  # @return [self]
  def unblock(value = true)
    merge(unblock: 'true') if value
  end
  # The reason for blocking/unblocking.
  #
  # @param value [String]
  # @return [self]
  def reason(value)
    merge(reason: value.to_s)
  end
  # Specify this if the block should only affect logged-out users.
  #
  # @param value [true, false]
  # @return [self]
  def anononly(value = true)
    merge(anononly: 'true') if value
  end
  # Specify this if the existing block on the target should be modified
  #
  # @param value [true, false]
  # @return [self]
  def modify(value = true)
    merge(modify: 'true') if value
  end
  # A "csrf" token retrieved from action=query&meta=tokens
  #
  # @param value [String]
  # @return [self]
  def token(value)
    merge(token: value.to_s)
  end

end