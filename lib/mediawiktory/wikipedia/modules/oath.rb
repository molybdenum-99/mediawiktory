# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Check to see if two-factor authentication (OATH) is enabled for a user. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Oath

      # User to get information about. Defaults to the current user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(oathuser: value.to_s)
      end
    end
  end
end
