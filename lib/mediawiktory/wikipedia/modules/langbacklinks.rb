# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Find all pages that link to the given language link. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.langbacklinks(**options).perform # returns string with raw output
    # # or
    # api.some_action.langbacklinks(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.langbacklinks.lang(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Langbacklinks

    # Language for the language link.
    #
    # @param value [String]
    # @return [self]
    def lang(value)
      merge(lbllang: value.to_s)
    end

    # Language link to search for. Must be used with lbllang.
    #
    # @param value [String]
    # @return [self]
    def title(value)
      merge(lbltitle: value.to_s)
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(lblcontinue: value.to_s)
    end

    # How many total pages to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(lbllimit: value.to_s)
    end

    # Which properties to get:
    #
    # @param values [Array<String>] Allowed values: "lllang" (Adds the language code of the language link), "lltitle" (Adds the title of the language link).
    # @return [self]
    def prop(*values)
      merge(lblprop: values.join('|'))
    end

    # The direction in which to list.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(lbldir: value.to_s)
    end
  end
  end
end
