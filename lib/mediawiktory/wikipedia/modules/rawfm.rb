# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Output data, including debugging elements, in JSON format (pretty-print in HTML). 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Rawfm

      # Return the pretty-printed HTML and associated ResourceLoader modules as a JSON object.
      #
      # @return [self]
      def wrappedhtml()
        merge(wrappedhtml: 'true')
      end
    end
  end
end
