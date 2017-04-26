# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Serve autocomplete requests for the site field in MassMessage. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.mmsites(**options).perform # returns string with raw output
    # # or
    # api.some_action.mmsites(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.mmsites.term(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Mmsites

      # The prefix to search for.
      #
      # @param value [String]
      # @return [self]
      def term(value)
        merge(term: value.to_s)
      end
  end
  end
end
