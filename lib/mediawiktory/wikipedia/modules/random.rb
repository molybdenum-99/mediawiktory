# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get a set of random pages. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.random(**options).perform # returns string with raw output
    # # or
    # api.some_action.random(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.random.namespace(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Random

    # Return pages in these namespaces only.
    #
    # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(rnnamespace: values.join('|'))
    end

    # How to filter for redirects.
    #
    # @param value [String] One of "all", "redirects", "nonredirects".
    # @return [self]
    def filterredir(value)
      merge(rnfilterredir: value.to_s)
    end

    # Use rnfilterredir=redirects instead.
    #
    # @return [self]
    def redirect()
      merge(rnredirect: 'true')
    end

    # Limit how many random pages will be returned.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(rnlimit: value.to_s)
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(rncontinue: value.to_s)
    end
  end
  end
end
