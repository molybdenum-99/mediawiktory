# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all pages associated with one or more projects. _Generator module: for fetching pages corresponding to request._
    #
    # The "submodule" (MediaWiki API term) is included in action after setting some param, providing
    # additional tweaking for this param. Example (for {MediaWiktory::Wikipedia::Actions::Query} and
    # its submodules):
    #
    # ```ruby
    # api.query             # returns Actions::Query
    #    .prop(:revisions)  # adds prop=revisions to action URL, and includes Modules::Revisions into action
    #    .limit(10)         # method of Modules::Revisions, adds rvlimit=10 to URL
    # ```
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GProjectpages

      # Also return assessments for the pages returned.
      #
      # @return [self]
      def assessments()
        merge(gwppassessments: 'true')
      end

      # The projects to list pages for. If this parameter is omitted, all projects will be included.
      #
      # @param values [Array<String>]
      # @return [self]
      def projects(*values)
        values.inject(self) { |res, val| res._projects(val) }
      end

      # @private
      def _projects(value)
        merge(gwppprojects: value.to_s, replace: false)
      end

      # The maximum number of pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gwpplimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gwppcontinue: value.to_s)
      end
    end
  end
end
