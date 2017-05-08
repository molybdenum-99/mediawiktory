# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Return associated projects and assessments for the given pages. 
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
    module Pageassessments

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(pacontinue: value.to_s)
      end

      # Limit for total number of projects returned (total for all pages).
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(palimit: value.to_s)
      end

      # Also return assessments by subprojects.
      #
      # @return [self]
      def subprojects()
        merge(pasubprojects: 'true')
      end
    end
  end
end
