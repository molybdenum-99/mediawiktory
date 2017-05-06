# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all pages associated with one or more projects. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Projectpages

      # Also return assessments for the pages returned.
      #
      # @return [self]
      def assessments()
        merge(wppassessments: 'true')
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
        merge(wppprojects: value.to_s)
      end

      # The maximum number of pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(wpplimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(wppcontinue: value.to_s)
      end
    end
  end
end
