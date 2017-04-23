# Change authentication data for the current user.
#
# Usage:
#
# ```ruby
# api.changeauthenticationdata(**options).perform # returns string with raw output
# # or
# api.changeauthenticationdata(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.changeauthenticationdata.request(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Changeauthenticationdata < GetAction
  # Use this authentication request, by the id returned from action=query&meta=authmanagerinfo with amirequestsfor=change.
  #
  # @param value [String]
  # @return [self]
  def request(value)
    merge(changeauthrequest: value.to_s)
  end
  # A "csrf" token retrieved from action=query&meta=tokens
  #
  # @param value [String]
  # @return [self]
  def token(value)
    merge(changeauthtoken: value.to_s)
  end
  # 
  #
  # @param value [String]
  # @return [self]
  def *(value)
    merge(*: value.to_s)
  end

end