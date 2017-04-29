# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Return associated projects and assessments for the given pages. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.pageassessments(**options).perform # returns string with raw output
    # # or
    # api.some_action.pageassessments(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.pageassessments.continue(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
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
