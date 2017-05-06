# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get a summary of logged API feature usages for a user agent. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Featureusage

      # Start of date range to query.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(afustart: value.iso8601)
      end

      # End of date range to query.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(afuend: value.iso8601)
      end

      # User agent to query. If not specified, the agent in the request will be queried.
      #
      # @param value [String]
      # @return [self]
      def agent(value)
        merge(afuagent: value.to_s)
      end

      # If specified, return details on only these features.
      #
      # @param values [Array<String>]
      # @return [self]
      def features(*values)
        values.inject(self) { |res, val| res._features(val) }
      end

      # @private
      def _features(value)
        merge(afufeatures: value.to_s)
      end
    end
  end
end
