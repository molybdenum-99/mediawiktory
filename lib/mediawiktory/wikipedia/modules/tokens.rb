# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Gets tokens for data-modifying actions. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Tokens

      # Types of token to request.
      #
      # @param values [Array<String>] Allowed values: "createaccount", "csrf", "deleteglobalaccount", "login", "patrol", "rollback", "setglobalaccountstatus", "userrights", "watch".
      # @return [self]
      def type(*values)
        values.inject(self) { |res, val| res._type(val) or fail ArgumentError, "Unknown value for type: #{val}" }
      end

      # @private
      def _type(value)
        defined?(super) && super || ["createaccount", "csrf", "deleteglobalaccount", "login", "patrol", "rollback", "setglobalaccountstatus", "userrights", "watch"].include?(value.to_s) && merge(type: value.to_s)
      end
    end
  end
end
