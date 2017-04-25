# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Find all pages that link to the given interwiki link. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.iwbacklinks(**options).perform # returns string with raw output
    # # or
    # api.some_action.iwbacklinks(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.iwbacklinks.prefix(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Iwbacklinks

    # Prefix for the interwiki.
    #
    # @param value [String]
    # @return [self]
    def prefix(value)
      merge(iwblprefix: value.to_s)
    end

    # Interwiki link to search for. Must be used with iwblblprefix.
    #
    # @param value [String]
    # @return [self]
    def title(value)
      merge(iwbltitle: value.to_s)
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(iwblcontinue: value.to_s)
    end

    # How many total pages to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(iwbllimit: value.to_s)
    end

    # Which properties to get:
    #
    # @param values [Array<String>] Allowed values: "iwprefix" (Adds the prefix of the interwiki), "iwtitle" (Adds the title of the interwiki).
    # @return [self]
    def prop(*values)
      merge(iwblprop: values.join('|'))
    end

    # The direction in which to list.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(iwbldir: value.to_s)
    end
  end
  end
end
