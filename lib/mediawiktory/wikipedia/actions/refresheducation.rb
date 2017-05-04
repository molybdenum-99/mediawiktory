# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Rebuild summary data of Education Program objects. 
    #
    # Usage:
    #

    # ```ruby
    # api.refresheducation(**options).perform # returns string with raw output
    # # or
    # api.refresheducation(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.refresheducation.ids(value).perform
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Refresheducation < MediaWiktory::Wikipedia::Actions::Post

      # The IDs of the objects to refresh.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def ids(*values)
        values.inject(self) { |res, val| res.ids_single(val) }
      end

      protected def ids_single(value)
        merge(ids: value.to_s)
      end

      # Type of object to refresh.
      #
      # @param value [String] One of "org", "course", "student".
      # @return [self]
      def type(value)
        defined?(super) && super || ["org", "course", "student"].include?(value.to_s) && merge(type: value.to_s)
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end
    end
  end
end
