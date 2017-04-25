# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns all pages that use the given entity IDs. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.wblistentityusage(**options).perform # returns string with raw output
    # # or
    # api.some_action.wblistentityusage(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.wblistentityusage.prop(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Wblistentityusage

    # Properties to add to the result.
    #
    # @param values [Array<String>] Allowed values: "url" (If enabled the url of the entity will be added to the result).
    # @return [self]
    def prop(*values)
      merge(wbeuprop: values.join('|'))
    end

    # Only return entity IDs that used this aspect.
    #
    # @param values [Array<String>] Allowed values: "S", "L", "T", "X", "O".
    # @return [self]
    def aspect(*values)
      merge(wbeuaspect: values.join('|'))
    end

    # Entities that have been used.
    #
    # @param values [Array<String>]
    # @return [self]
    def entities(*values)
      merge(wbeuentities: values.join('|'))
    end

    # How many entity usages to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(wbeulimit: value.to_s)
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(wbeucontinue: value.to_s)
    end
  end
  end
end
