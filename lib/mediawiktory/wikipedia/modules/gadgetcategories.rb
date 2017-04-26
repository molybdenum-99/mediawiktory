# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns a list of gadget categories. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.gadgetcategories(**options).perform # returns string with raw output
    # # or
    # api.some_action.gadgetcategories(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.gadgetcategories.prop(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Gadgetcategories

      # What gadget category information to get:
      #
      # @param values [Array<String>] Allowed values: "name" (Internal category name), "title" (Category title), "members" (Number of gadgets in category).
      # @return [self]
      def prop(*values)
        merge(gcprop: values.join('|'))
      end

      # Names of categories to retrieve.
      #
      # @param values [Array<String>]
      # @return [self]
      def names(*values)
        merge(gcnames: values.join('|'))
      end
  end
  end
end
