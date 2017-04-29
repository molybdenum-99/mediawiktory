# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get deleted revision information. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.deletedrevisions(**options).perform # returns string with raw output
    # # or
    # api.some_action.deletedrevisions(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.deletedrevisions.prop(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Deletedrevisions

      # Which properties to get for each revision:
      #
      # @param values [Array<String>] Allowed values: "ids" (The ID of the revision), "flags" (Revision flags (minor)), "timestamp" (The timestamp of the revision), "user" (User that made the revision), "userid" (User ID of the revision creator), "size" (Length (bytes) of the revision), "sha1" (SHA-1 (base 16) of the revision), "contentmodel" (Content model ID of the revision), "comment" (Comment by the user for the revision), "parsedcomment" (Parsed comment by the user for the revision), "content" (Text of the revision), "tags" (Tags for the revision), "parsetree" (The XML parse tree of revision content (requires content model wikitext)).
      # @return [self]
      def prop(*values)
        merge(drvprop: values.join('|'))
      end

      # Limit how many revisions will be returned.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(drvlimit: value.to_s)
      end

      # Expand templates in revision content (requires drvprop=content).
      #
      # @return [self]
      def expandtemplates()
        merge(drvexpandtemplates: 'true')
      end

      # Generate XML parse tree for revision content (requires drvprop=content; replaced by drvprop=parsetree).
      #
      # @return [self]
      def generatexml()
        merge(drvgeneratexml: 'true')
      end

      # Parse revision content (requires drvprop=content). For performance reasons, if this option is used, drvlimit is enforced to 1.
      #
      # @return [self]
      def parse()
        merge(drvparse: 'true')
      end

      # Only retrieve the content of this section number.
      #
      # @param value [String]
      # @return [self]
      def section(value)
        merge(drvsection: value.to_s)
      end

      # Revision ID to diff each revision to. Use prev, next and cur for the previous, next and current revision respectively.
      #
      # @param value [String]
      # @return [self]
      def diffto(value)
        merge(drvdiffto: value.to_s)
      end

      # Text to diff each revision to. Only diffs a limited number of revisions. Overrides drvdiffto. If drvsection is set, only that section will be diffed against this text.
      #
      # @param value [String]
      # @return [self]
      def difftotext(value)
        merge(drvdifftotext: value.to_s)
      end

      # Perform a pre-save transform on the text before diffing it. Only valid when used with drvdifftotext.
      #
      # @return [self]
      def difftotextpst()
        merge(drvdifftotextpst: 'true')
      end

      # Serialization format used for drvdifftotext and expected for output of content.
      #
      # @param value [String] One of "application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain".
      # @return [self]
      def contentformat(value)
        merge(drvcontentformat: value.to_s)
      end

      # The timestamp to start enumerating from. Ignored when processing a list of revision IDs.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(drvstart: value.iso8601)
      end

      # The timestamp to stop enumerating at. Ignored when processing a list of revision IDs.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(drvend: value.iso8601)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: drvstart has to be before drvend), "older" (List newest first (default). Note: drvstart has to be later than drvend).
      # @return [self]
      def dir(value)
        merge(drvdir: value.to_s)
      end

      # Only list revisions tagged with this tag.
      #
      # @param value [String]
      # @return [self]
      def tag(value)
        merge(drvtag: value.to_s)
      end

      # Only list revisions by this user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(drvuser: value.to_s)
      end

      # Don't list revisions by this user.
      #
      # @param value [String]
      # @return [self]
      def excludeuser(value)
        merge(drvexcludeuser: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(drvcontinue: value.to_s)
      end
    end
  end
end
