# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Lists the most viewed pages (based on last day's pageview count). 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.mostviewed(**options).perform # returns string with raw output
    # # or
    # api.some_action.mostviewed(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.mostviewed.metric(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Mostviewed

      # The metric to use for counting views. Depending on what backend is used, not all metrics might be supported. You can use the siteinfo API (action=query&meta=siteinfo) to check, under pageviewservice-supported-metrics / <module name>
      #
      # @param value [String] One of "pageviews" (Plain pageviews).
      # @return [self]
      def metric(value)
        merge(pvimmetric: value.to_s)
      end

      # The number of pages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(pvimlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def offset(value)
        merge(pvimoffset: value.to_s)
      end
    end
  end
end
