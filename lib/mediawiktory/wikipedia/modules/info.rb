# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get basic page information. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.info(**options).perform # returns string with raw output
    # # or
    # api.some_action.info(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.info.prop(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Info

      # Which additional properties to get:
      #
      # @param values [Array<String>] Allowed values: "protection" (List the protection level of each page), "talkid" (The page ID of the talk page for each non-talk page), "watched" (List the watched status of each page), "watchers" (The number of watchers, if allowed), "visitingwatchers" (The number of watchers of each page who have visited recent edits to that page, if allowed), "notificationtimestamp" (The watchlist notification timestamp of each page), "subjectid" (The page ID of the parent page for each talk page), "url" (Gives a full URL, an edit URL, and the canonical URL for each page), "readable" (Whether the user can read this page), "preload" (Gives the text returned by EditFormPreloadText), "displaytitle" (Gives the manner in which the page title is actually displayed).
      # @return [self]
      def prop(*values)
        merge(inprop: values.join('|'))
      end

      # Test whether the current user can perform certain actions on the page.
      #
      # @param values [Array<String>]
      # @return [self]
      def testactions(*values)
        merge(intestactions: values.join('|'))
      end

      # Use action=query&meta=tokens instead.
      #
      # @param values [Array<String>] Allowed values: "edit", "delete", "protect", "move", "block", "unblock", "email", "import", "watch".
      # @return [self]
      def token(*values)
        merge(intoken: values.join('|'))
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(incontinue: value.to_s)
      end
    end
  end
end
