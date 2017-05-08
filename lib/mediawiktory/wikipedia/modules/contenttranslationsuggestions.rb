# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get suggestion lists for Content Translation. 
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
    module Contenttranslationsuggestions

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

      # Return suggestions only from a particular list
      #
      # @param value [String]
      # @return [self]
      def listid(value)
        merge(listid: value.to_s)
      end

      # The maximum number of translation suggestions to fetch.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(limit: value.to_s)
      end

      # Offset for paginated results.
      #
      # @param value [String]
      # @return [self]
      def offset(value)
        merge(offset: value.to_s)
      end

      # By default suggestions are returned in random order. If you wish to return each suggestion only once when using limit and offset, you must specify a seed for all the requests.
      #
      # @param value [Integer]
      # @return [self]
      def seed(value)
        merge(seed: value.to_s)
      end
    end
  end
end
