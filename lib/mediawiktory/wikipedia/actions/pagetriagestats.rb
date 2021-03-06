# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Get the stats for page triage.
    #
    # Usage:
    #
    # ```ruby
    # api.pagetriagestats.namespace(value).perform # returns string with raw output
    # # or
    # api.pagetriagestats.namespace(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Pagetriagestats < MediaWiktory::Wikipedia::Actions::Get

      # What namespace to pull stats from.
      #
      # @param value [Integer]
      # @return [self]
      def namespace(value)
        merge(namespace: value.to_s)
      end

      # Whether to include redirects.
      #
      # @return [self]
      def showredirs()
        merge(showredirs: 'true')
      end

      # Whether to include reviewed.
      #
      # @return [self]
      def showreviewed()
        merge(showreviewed: 'true')
      end

      # Whether to include unreviewed.
      #
      # @return [self]
      def showunreviewed()
        merge(showunreviewed: 'true')
      end

      # Whether to include "proposed for deleted".
      #
      # @return [self]
      def showdeleted()
        merge(showdeleted: 'true')
      end
    end
  end
end
