# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Shows sitewide pageview data (daily pageview totals for each of the last pvisdays days). The result format is date (Ymd) => count. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.siteviews(**options).perform # returns string with raw output
    # # or
    # api.some_action.siteviews(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.siteviews.metric(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Siteviews

      # The metric to use for counting views. Depending on what backend is used, not all metrics might be supported. You can use the siteinfo API (action=query&meta=siteinfo) to check, under pageviewservice-supported-metrics / <module name>
      #
      # @param value [String] One of "pageviews" (Plain pageviews), "uniques" (Unique visitors).
      # @return [self]
      def metric(value)
        merge(pvismetric: value.to_s)
      end

      # The number of days to show.
      #
      # @param value [Integer]
      # @return [self]
      def days(value)
        merge(pvisdays: value.to_s)
      end
    end
  end
end
