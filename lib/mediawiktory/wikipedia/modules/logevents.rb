# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get events from logs. 
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Logevents

      # Which properties to get:
      #
      # @param values [Array<String>] Allowed values: "ids" (Adds the ID of the log event), "title" (Adds the title of the page for the log event), "type" (Adds the type of log event), "user" (Adds the user responsible for the log event), "userid" (Adds the user ID who was responsible for the log event), "timestamp" (Adds the timestamp for the log event), "comment" (Adds the comment of the log event), "parsedcomment" (Adds the parsed comment of the log event), "details" (Lists additional details about the log event), "tags" (Lists tags for the log event).
      # @return [self]
      def prop(*values)
        values.inject(self) { |res, val| res._prop(val) or fail ArgumentError, "Unknown value for prop: #{val}" }
      end

      # @private
      def _prop(value)
        defined?(super) && super || ["ids", "title", "type", "user", "userid", "timestamp", "comment", "parsedcomment", "details", "tags"].include?(value.to_s) && merge(leprop: value.to_s)
      end

      # Filter log entries to only this type.
      #
      # @param value [String] One of "spamblacklist", "titleblacklist", "gblblock", "renameuser", "globalauth", "gblrights", "gblrename", "abusefilter", "massmessage", "pagetriage-curation", "pagetriage-deletion", "institution", "course", "student", "online", "campus", "instructor", "thanks", "usermerge", "block", "protect", "rights", "delete", "upload", "move", "import", "patrol", "merge", "suppress", "tag", "managetags", "contentmodel", "review", "stable", "timedmediahandler", "newusers".
      # @return [self]
      def type(value)
        _type(value) or fail ArgumentError, "Unknown value for type: #{value}"
      end

      # @private
      def _type(value)
        defined?(super) && super || ["spamblacklist", "titleblacklist", "gblblock", "renameuser", "globalauth", "gblrights", "gblrename", "abusefilter", "massmessage", "pagetriage-curation", "pagetriage-deletion", "institution", "course", "student", "online", "campus", "instructor", "thanks", "usermerge", "block", "protect", "rights", "delete", "upload", "move", "import", "patrol", "merge", "suppress", "tag", "managetags", "contentmodel", "review", "stable", "timedmediahandler", "newusers"].include?(value.to_s) && merge(letype: value.to_s)
      end

      # The timestamp to start enumerating from.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(lestart: value.iso8601)
      end

      # The timestamp to end enumerating.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(leend: value.iso8601)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: lestart has to be before leend), "older" (List newest first (default). Note: lestart has to be later than leend).
      # @return [self]
      def dir(value)
        _dir(value) or fail ArgumentError, "Unknown value for dir: #{value}"
      end

      # @private
      def _dir(value)
        defined?(super) && super || ["newer", "older"].include?(value.to_s) && merge(ledir: value.to_s)
      end

      # Filter entries to those made by the given user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(leuser: value.to_s)
      end

      # Filter entries to those related to a page.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(letitle: value.to_s)
      end

      # Filter entries to those in the given namespace.
      #
      # @param value [String] One of "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(value)
        _namespace(value) or fail ArgumentError, "Unknown value for namespace: #{value}"
      end

      # @private
      def _namespace(value)
        defined?(super) && super || ["-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(lenamespace: value.to_s)
      end

      # Disabled due to miser mode.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(leprefix: value.to_s)
      end

      # Only list event entries tagged with this tag.
      #
      # @param value [String]
      # @return [self]
      def tag(value)
        merge(letag: value.to_s)
      end

      # How many total event entries to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(lelimit: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(lecontinue: value.to_s)
      end
    end
  end
end
