module MediaWiktory::Wikipedia::Modules
  # List all revisions. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.allrevisions(**options).perform # returns string with raw output
  # # or
  # api.some_action.allrevisions(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.allrevisions.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Allrevisions < MediaWiktory::Submodule
    # Which properties to get for each revision:
    #
    # @param values [Array<String>] Allowed values: "ids" (The ID of the revision), "flags" (Revision flags (minor)), "timestamp" (The timestamp of the revision), "user" (User that made the revision), "userid" (User ID of the revision creator), "size" (Length (bytes) of the revision), "sha1" (SHA-1 (base 16) of the revision), "contentmodel" (Content model ID of the revision), "comment" (Comment by the user for the revision), "parsedcomment" (Parsed comment by the user for the revision), "content" (Text of the revision), "tags" (Tags for the revision), "parsetree" (The XML parse tree of revision content (requires content model wikitext)).
    # @return [self]
    def prop(*values)
      merge(arvprop: values.join('|'))
    end
    # Limit how many revisions will be returned.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(arvlimit: value.to_s)
    end
    # Expand templates in revision content (requires arvprop=content).
    #
    # @return [self]
    def expandtemplates()
      merge(arvexpandtemplates: 'true')
    end
    # Generate XML parse tree for revision content (requires arvprop=content; replaced by arvprop=parsetree).
    #
    # @return [self]
    def generatexml()
      merge(arvgeneratexml: 'true')
    end
    # Parse revision content (requires arvprop=content). For performance reasons, if this option is used, arvlimit is enforced to 1.
    #
    # @return [self]
    def parse()
      merge(arvparse: 'true')
    end
    # Only retrieve the content of this section number.
    #
    # @param value [String]
    # @return [self]
    def section(value)
      merge(arvsection: value.to_s)
    end
    # Revision ID to diff each revision to. Use prev, next and cur for the previous, next and current revision respectively.
    #
    # @param value [String]
    # @return [self]
    def diffto(value)
      merge(arvdiffto: value.to_s)
    end
    # Text to diff each revision to. Only diffs a limited number of revisions. Overrides arvdiffto. If arvsection is set, only that section will be diffed against this text.
    #
    # @param value [String]
    # @return [self]
    def difftotext(value)
      merge(arvdifftotext: value.to_s)
    end
    # Perform a pre-save transform on the text before diffing it. Only valid when used with arvdifftotext.
    #
    # @return [self]
    def difftotextpst()
      merge(arvdifftotextpst: 'true')
    end
    # Serialization format used for arvdifftotext and expected for output of content.
    #
    # @param value [String] One of "application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain".
    # @return [self]
    def contentformat(value)
      merge(arvcontentformat: value.to_s)
    end
    # Only list revisions by this user.
    #
    # @param value [String]
    # @return [self]
    def user(value)
      merge(arvuser: value.to_s)
    end
    # Only list pages in this namespace.
    #
    # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(arvnamespace: values.join('|'))
    end
    # The timestamp to start enumerating from.
    #
    # @param value [Time]
    # @return [self]
    def start(value)
      merge(arvstart: value.iso8601)
    end
    # The timestamp to stop enumerating at.
    #
    # @param value [Time]
    # @return [self]
    def end(value)
      merge(arvend: value.iso8601)
    end
    # In which direction to enumerate:
    #
    # @param value [String] One of "newer" (List oldest first. Note: arvstart has to be before arvend), "older" (List newest first (default). Note: arvstart has to be later than arvend).
    # @return [self]
    def dir(value)
      merge(arvdir: value.to_s)
    end
    # Don't list revisions by this user.
    #
    # @param value [String]
    # @return [self]
    def excludeuser(value)
      merge(arvexcludeuser: value.to_s)
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(arvcontinue: value.to_s)
    end
    # When being used as a generator, generate titles rather than revision IDs.
    #
    # @return [self]
    def generatetitles()
      merge(arvgeneratetitles: 'true')
    end

  end
end
