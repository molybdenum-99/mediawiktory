# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get information about what languages the user knows 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Babel

      # User to get information about
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(babuser: value.to_s)
      end
    end
  end
end
