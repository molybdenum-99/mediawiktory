# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GAllrevisions

      # Limit how many revisions will be returned.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(garvlimit: value.to_s)
      end

      # Expand templates in revision content (requires arvprop=content).
      #
      # @return [self]
      def expandtemplates()
        merge(garvexpandtemplates: 'true')
      end

      # Generate XML parse tree for revision content (requires arvprop=content; replaced by arvprop=parsetree).
      #
      # @return [self]
      def generatexml()
        merge(garvgeneratexml: 'true')
      end

      # Parse revision content (requires arvprop=content). For performance reasons, if this option is used, arvlimit is enforced to 1.
      #
      # @return [self]
      def parse()
        merge(garvparse: 'true')
      end

      # Only retrieve the content of this section number.
      #
      # @param value [String]
      # @return [self]
      def section(value)
        merge(garvsection: value.to_s)
      end

      # Revision ID to diff each revision to. Use prev, next and cur for the previous, next and current revision respectively.
      #
      # @param value [String]
      # @return [self]
      def diffto(value)
        merge(garvdiffto: value.to_s)
      end

      # Text to diff each revision to. Only diffs a limited number of revisions. Overrides arvdiffto. If arvsection is set, only that section will be diffed against this text.
      #
      # @param value [String]
      # @return [self]
      def difftotext(value)
        merge(garvdifftotext: value.to_s)
      end

      # Perform a pre-save transform on the text before diffing it. Only valid when used with arvdifftotext.
      #
      # @return [self]
      def difftotextpst()
        merge(garvdifftotextpst: 'true')
      end

      # Serialization format used for arvdifftotext and expected for output of content.
      #
      # @param value [String] One of "application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain".
      # @return [self]
      def contentformat(value)
        defined?(super) && super || ["application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain"].include?(value.to_s) && merge(garvcontentformat: value.to_s)
      end

      # Only list revisions by this user.
      #
      # @param value [String]
      # @return [self]
      def user(value)
        merge(garvuser: value.to_s)
      end

      # Only list pages in this namespace.
      #
      # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
      # @return [self]
      def namespace(*values)
        values.inject(self) { |res, val| res.namespace_single(val) }
      end

      protected def namespace_single(value)
        defined?(super) && super || ["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303"].include?(value.to_s) && merge(garvnamespace: value.to_s)
      end

      # The timestamp to start enumerating from.
      #
      # @param value [Time]
      # @return [self]
      def start(value)
        merge(garvstart: value.iso8601)
      end

      # The timestamp to stop enumerating at.
      #
      # @param value [Time]
      # @return [self]
      def end(value)
        merge(garvend: value.iso8601)
      end

      # In which direction to enumerate:
      #
      # @param value [String] One of "newer" (List oldest first. Note: arvstart has to be before arvend), "older" (List newest first (default). Note: arvstart has to be later than arvend).
      # @return [self]
      def dir(value)
        defined?(super) && super || ["newer", "older"].include?(value.to_s) && merge(garvdir: value.to_s)
      end

      # Don't list revisions by this user.
      #
      # @param value [String]
      # @return [self]
      def excludeuser(value)
        merge(garvexcludeuser: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(garvcontinue: value.to_s)
      end

      # When being used as a generator, generate titles rather than revision IDs.
      #
      # @return [self]
      def generatetitles()
        merge(garvgeneratetitles: 'true')
      end
    end
  end
end
