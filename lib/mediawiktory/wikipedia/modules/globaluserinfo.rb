# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Show information about a global user. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.globaluserinfo(**options).perform # returns string with raw output
    # # or
    # api.some_action.globaluserinfo(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.globaluserinfo.user(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Globaluserinfo

      # User to get information about. Defaults to the current user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(guiuser: value.to_s)
      end

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "groups" (Get a list of global groups this user belongs to), "rights" (Get a list of global rights this user has), "merged" (Get a list of merged accounts), "unattached" (Get a list of unattached accounts), "editcount" (Get the user's global edit count).
      # @return [self]
      def prop(*values)
        merge(guiprop: values.join('|'))
      end
    end
  end
end
