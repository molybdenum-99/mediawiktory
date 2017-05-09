# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # 
    #
    # Usage:
    #
    # ```ruby
    # api.parsoid-batch.batch(value).perform # returns string with raw output
    # # or
    # api.parsoid-batch.batch(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class ParsoidBatch < MediaWiktory::Wikipedia::Actions::Get

      # 
      #
      # @param value [String]
      # @return [self]
      def batch(value)
        merge(batch: value.to_s)
      end
    end
  end
end
