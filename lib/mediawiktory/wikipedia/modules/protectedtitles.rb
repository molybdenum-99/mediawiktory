module MediaWiktory::Wikipedia::Modules
  # List all titles protected from creation. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.protectedtitles(**options).perform # returns string with raw output
  # # or
  # api.some_action.protectedtitles(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.protectedtitles.namespace(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Protectedtitles < MediaWiktory::Submodule
    # Only list titles in these namespaces.
    #
    # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(ptnamespace: values.join('|'))
    end
    # Only list titles with these protection levels.
    #
    # @param values [Array<String>] Allowed values: "autoconfirmed", "extendedconfirmed", "templateeditor", "sysop".
    # @return [self]
    def level(*values)
      merge(ptlevel: values.join('|'))
    end
    # How many total pages to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(ptlimit: value.to_s)
    end
    # In which direction to enumerate:
    #
    # @param value [String] One of "newer" (List oldest first. Note: ptstart has to be before ptend), "older" (List newest first (default). Note: ptstart has to be later than ptend).
    # @return [self]
    def dir(value)
      merge(ptdir: value.to_s)
    end
    # Start listing at this protection timestamp.
    #
    # @param value [Time]
    # @return [self]
    def start(value)
      merge(ptstart: value.iso8601)
    end
    # Stop listing at this protection timestamp.
    #
    # @param value [Time]
    # @return [self]
    def end(value)
      merge(ptend: value.iso8601)
    end
    # Which properties to get:
    #
    # @param values [Array<String>] Allowed values: "timestamp" (Adds the timestamp of when protection was added), "user" (Adds the user that added the protection), "userid" (Adds the user ID that added the protection), "comment" (Adds the comment for the protection), "parsedcomment" (Adds the parsed comment for the protection), "expiry" (Adds the timestamp of when the protection will be lifted), "level" (Adds the protection level).
    # @return [self]
    def prop(*values)
      merge(ptprop: values.join('|'))
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(ptcontinue: value.to_s)
    end

  end
end
