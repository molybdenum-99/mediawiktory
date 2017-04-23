# Log in and get authentication cookies.
#
# This action should only be used in combination with Special:BotPasswords; use for main-account login is deprecated and may fail without warning. To safely log in to the main account, use action=clientlogin.
#
# Usage:
#
# ```ruby
# api.login(**options).perform # returns string with raw output
# # or
# api.login(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.login.name(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Login < GetAction
  # User name.
  #
  # @param value [String]
  # @return [self]
  def name(value)
    merge(lgname: value.to_s)
  end
  # Password.
  #
  # @param value [String]
  # @return [self]
  def password(value)
    merge(lgpassword: value.to_s)
  end
  # Domain (optional).
  #
  # @param value [String]
  # @return [self]
  def domain(value)
    merge(lgdomain: value.to_s)
  end
  # A "login" token retrieved from action=query&meta=tokens
  #
  # @param value [String]
  # @return [self]
  def token(value)
    merge(lgtoken: value.to_s)
  end

end