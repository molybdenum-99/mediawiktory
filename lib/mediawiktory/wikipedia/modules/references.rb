# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Return a data representation of references associated with the given pages. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module References

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(rfcontinue: value.to_s)
      end
    end
  end
end
