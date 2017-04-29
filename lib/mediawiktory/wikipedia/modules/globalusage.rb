# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Returns global image usage for a certain image. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.globalusage(**options).perform # returns string with raw output
    # # or
    # api.some_action.globalusage(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.globalusage.prop(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Globalusage

      # Which properties to return:
      #
      # @param values [Array<String>] Allowed values: "url" (Adds url), "pageid" (Adds page ID), "namespace" (Adds namespace ID).
      # @return [self]
      def prop(*values)
        merge(guprop: values.join('|'))
      end

      # How many links to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gulimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gucontinue: value.to_s)
      end

      # Filter local usage of the file.
      #
      # @return [self]
      def filterlocal()
        merge(gufilterlocal: 'true')
      end
    end
  end
end
