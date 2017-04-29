# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Query Content Translation database for numbers of translations by period of time. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.contenttranslationlangtrend(**options).perform # returns string with raw output
    # # or
    # api.some_action.contenttranslationlangtrend(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.contenttranslationlangtrend.source(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Contenttranslationlangtrend

      # The source language code.
      #
      # @param value [String]
      # @return [self]
      def source(value)
        merge(source: value.to_s)
      end

      # The target language code.
      #
      # @param value [String]
      # @return [self]
      def target(value)
        merge(target: value.to_s)
      end

      # The interval for calculating the trend. Can be week or month.
      #
      # @param value [String] One of "week", "month".
      # @return [self]
      def interval(value)
        merge(interval: value.to_s)
      end
    end
  end
end
