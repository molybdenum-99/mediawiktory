# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Get all edits by a user. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.usercontribs(**options).perform # returns string with raw output
  # # or
  # api.some_action.usercontribs(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.usercontribs.limit(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Usercontribs
    # The maximum number of contributions to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(uclimit: value.to_s)
    end
    # The start timestamp to return from.
    #
    # @param value [Time]
    # @return [self]
    def start(value)
      merge(ucstart: value.iso8601)
    end
    # The end timestamp to return to.
    #
    # @param value [Time]
    # @return [self]
    def end(value)
      merge(ucend: value.iso8601)
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(uccontinue: value.to_s)
    end
    # The users to retrieve contributions for. Cannot be used with ucuserids or ucuserprefix.
    #
    # @param values [Array<String>]
    # @return [self]
    def user(*values)
      merge(ucuser: values.join('|'))
    end
    # The user IDs to retrieve contributions for. Cannot be used with ucuser or ucuserprefix.
    #
    # @param values [Array<Integer>]
    # @return [self]
    def userids(*values)
      merge(ucuserids: values.join('|'))
    end
    # Retrieve contributions for all users whose names begin with this value. Cannot be used with ucuser or ucuserids.
    #
    # @param value [String]
    # @return [self]
    def userprefix(value)
      merge(ucuserprefix: value.to_s)
    end
    # In which direction to enumerate:
    #
    # @param value [String] One of "newer" (List oldest first. Note: ucstart has to be before ucend), "older" (List newest first (default). Note: ucstart has to be later than ucend).
    # @return [self]
    def dir(value)
      merge(ucdir: value.to_s)
    end
    # Only list contributions in these namespaces.
    #
    # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(ucnamespace: values.join('|'))
    end
    # Include additional pieces of information:
    #
    # @param values [Array<String>] Allowed values: "ids" (Adds the page ID and revision ID), "title" (Adds the title and namespace ID of the page), "timestamp" (Adds the timestamp of the edit), "comment" (Adds the comment of the edit), "parsedcomment" (Adds the parsed comment of the edit), "size" (Adds the new size of the edit), "sizediff" (Adds the size delta of the edit against its parent), "flags" (Adds flags of the edit), "patrolled" (Tags patrolled edits), "tags" (Lists tags for the edit).
    # @return [self]
    def prop(*values)
      merge(ucprop: values.join('|'))
    end
    # Show only items that meet these criteria, e.g. non minor edits only: ucshow=!minor.
    #
    # @param values [Array<String>] Allowed values: "minor", "!minor", "patrolled", "!patrolled", "top", "!top", "new", "!new".
    # @return [self]
    def show(*values)
      merge(ucshow: values.join('|'))
    end
    # Only list revisions tagged with this tag.
    #
    # @param value [String]
    # @return [self]
    def tag(value)
      merge(uctag: value.to_s)
    end
    # Only list changes which are the latest revision.
    #
    # @return [self]
    def toponly()
      merge(uctoponly: 'true')
    end
  end
end
