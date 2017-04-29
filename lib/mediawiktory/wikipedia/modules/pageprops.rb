# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get various page properties defined in the page content. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.pageprops(**options).perform # returns string with raw output
    # # or
    # api.some_action.pageprops(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.pageprops.continue(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Pageprops

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(ppcontinue: value.to_s)
      end

      # Only list these page properties (action=query&list=pagepropnames returns page property names in use). Useful for checking whether pages use a certain page property.
      #
      # @param values [Array<String>]
      # @return [self]
      def prop(*values)
        merge(ppprop: values.join('|'))
      end
    end
  end
end
