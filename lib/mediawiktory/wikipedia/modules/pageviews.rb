# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Shows per-page pageview data (the number of daily pageviews for each of the last pvipdays days). The result format is page title (with underscores) => date (Ymd) => count. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.pageviews(**options).perform # returns string with raw output
  # # or
  # api.some_action.pageviews(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.pageviews.metric(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Pageviews

    # The metric to use for counting views. Depending on what backend is used, not all metrics might be supported. You can use the siteinfo API (action=query&meta=siteinfo) to check, under pageviewservice-supported-metrics / <module name>
    #
    # @param value [String] One of "pageviews" (Plain pageviews).
    # @return [self]
    def metric(value)
      merge(pvipmetric: value.to_s)
    end

    # The number of days to show.
    #
    # @param value [Integer]
    # @return [self]
    def days(value)
      merge(pvipdays: value.to_s)
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(pvipcontinue: value.to_s)
    end
  end
end
