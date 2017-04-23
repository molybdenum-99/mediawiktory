# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Enumerate all wiki sets. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.wikisets(**options).perform # returns string with raw output
  # # or
  # api.some_action.wikisets(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.wikisets.from(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Wikisets

    # The name of the wiki set to start from.
    #
    # @param value [String]
    # @return [self]
    def from(value)
      merge(wsfrom: value.to_s)
    end

    # What pieces of information to include.
    #
    # @param values [Array<String>] Allowed values: "type" (Opt-in based (includes only specified wikis) or opt-out based (includes all wikis except specified)), "wikisincluded" (The wikis that are included in this wiki set), "wikisnotincluded" (The wikis that are not included in this wiki set).
    # @return [self]
    def prop(*values)
      merge(wsprop: values.join('|'))
    end

    # How many wiki sets to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(wslimit: value.to_s)
    end

    # Order results by name.
    #
    # @return [self]
    def orderbyname()
      merge(wsorderbyname: 'true')
    end
  end
end
