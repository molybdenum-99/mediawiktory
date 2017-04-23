# Get a list of page IDs for building a PageTriage queue.
#
# Usage:
#
# ```ruby
# api.pagetriagelist(**options).perform # returns string with raw output
# # or
# api.pagetriagelist(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.pagetriagelist.page_id(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Pagetriagelist < GetAction
  # Return data for the specified page IDs, ignoring other parameters.
  #
  # @param value [Integer]
  # @return [self]
  def page_id(value)
    merge(page_id: value.to_s)
  end
  # Whether to show only bot edits.
  #
  # @param value [true, false]
  # @return [self]
  def showbots(value = true)
    merge(showbots: 'true') if value
  end
  # Whether to include redirects.
  #
  # @param value [true, false]
  # @return [self]
  def showredirs(value = true)
    merge(showredirs: 'true') if value
  end
  # Whether to include reviewed.
  #
  # @param value [true, false]
  # @return [self]
  def showreviewed(value = true)
    merge(showreviewed: 'true') if value
  end
  # Whether to include unreviewed.
  #
  # @param value [true, false]
  # @return [self]
  def showunreviewed(value = true)
    merge(showunreviewed: 'true') if value
  end
  # Whether to include "proposed for deleted".
  #
  # @param value [true, false]
  # @return [self]
  def showdeleted(value = true)
    merge(showdeleted: 'true') if value
  end
  # The maximum number of results to return.
  #
  # @param value [Integer]
  # @return [self]
  def limit(value)
    merge(limit: value.to_s)
  end
  # Timestamp to start from.
  #
  # @param value [Integer]
  # @return [self]
  def offset(value)
    merge(offset: value.to_s)
  end
  # Page ID to start from (requires offset param to be passed as well).
  #
  # @param value [Integer]
  # @return [self]
  def pageoffset(value)
    merge(pageoffset: value.to_s)
  end
  # The direction the list should be sorted in - oldestfirst or newestfirst.
  #
  # @param value [String]
  # @return [self]
  def dir(value)
    merge(dir: value.to_s)
  end
  # What namespace to pull pages from.
  #
  # @param value [Integer]
  # @return [self]
  def namespace(value)
    merge(namespace: value.to_s)
  end
  # Whether to show only pages with no category.
  #
  # @param value [true, false]
  # @return [self]
  def no_category(value = true)
    merge(no_category: 'true') if value
  end
  # Whether to show only pages with no inbound links.
  #
  # @param value [true, false]
  # @return [self]
  def no_inbound_links(value = true)
    merge(no_inbound_links: 'true') if value
  end
  # Whether to show only pages created by non auto confirmed users.
  #
  # @param value [true, false]
  # @return [self]
  def non_autoconfirmed_users(value = true)
    merge(non_autoconfirmed_users: 'true') if value
  end
  # Whether to show only pages created by blocked users.
  #
  # @param value [true, false]
  # @return [self]
  def blocked_users(value = true)
    merge(blocked_users: 'true') if value
  end
  # Show only pages created by username.
  #
  # @param value [String]
  # @return [self]
  def username(value)
    merge(username: value.to_s)
  end

end