# 
#
# Usage:
#
# ```ruby
# api.parsoid-batch(**options).perform # returns string with raw output
# # or
# api.parsoid-batch(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.parsoid-batch.batch(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Parsoid-batch < GetAction
  # 
  #
  # @param value [String]
  # @return [self]
  def batch(value)
    merge(batch: value.to_s)
  end

end