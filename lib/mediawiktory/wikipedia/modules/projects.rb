# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all the projects. 
    #
    # The module is included in action after setting some param, providing additional tweaking for
    # this param. Example:
    #
    # ```ruby
    # api.query             # returns Actions::Query
    #    .prop(:revisions)  # adds prop=revisions to action URL, and includes Modules::Revisions into action
    #    .limit(10)         # method of Modules::Revisions, adds rvlimit=10 to URL
    # ```
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
