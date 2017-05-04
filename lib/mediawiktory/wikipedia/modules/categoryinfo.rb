# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns information about the given categories. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Categoryinfo

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(cicontinue: value.to_s)
      end
    end
  end
end
