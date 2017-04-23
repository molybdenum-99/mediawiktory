# Send a thank-you notification to an editor.
#
# Usage:
#
# ```ruby
# api.thank(**options).perform # returns string with raw output
# # or
# api.thank(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.thank.rev(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Thank < GetAction
  # Revision ID to thank someone for.
  #
  # @param value [Integer]
  # @return [self]
  def rev(value)
    merge(rev: value.to_s)
  end
  # A "csrf" token retrieved from action=query&meta=tokens
  #
  # @param value [String]
  # @return [self]
  def token(value)
    merge(token: value.to_s)
  end
  # A short string describing the source of the request, for example diff or history.
  #
  # @param value [String]
  # @return [self]
  def source(value)
    merge(source: value.to_s)
  end

end