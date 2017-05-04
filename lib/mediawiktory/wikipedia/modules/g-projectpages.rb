# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
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
        values.inject(self) { |res, val| res.projects_single(val) }
      end

      protected def projects_single(value)
        merge(gwppprojects: value.to_s)
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
