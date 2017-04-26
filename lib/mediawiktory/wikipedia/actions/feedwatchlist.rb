# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Returns a watchlist feed. 
    #
    # Usage:
    #
    # ```ruby
    # api.feedwatchlist(**options).perform # returns string with raw output
    # # or
    # api.feedwatchlist(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.feedwatchlist.feedformat(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Feedwatchlist < MediaWiktory::Wikipedia::GetAction

      # The format of the feed.
      #
      # @param value [String] One of "rss", "atom".
      # @return [self]
      def feedformat(value)
        merge(feedformat: value.to_s)
      end

      # List pages modified within this many hours from now.
      #
      # @param value [Integer]
      # @return [self]
      def hours(value)
        merge(hours: value.to_s)
      end

      # Link directly to changed sections if possible.
      #
      # @return [self]
      def linktosections()
        merge(linktosections: 'true')
      end

      # Include multiple revisions of the same page within given timeframe.
      #
      # @return [self]
      def allrev()
        merge(allrev: 'true')
      end

      # Used along with token to access a different user's watchlist.
      #
      # @param value [String]
      # @return [self]
      def wlowner(value)
        merge(wlowner: value.to_s)
      end

      # A security token (available in the user's preferences) to allow access to another user's watchlist.
      #
      # @param value [String]
      # @return [self]
      def wltoken(value)
        merge(wltoken: value.to_s)
      end

      # Show only items that meet these criteria. For example, to see only minor edits done by logged-in users, set show=minor|!anon.
      #
      # @param values [Array<String>] Allowed values: "minor", "!minor", "bot", "!bot", "anon", "!anon", "patrolled", "!patrolled", "unread", "!unread".
      # @return [self]
      def wlshow(*values)
        merge(wlshow: values.join('|'))
      end

      # Which types of changes to show:
      #
      # @param values [Array<String>] Allowed values: "edit" (Regular page edits), "new" (Page creations), "log" (Log entries), "external" (External changes), "categorize" (Category membership changes).
      # @return [self]
      def wltype(*values)
        merge(wltype: values.join('|'))
      end

      # Don't list changes by this user.
      #
      # @param value [String]
      # @return [self]
      def wlexcludeuser(value)
        merge(wlexcludeuser: value.to_s)
      end
  end
  end
end
