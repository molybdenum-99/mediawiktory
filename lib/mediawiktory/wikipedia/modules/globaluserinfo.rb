# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Show information about a global user. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Globaluserinfo

      # User to get information about. Defaults to the current user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(guiuser: value.to_s)
      end

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "groups" (Get a list of global groups this user belongs to), "rights" (Get a list of global rights this user has), "merged" (Get a list of merged accounts), "unattached" (Get a list of unattached accounts), "editcount" (Get the user's global edit count).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      protected def prop_single(value)
        defined?(super) && super || ["groups", "rights", "merged", "unattached", "editcount"].include?(value.to_s) && merge(guiprop: value.to_s)
      end
    end
  end
end
