module MediaWiktory::Wikipedia::Modules
  # Gets tokens for data-modifying actions. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.tokens(**options).perform # returns string with raw output
  # # or
  # api.some_action.tokens(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.tokens.type(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Tokens < MediaWiktory::Submodule
    # Types of token to request.
    #
    # @param values [Array<String>] Allowed values: "createaccount", "csrf", "deleteglobalaccount", "login", "patrol", "rollback", "setglobalaccountstatus", "userrights", "watch".
    # @return [self]
    def type(*values)
      merge(type: values.join('|'))
    end

  end
end