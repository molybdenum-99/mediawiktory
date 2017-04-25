# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # List all file usages, including non-existing. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.allfileusages(**options).perform # returns string with raw output
    # # or
    # api.some_action.allfileusages(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.allfileusages.continue(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Allfileusages

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(afcontinue: value.to_s)
    end

    # The title of the file to start enumerating from.
    #
    # @param value [String]
    # @return [self]
    def from(value)
      merge(affrom: value.to_s)
    end

    # The title of the file to stop enumerating at.
    #
    # @param value [String]
    # @return [self]
    def to(value)
      merge(afto: value.to_s)
    end

    # Search for all file titles that begin with this value.
    #
    # @param value [String]
    # @return [self]
    def prefix(value)
      merge(afprefix: value.to_s)
    end

    # Only show distinct file titles. Cannot be used with afprop=ids. When used as a generator, yields target pages instead of source pages.
    #
    # @return [self]
    def unique()
      merge(afunique: 'true')
    end

    # Which pieces of information to include:
    #
    # @param values [Array<String>] Allowed values: "ids" (Adds the page IDs of the using pages (cannot be used with afunique)), "title" (Adds the title of the file).
    # @return [self]
    def prop(*values)
      merge(afprop: values.join('|'))
    end

    # How many total items to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(aflimit: value.to_s)
    end

    # The direction in which to list.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(afdir: value.to_s)
    end
  end
  end
end
