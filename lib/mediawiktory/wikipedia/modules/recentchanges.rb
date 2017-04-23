module MediaWiktory::Wikipedia::Modules
  # Enumerate recent changes. 
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
  class Recentchanges < MediaWiktory::Submodule
    # The timestamp to start enumerating from.
    #
    # @param value [Time]
    # @return [self]
    def start(value)
      merge(rcstart: value.iso8601)
    end
    # The timestamp to end enumerating.
    #
    # @param value [Time]
    # @return [self]
    def end(value)
      merge(rcend: value.iso8601)
    end
    # In which direction to enumerate:
    #
    # @param value [String] One of "newer" (List oldest first. Note: rcstart has to be before rcend), "older" (List newest first (default). Note: rcstart has to be later than rcend).
    # @return [self]
    def dir(value)
      merge(rcdir: value.to_s)
    end
    # Filter changes to only these namespaces.
    #
    # @param values [Array<String>] Allowed values: "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(rcnamespace: values.join('|'))
    end
    # Only list changes by this user.
    #
    # @param value [String]
    # @return [self]
    def user(value)
      merge(rcuser: value.to_s)
    end
    # Don't list changes by this user.
    #
    # @param value [String]
    # @return [self]
    def excludeuser(value)
      merge(rcexcludeuser: value.to_s)
    end
    # Only list changes tagged with this tag.
    #
    # @param value [String]
    # @return [self]
    def tag(value)
      merge(rctag: value.to_s)
    end
    # Include additional pieces of information:
    #
    # @param values [Array<String>] Allowed values: "user" (Adds the user responsible for the edit and tags if they are an IP), "userid" (Adds the user ID responsible for the edit), "comment" (Adds the comment for the edit), "parsedcomment" (Adds the parsed comment for the edit), "flags" (Adds flags for the edit), "timestamp" (Adds timestamp of the edit), "title" (Adds the page title of the edit), "ids" (Adds the page ID, recent changes ID and the new and old revision ID), "sizes" (Adds the new and old page length in bytes), "redirect" (Tags edit if page is a redirect), "patrolled" (Tags patrollable edits as being patrolled or unpatrolled), "loginfo" (Adds log information (log ID, log type, etc) to log entries), "tags" (Lists tags for the entry), "sha1" (Adds the content checksum for entries associated with a revision).
    # @return [self]
    def prop(*values)
      merge(rcprop: values.join('|'))
    end
    # Use action=query&meta=tokens instead.
    #
    # @param values [Array<String>] Allowed values: "patrol".
    # @return [self]
    def token(*values)
      merge(rctoken: values.join('|'))
    end
    # Show only items that meet these criteria. For example, to see only minor edits done by logged-in users, set rcshow=minor|!anon.
    #
    # @param values [Array<String>] Allowed values: "minor", "!minor", "bot", "!bot", "anon", "!anon", "redirect", "!redirect", "patrolled", "!patrolled", "unpatrolled".
    # @return [self]
    def show(*values)
      merge(rcshow: values.join('|'))
    end
    # How many total changes to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(rclimit: value.to_s)
    end
    # Which types of changes to show.
    #
    # @param values [Array<String>] Allowed values: "edit", "new", "log", "external", "categorize".
    # @return [self]
    def type(*values)
      merge(rctype: values.join('|'))
    end
    # Only list changes which are the latest revision.
    #
    # @return [self]
    def toponly()
      merge(rctoponly: 'true')
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(rccontinue: value.to_s)
    end
    # When being used as a generator, generate revision IDs rather than titles. Recent change entries without associated revision IDs (e.g. most log entries) will generate nothing.
    #
    # @return [self]
    def generaterevisions()
      merge(rcgeneraterevisions: 'true')
    end

  end
end
