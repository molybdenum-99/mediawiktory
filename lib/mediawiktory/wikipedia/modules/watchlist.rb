# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get recent changes to pages in the current user's watchlist. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Watchlist

      # Include multiple revisions of the same page within given timeframe.
      #
      # @return [self]
      def allrev()
        merge(wlallrev: 'true')
      end

      # The timestamp to start enumerating from.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(wlstart: value.iso8601)
      end

      # The timestamp to end enumerating.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(wlend: value.iso8601)
      end

      # Filter changes to only the given namespaces.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res.namespace_single(val) }
      end

      protected def namespace_single(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(wlnamespace: value.to_s)
      end

      # Only list changes by this user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(wluser: value.to_s)
      end

      # Don't list changes by this user.
      #
      # @param value [String]
      # @return [self]
      def excludeuser(value)
        merge(wlexcludeuser: value.to_s)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: wlstart has to be before wlend), "older" (List newest first (default). Note: wlstart has to be later than wlend).
      # @return [self]
      def dir(value)
        defined?(super) && super || ["newer", "older"].include?(value.to_s) && merge(wldir: value.to_s)
      end

      # How many total results to return per request.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(wllimit: value.to_s)
      end

      # Which additional properties to get:
      #
      # @param values [Array<String>] Allowed values: "ids" (Adds revision IDs and page IDs), "title" (Adds title of the page), "flags" (Adds flags for the edit), "user" (Adds the user who made the edit), "userid" (Adds user ID of whoever made the edit), "comment" (Adds comment of the edit), "parsedcomment" (Adds parsed comment of the edit), "timestamp" (Adds timestamp of the edit), "patrol" (Tags edits that are patrolled), "sizes" (Adds the old and new lengths of the page), "notificationtimestamp" (Adds timestamp of when the user was last notified about the edit), "loginfo" (Adds log information where appropriate).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res.prop_single(val) }
      end

      protected def prop_single(value)
        defined?(super) && super || ["ids", "title", "flags", "user", "userid", "comment", "parsedcomment", "timestamp", "patrol", "sizes", "notificationtimestamp", "loginfo"].include?(value.to_s) && merge(wlprop: value.to_s)
      end

      # Show only items that meet these criteria. For example, to see only minor edits done by logged-in users, set wlshow=minor|!anon.
      #
      # @param values [Array<String>] Allowed values: "minor", "!minor", "bot", "!bot", "anon", "!anon", "patrolled", "!patrolled", "unread", "!unread".
      # @return [self]
      def show(*values)
        values.inject(self) { |res, val| res.show_single(val) }
      end

      protected def show_single(value)
        defined?(super) && super || ["minor", "!minor", "bot", "!bot", "anon", "!anon", "patrolled", "!patrolled", "unread", "!unread"].include?(value.to_s) && merge(wlshow: value.to_s)
      end

      # Which types of changes to show:
      #
      # @param values [Array<String>] Allowed values: "edit" (Regular page edits), "new" (Page creations), "log" (Log entries), "external" (External changes), "categorize" (Category membership changes).
      # @return [self]
      def type(*values)
        values.inject(self) { |res, val| res.type_single(val) }
      end

      protected def type_single(value)
        defined?(super) && super || ["edit", "new", "log", "external", "categorize"].include?(value.to_s) && merge(wltype: value.to_s)
      end

      # Used along with wltoken to access a different user's watchlist.
      #
      # @param value [String]
      # @return [self]
      def owner(value)
        merge(wlowner: value.to_s)
      end

      # A security token (available in the user's preferences) to allow access to another user's watchlist.
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(wltoken: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(wlcontinue: value.to_s)
      end
    end
  end
end
