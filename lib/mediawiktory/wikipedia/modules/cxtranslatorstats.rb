# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Fetch the translation statistics for the given user. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Cxtranslatorstats

      # The translator's user name. This parameter is optional. If not passed, the currently logged-in user will be used.
      #
      # @param value [String]
      # @return [self]
      def translator(value)
        merge(translator: value.to_s)
      end
    end
  end
end
