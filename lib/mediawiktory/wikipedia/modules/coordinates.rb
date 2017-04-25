# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns coordinates of the given pages. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.coordinates(**options).perform # returns string with raw output
    # # or
    # api.some_action.coordinates(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.coordinates.limit(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Coordinates

    # How many coordinates to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(colimit: value.to_s)
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(cocontinue: value.to_s)
    end

    # Which additional coordinate properties to return.
    #
    # @param values [Array<String>] Allowed values: "type", "name", "dim", "country", "region", "globe".
    # @return [self]
    def prop(*values)
      merge(coprop: values.join('|'))
    end

    # Whether to return only primary coordinates ("primary"), secondary ("secondary") or both ("all").
    #
    # @param value [String] One of "primary", "secondary", "all".
    # @return [self]
    def primary(value)
      merge(coprimary: value.to_s)
    end

    # Return distance in meters from the geographical coordinates of every valid result from the given coordinates.
    #
    # @param value [String]
    # @return [self]
    def distancefrompoint(value)
      merge(codistancefrompoint: value.to_s)
    end

    # Return distance in meters from the geographical coordinates of every valid result from the coordinates of this page.
    #
    # @param value [String]
    # @return [self]
    def distancefrompage(value)
      merge(codistancefrompage: value.to_s)
    end
  end
  end
end
