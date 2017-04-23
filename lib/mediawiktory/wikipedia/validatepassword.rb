# Validate a password against the wiki's password policies.
#
# Validity is reported as Good if the password is acceptable, Change if the password may be used for login but must be changed, or Invalid if the password is not usable.
#
# Usage:
#
# ```ruby
# api.validatepassword(**options).perform # returns string with raw output
# # or
# api.validatepassword(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.validatepassword.password(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Validatepassword < GetAction
  # Password to validate.
  #
  # @param value [String]
  # @return [self]
  def password(value)
    merge(password: value.to_s)
  end
  # User name, for use when testing account creation. The named user must not exist.
  #
  # @param value [String]
  # @return [self]
  def user(value)
    merge(user: value.to_s)
  end
  # Email address, for use when testing account creation.
  #
  # @param value [String]
  # @return [self]
  def email(value)
    merge(email: value.to_s)
  end
  # Real name, for use when testing account creation.
  #
  # @param value [String]
  # @return [self]
  def realname(value)
    merge(realname: value.to_s)
  end

end