# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Get tokens for data-modifying actions. 
    #
    # Usage:
    #

    # ```ruby
    # api.tokens(**options).perform # returns string with raw output
    # # or
    # api.tokens(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.tokens.type(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Tokens < MediaWiktory::Wikipedia::Actions::Get

      # Types of token to request.
      #
      # @param values [Array<String>] Allowed values: "block", "createaccount", "csrf", "delete", "deleteglobalaccount", "edit", "email", "import", "login", "move", "options", "patrol", "protect", "rollback", "setglobalaccountstatus", "unblock", "userrights", "watch".
      # @return [self]
      def type(*values)
        values.inject(self) { |res, val| res.type_single(val) }
      end

      # @private
      def type_single(value)
        defined?(super) && super || ["block", "createaccount", "csrf", "delete", "deleteglobalaccount", "edit", "email", "import", "login", "move", "options", "patrol", "protect", "rollback", "setglobalaccountstatus", "unblock", "userrights", "watch"].include?(value.to_s) && merge(type: value.to_s)
      end
    end
  end
end
