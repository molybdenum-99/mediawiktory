# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Query Content Translation database for numbers of translations by period of time. 
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
        _interval(value) or fail ArgumentError, "Unknown value for interval: #{value}"
      end

      # @private
      def _interval(value)
        defined?(super) && super || ["week", "month"].include?(value.to_s) && merge(interval: value.to_s)
      end
    end
  end
end
