# Get tokens for data-modifying actions.
#
# This module is deprecated in favor of action=query&meta=tokens.
#
# Usage:
#
# ```ruby
# api.tokens(**options).perform # returns string with raw output
# # or
# api.tokens(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.tokens.type(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Tokens < GetAction
  # Types of token to request.
  #
  # @param values [Array<String>] Allowed values: "block", "createaccount", "csrf", "delete", "deleteglobalaccount", "edit", "email", "import", "login", "move", "options", "patrol", "protect", "rollback", "setglobalaccountstatus", "unblock", "userrights", "watch".
  # @return [self]
  def type(*values)
    merge(type: values.join('|'))
  end

end