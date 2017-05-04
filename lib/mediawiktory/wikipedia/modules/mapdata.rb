# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Request all map data from the page Metallica 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Mapdata

      # Pipe-separated groups to return data for
      #
      # @param value [String]
      # @return [self]
      def groups(value)
        merge(mpdgroups: value.to_s)
      end

      # Data for how many pages to return
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(mpdlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def continue(value)
        merge(mpdcontinue: value.to_s)
      end
    end
  end
end
