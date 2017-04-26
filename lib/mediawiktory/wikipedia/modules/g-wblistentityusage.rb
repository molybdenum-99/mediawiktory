# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.wblistentityusage(**options).perform # returns string with raw output
    # # or
    # api.some_action.wblistentityusage(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.wblistentityusage.aspect(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GWblistentityusage

      # Only return entity IDs that used this aspect.
      #
      # @param values [Array<String>] Allowed values: "S", "L", "T", "X", "O".
      # @return [self]
      def aspect(*values)
        merge(gwbeuaspect: values.join('|'))
      end

      # Entities that have been used.
      #
      # @param values [Array<String>]
      # @return [self]
      def entities(*values)
        merge(gwbeuentities: values.join('|'))
      end

      # How many entity usages to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gwbeulimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gwbeucontinue: value.to_s)
      end
  end
  end
end
