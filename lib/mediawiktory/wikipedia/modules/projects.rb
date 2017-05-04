# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all the projects. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Projects

      # Also include subprojects.
      #
      # @return [self]
      def subprojects()
        merge(pjsubprojects: 'true')
      end
    end
  end
end
