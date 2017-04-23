# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # List all pages using a given page property. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.pageswithprop(**options).perform # returns string with raw output
  # # or
  # api.some_action.pageswithprop(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.pageswithprop.propname(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Pageswithprop
    # Page property for which to enumerate pages (action=query&list=pagepropnames returns page property names in use).
    #
    # @param value [String]
    # @return [self]
    def propname(value)
      merge(pwppropname: value.to_s)
    end
    # Which pieces of information to include:
    #
    # @param values [Array<String>] Allowed values: "ids" (Adds the page ID), "title" (Adds the title and namespace ID of the page), "value" (Adds the value of the page property).
    # @return [self]
    def prop(*values)
      merge(pwpprop: values.join('|'))
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(pwpcontinue: value.to_s)
    end
    # The maximum number of pages to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(pwplimit: value.to_s)
    end
    # In which direction to sort.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(pwpdir: value.to_s)
    end
  end
end
