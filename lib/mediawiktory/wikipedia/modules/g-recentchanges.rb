# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.recentchanges(**options).perform # returns string with raw output
    # # or
    # api.some_action.recentchanges(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.recentchanges.start(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GRecentchanges

      # The timestamp to start enumerating from.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(grcstart: value.iso8601)
      end

      # The timestamp to end enumerating.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(grcend: value.iso8601)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: rcstart has to be before rcend), "older" (List newest first (default). Note: rcstart has to be later than rcend).
      # @return [self]
      def dir(value)
        merge(grcdir: value.to_s)
      end

      # Filter changes to only these namespaces.
      #
      # @param values [Array<String>] Allowed values: "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        merge(grcnamespace: values.join('|'))
      end

      # Only list changes by this user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(grcuser: value.to_s)
      end

      # Don't list changes by this user.
      #
      # @param value [String]
      # @return [self]
      def excludeuser(value)
        merge(grcexcludeuser: value.to_s)
      end

      # Only list changes tagged with this tag.
      #
      # @param value [String]
      # @return [self]
      def tag(value)
        merge(grctag: value.to_s)
      end

      # Use action=query&meta=tokens instead.
      #
      # @param values [Array<String>] Allowed values: "patrol".
      # @return [self]
      def token(*values)
        merge(grctoken: values.join('|'))
      end

      # Show only items that meet these criteria. For example, to see only minor edits done by logged-in users, set rcshow=minor|!anon.
      #
      # @param values [Array<String>] Allowed values: "minor", "!minor", "bot", "!bot", "anon", "!anon", "redirect", "!redirect", "patrolled", "!patrolled", "unpatrolled".
      # @return [self]
      def show(*values)
        merge(grcshow: values.join('|'))
      end

      # How many total changes to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(grclimit: value.to_s)
      end

      # Which types of changes to show.
      #
      # @param values [Array<String>] Allowed values: "edit", "new", "log", "external", "categorize".
      # @return [self]
      def type(*values)
        merge(grctype: values.join('|'))
      end

      # Only list changes which are the latest revision.
      #
      # @return [self]
      def toponly()
        merge(grctoponly: 'true')
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(grccontinue: value.to_s)
      end

      # When being used as a generator, generate revision IDs rather than titles. Recent change entries without associated revision IDs (e.g. most log entries) will generate nothing.
      #
      # @return [self]
      def generaterevisions()
        merge(grcgeneraterevisions: 'true')
      end
  end
  end
end
