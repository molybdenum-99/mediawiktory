# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Delete a global user. 
    #
    # Usage:
    #
    # ```ruby
    # api.deleteglobalaccount(**options).perform # returns string with raw output
    # # or
    # api.deleteglobalaccount(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.deleteglobalaccount.user(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Deleteglobalaccount < MediaWiktory::Wikipedia::Actions::Post

      # User to delete.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(user: value.to_s)
      end

      # Reason for deleting the user.
      #
      # @param value [String]
      # @return [self]
      def reason(value)
        merge(reason: value.to_s)
      end

      # A "deleteglobalaccount" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end
    end
  end
end
