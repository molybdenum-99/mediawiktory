# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Serve autocomplete requests for the site field in MassMessage. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Mmsites

      # The prefix to search for.
      #
      # @param value [String]
      # @return [self]
      def term(value)
        merge(term: value.to_s)
      end
    end
  end
end
