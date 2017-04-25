# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # This API is for getting a list of one or more pages related to a particular GettingStarted task. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.gettingstartedgetpages(**options).perform # returns string with raw output
    # # or
    # api.some_action.gettingstartedgetpages(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.gettingstartedgetpages.taskname(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Gettingstartedgetpages

    # Task name, generally either "copyedit" (copy-editing suggestions) or "morelike" (pages similar to the base page/excluded title)
    #
    # @param value [String]
    # @return [self]
    def taskname(value)
      merge(gsgptaskname: value.to_s)
    end

    # Full title of a page to exclude from the list; also used as the base title for recommendations based on a given page
    #
    # @param value [String]
    # @return [self]
    def excludedtitle(value)
      merge(gsgpexcludedtitle: value.to_s)
    end

    # Requested count; will attempt to fetch this exact number, but may fetch fewer if no more are found after multiple attempts
    #
    # @param value [Integer]
    # @return [self]
    def count(value)
      merge(gsgpcount: value.to_s)
    end
  end
  end
end
