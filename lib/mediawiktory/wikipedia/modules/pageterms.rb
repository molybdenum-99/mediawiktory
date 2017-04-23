# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Get terms associated with a page via an associated data item. On a wikibase entity page, the entity terms are used directly. Caveat: On a repo wiki, pageterms only works directly on entity pages, not on pages connected to an item. This may change in the future. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.pageterms(**options).perform # returns string with raw output
  # # or
  # api.some_action.pageterms(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.pageterms.continue(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Pageterms

    # When more results are available, use this to continue.
    #
    # @param value [Integer]
    # @return [self]
    def continue(value)
      merge(wbptcontinue: value.to_s)
    end

    # The types of terms to get, e.g. 'description'. If not specified, all types are returned.
    #
    # @param values [Array<String>] Allowed values: "alias", "description", "label".
    # @return [self]
    def terms(*values)
      merge(wbptterms: values.join('|'))
    end
  end
end
