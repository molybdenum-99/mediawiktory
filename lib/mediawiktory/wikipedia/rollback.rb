# Undo the last edit to the page.
#
# If the last user who edited the page made multiple edits in a row, they will all be rolled back.
#
# Usage:
#
# ```ruby
# api.rollback(**options).perform # returns string with raw output
# # or
# api.rollback(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.rollback.title(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Rollback < GetAction
  # Title of the page to roll back. Cannot be used together with pageid.
  #
  # @param value [String]
  # @return [self]
  def title(value)
    merge(title: value.to_s)
  end
  # Page ID of the page to roll back. Cannot be used together with title.
  #
  # @param value [Integer]
  # @return [self]
  def pageid(value)
    merge(pageid: value.to_s)
  end
  # Tags to apply to the rollback.
  #
  # @param values [Array<String>] Allowed values: "ProveIt edit", "WPCleaner", "huggle", "large plot addition".
  # @return [self]
  def tags(*values)
    merge(tags: values.join('|'))
  end
  # Name of the user whose edits are to be rolled back.
  #
  # @param value [String]
  # @return [self]
  def user(value)
    merge(user: value.to_s)
  end
  # Custom edit summary. If empty, default summary will be used.
  #
  # @param value [String]
  # @return [self]
  def summary(value)
    merge(summary: value.to_s)
  end
  # Mark the reverted edits and the revert as bot edits.
  #
  # @param value [true, false]
  # @return [self]
  def markbot(value = true)
    merge(markbot: 'true') if value
  end
  # Unconditionally add or remove the page from the current user's watchlist, use preferences or do not change watch.
  #
  # @param value [String] One of "watch", "unwatch", "preferences", "nochange".
  # @return [self]
  def watchlist(value)
    merge(watchlist: value.to_s)
  end
  # A "rollback" token retrieved from action=query&meta=tokens
For compatibility, the token used in the web UI is also accepted.
  #
  # @param value [String]
  # @return [self]
  def token(value)
    merge(token: value.to_s)
  end

end