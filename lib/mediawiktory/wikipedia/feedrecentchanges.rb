# Returns a recent changes feed.
#
# Usage:
#
# ```ruby
# api.feedrecentchanges(**options).perform # returns string with raw output
# # or
# api.feedrecentchanges(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.feedrecentchanges.feedformat(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Feedrecentchanges < GetAction
  # The format of the feed.
  #
  # @param value [String] One of "rss", "atom".
  # @return [self]
  def feedformat(value)
    merge(feedformat: value.to_s)
  end
  # Namespace to limit the results to.
  #
  # @param value [String] One of "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  # @return [self]
  def namespace(value)
    merge(namespace: value.to_s)
  end
  # All namespaces but the selected one.
  #
  # @param value [true, false]
  # @return [self]
  def invert(value = true)
    merge(invert: 'true') if value
  end
  # Include associated (talk or main) namespace.
  #
  # @param value [true, false]
  # @return [self]
  def associated(value = true)
    merge(associated: 'true') if value
  end
  # Days to limit the results to.
  #
  # @param value [Integer]
  # @return [self]
  def days(value)
    merge(days: value.to_s)
  end
  # Maximum number of results to return.
  #
  # @param value [Integer]
  # @return [self]
  def limit(value)
    merge(limit: value.to_s)
  end
  # Show changes since then.
  #
  # @param value [Time]
  # @return [self]
  def from(value)
    merge(from: value.iso8601)
  end
  # Hide minor changes.
  #
  # @param value [true, false]
  # @return [self]
  def hideminor(value = true)
    merge(hideminor: 'true') if value
  end
  # Hide changes made by bots.
  #
  # @param value [true, false]
  # @return [self]
  def hidebots(value = true)
    merge(hidebots: 'true') if value
  end
  # Hide changes made by anonymous users.
  #
  # @param value [true, false]
  # @return [self]
  def hideanons(value = true)
    merge(hideanons: 'true') if value
  end
  # Hide changes made by registered users.
  #
  # @param value [true, false]
  # @return [self]
  def hideliu(value = true)
    merge(hideliu: 'true') if value
  end
  # Hide patrolled changes.
  #
  # @param value [true, false]
  # @return [self]
  def hidepatrolled(value = true)
    merge(hidepatrolled: 'true') if value
  end
  # Hide changes made by the current user.
  #
  # @param value [true, false]
  # @return [self]
  def hidemyself(value = true)
    merge(hidemyself: 'true') if value
  end
  # Hide category membership changes.
  #
  # @param value [true, false]
  # @return [self]
  def hidecategorization(value = true)
    merge(hidecategorization: 'true') if value
  end
  # Filter by tag.
  #
  # @param value [String]
  # @return [self]
  def tagfilter(value)
    merge(tagfilter: value.to_s)
  end
  # Show only changes on pages linked from this page.
  #
  # @param value [String]
  # @return [self]
  def target(value)
    merge(target: value.to_s)
  end
  # Show changes on pages linked to the selected page instead.
  #
  # @param value [true, false]
  # @return [self]
  def showlinkedto(value = true)
    merge(showlinkedto: 'true') if value
  end

end