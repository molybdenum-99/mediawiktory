# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.images(**options).perform # returns string with raw output
    # # or
    # api.some_action.images(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.images.limit(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GImages

      # How many files to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gimlimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gimcontinue: value.to_s)
      end

      # Only list these files. Useful for checking whether a certain page has a certain file.
      #
      # @param values [Array<String>]
      # @return [self]
      def images(*values)
        merge(gimimages: values.join('|'))
      end

      # The direction in which to list.
      #
      # @param value [String] One of "ascending", "descending".
      # @return [self]
      def dir(value)
        merge(gimdir: value.to_s)
      end
    end
  end
end
