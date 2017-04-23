# Get the stats for page triage.
#
# Usage:
#
# ```ruby
# api.pagetriagestats(**options).perform # returns string with raw output
# # or
# api.pagetriagestats(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.pagetriagestats.namespace(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Pagetriagestats < GetAction
  # What namespace to pull stats from.
  #
  # @param value [Integer]
  # @return [self]
  def namespace(value)
    merge(namespace: value.to_s)
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

end