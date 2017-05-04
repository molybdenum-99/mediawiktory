# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Output data in serialized PHP format (pretty-print in HTML). 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Phpfm

      # Return the pretty-printed HTML and associated ResourceLoader modules as a JSON object.
      #
      # @return [self]
      def wrappedhtml()
        merge(wrappedhtml: 'true')
      end

      # Output formatting:
      #
      # @param value [String] One of "1" (Backwards-compatible format (XML-style booleans, * keys for content nodes, etc.)), "2" (Experimental modern format. Details may change!), "latest" (Use the latest format (currently 2), may change without warning).
      # @return [self]
      def formatversion(value)
        defined?(super) && super || ["1", "2", "latest"].include?(value.to_s) && merge(formatversion: value.to_s)
      end
    end
  end
end
