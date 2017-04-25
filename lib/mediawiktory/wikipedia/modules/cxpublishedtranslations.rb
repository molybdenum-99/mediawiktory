# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Fetch all published translations information. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.cxpublishedtranslations(**options).perform # returns string with raw output
    # # or
    # api.some_action.cxpublishedtranslations(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.cxpublishedtranslations.from(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Cxpublishedtranslations

    # The source language code.
    #
    # @param value [String]
    # @return [self]
    def from(value)
      merge(from: value.to_s)
    end

    # The target language code.
    #
    # @param value [String]
    # @return [self]
    def to(value)
      merge(to: value.to_s)
    end

    # The maximum number of translations to fetch.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(limit: value.to_s)
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def offset(value)
      merge(offset: value.to_s)
    end
  end
  end
end
