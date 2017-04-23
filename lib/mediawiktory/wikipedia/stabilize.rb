# Configure review-protection settings for a page.
#
# Usage:
#
# ```ruby
# api.stabilize(**options).perform # returns string with raw output
# # or
# api.stabilize(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.stabilize.protectlevel(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Stabilize < GetAction
  # The review-protection level.
  #
  # @param value [String] One of "autoconfirmed", "none".
  # @return [self]
  def protectlevel(value)
    merge(protectlevel: value.to_s)
  end
  # Review-protection expiry.
  #
  # @param value [String]
  # @return [self]
  def expiry(value)
    merge(expiry: value.to_s)
  end
  # Reason.
  #
  # @param value [String]
  # @return [self]
  def reason(value)
    merge(reason: value.to_s)
  end
  # Watch this page.
  #
  # @param value [String]
  # @return [self]
  def watch(value)
    merge(watch: value.to_s)
  end
  # A "csrf" token retrieved from action=query&meta=tokens
  #
  # @param value [String]
  # @return [self]
  def token(value)
    merge(token: value.to_s)
  end
  # Title of the page to be review-protected.
  #
  # @param value [String]
  # @return [self]
  def title(value)
    merge(title: value.to_s)
  end

end