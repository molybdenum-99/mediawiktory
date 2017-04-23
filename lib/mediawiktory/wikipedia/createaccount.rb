# Create a new user account.
#
# The general procedure to use this module is:
#
# Usage:
#
# ```ruby
# api.createaccount(**options).perform # returns string with raw output
# # or
# api.createaccount(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.createaccount.requests(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Createaccount < GetAction
  # Only use these authentication requests, by the id returned from action=query&meta=authmanagerinfo with amirequestsfor=create or from a previous response from this module.
  #
  # @param values [Array<String>]
  # @return [self]
  def requests(*values)
    merge(createrequests: values.join('|'))
  end
  # Format to use for returning messages.
  #
  # @param value [String] One of "html", "wikitext", "raw", "none".
  # @return [self]
  def messageformat(value)
    merge(createmessageformat: value.to_s)
  end
  # Merge field information for all authentication requests into one array.
  #
  # @param value [true, false]
  # @return [self]
  def mergerequestfields(value = true)
    merge(createmergerequestfields: 'true') if value
  end
  # Preserve state from a previous failed login attempt, if possible.
If action=query&meta=authmanagerinfo returned true for hasprimarypreservedstate, requests marked as primary-required should be omitted. If it returned a non-empty value for preservedusername, that username must be used for the username parameter.
  #
  # @param value [true, false]
  # @return [self]
  def preservestate(value = true)
    merge(createpreservestate: 'true') if value
  end
  # Return URL for third-party authentication flows, must be absolute. Either this or createcontinue is required.
Upon receiving a REDIRECT response, you will typically open a browser or web view to the specified redirecttarget URL for a third-party authentication flow. When that completes, the third party will send the browser or web view to this URL. You should extract any query or POST parameters from the URL and pass them as a createcontinue request to this API module.
  #
  # @param value [String]
  # @return [self]
  def returnurl(value)
    merge(createreturnurl: value.to_s)
  end
  # This request is a continuation after an earlier UI or REDIRECT response. Either this or createreturnurl is required.
  #
  # @param value [true, false]
  # @return [self]
  def continue(value = true)
    merge(createcontinue: 'true') if value
  end
  # A "createaccount" token retrieved from action=query&meta=tokens
  #
  # @param value [String]
  # @return [self]
  def token(value)
    merge(createtoken: value.to_s)
  end
  # 
  #
  # @param value [String]
  # @return [self]
  def *(value)
    merge(*: value.to_s)
  end

end