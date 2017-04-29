# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Delete Education Program objects. 
    #
    # Usage:
    #
    # ```ruby
    # api.deleteeducation(**options).perform # returns string with raw output
    # # or
    # api.deleteeducation(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.deleteeducation.ids(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Deleteeducation < MediaWiktory::Wikipedia::Actions::Post

      # The IDs of the objects to delete.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def ids(*values)
        merge(ids: values.join('|'))
      end

      # Type of object to delete.
      #
      # @param value [String] One of "org", "course".
      # @return [self]
      def type(value)
        merge(type: value.to_s)
      end

      # Reason for this deletion, for the log.
      #
      # @param value [String]
      # @return [self]
      def comment(value)
        merge(comment: value.to_s)
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
