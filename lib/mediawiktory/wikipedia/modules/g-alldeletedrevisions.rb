# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.alldeletedrevisions(**options).perform # returns string with raw output
    # # or
    # api.some_action.alldeletedrevisions(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.alldeletedrevisions.limit(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GAlldeletedrevisions

      # Limit how many revisions will be returned.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gadrlimit: value.to_s)
      end

      # Expand templates in revision content (requires adrprop=content).
      #
      # @return [self]
      def expandtemplates()
        merge(gadrexpandtemplates: 'true')
      end

      # Generate XML parse tree for revision content (requires adrprop=content; replaced by adrprop=parsetree).
      #
      # @return [self]
      def generatexml()
        merge(gadrgeneratexml: 'true')
      end

      # Parse revision content (requires adrprop=content). For performance reasons, if this option is used, adrlimit is enforced to 1.
      #
      # @return [self]
      def parse()
        merge(gadrparse: 'true')
      end

      # Only retrieve the content of this section number.
      #
      # @param value [String]
      # @return [self]
      def section(value)
        merge(gadrsection: value.to_s)
      end

      # Revision ID to diff each revision to. Use prev, next and cur for the previous, next and current revision respectively.
      #
      # @param value [String]
      # @return [self]
      def diffto(value)
        merge(gadrdiffto: value.to_s)
      end

      # Text to diff each revision to. Only diffs a limited number of revisions. Overrides adrdiffto. If adrsection is set, only that section will be diffed against this text.
      #
      # @param value [String]
      # @return [self]
      def difftotext(value)
        merge(gadrdifftotext: value.to_s)
      end

      # Perform a pre-save transform on the text before diffing it. Only valid when used with adrdifftotext.
      #
      # @return [self]
      def difftotextpst()
        merge(gadrdifftotextpst: 'true')
      end

      # Serialization format used for adrdifftotext and expected for output of content.
      #
      # @param value [String] One of "application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain".
      # @return [self]
      def contentformat(value)
        merge(gadrcontentformat: value.to_s)
      end

      # Only list revisions by this user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(gadruser: value.to_s)
      end

      # Only list pages in this namespace.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        merge(gadrnamespace: values.join('|'))
      end

      # The timestamp to start enumerating from.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(gadrstart: value.iso8601)
      end

      # The timestamp to stop enumerating at.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(gadrend: value.iso8601)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: adrstart has to be before adrend), "older" (List newest first (default). Note: adrstart has to be later than adrend).
      # @return [self]
      def dir(value)
        merge(gadrdir: value.to_s)
      end

      # Start listing at this title.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(gadrfrom: value.to_s)
      end

      # Stop listing at this title.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(gadrto: value.to_s)
      end

      # Search for all page titles that begin with this value.
      #
      # @param value [String]
      # @return [self]
      def prefix(value)
        merge(gadrprefix: value.to_s)
      end

      # Don't list revisions by this user.
      #
      # @param value [String]
      # @return [self]
      def excludeuser(value)
        merge(gadrexcludeuser: value.to_s)
      end

      # Only list revisions tagged with this tag.
      #
      # @param value [String]
      # @return [self]
      def tag(value)
        merge(gadrtag: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(gadrcontinue: value.to_s)
      end

      # When being used as a generator, generate titles rather than revision IDs.
      #
      # @return [self]
      def generatetitles()
        merge(gadrgeneratetitles: 'true')
      end
    end
  end
end
