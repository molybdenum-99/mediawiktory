# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Check to see if two-factor authentication (OATH) is enabled for a user. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.oath(**options).perform # returns string with raw output
    # # or
    # api.some_action.oath(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.oath.user(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Oath

      # User to get information about. Defaults to the current user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(oathuser: value.to_s)
      end
    end
  end
end
