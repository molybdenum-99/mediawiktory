# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # This module allows to save draft translations by section to save bandwidth and to collect parallel corpora. 
    #
    # Usage:
    #
    # ```ruby
    # api.cxsave(**options).perform
    # # or
    #
    # api.cxsave.from(value).perform # returns string with raw output
    # # or
    # api.cxsave.from(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Cxsave < MediaWiktory::Wikipedia::Actions::Post

      # The source language code.
      #
      # @param value [String]
      # @return [self]
      def from(value)
        merge(from: value.to_s)
      end

      # The target language code.
      #
      # @param value [String]
      # @return [self]
      def to(value)
        merge(to: value.to_s)
      end

      # The title of the source page.
      #
      # @param value [String]
      # @return [self]
      def sourcetitle(value)
        merge(sourcetitle: value.to_s)
      end

      # The title of the page to perform actions on.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(title: value.to_s)
      end

      # JSON-encoded section data. Each section is an object and has the following keys: content, sectionId, sequenceId, sequenceId, origin
      #
      # @param value [String]
      # @return [self]
      def content(value)
        merge(content: value.to_s)
      end

      # The revision of the source page.
      #
      # @param value [Integer]
      # @return [self]
      def sourcerevision(value)
        merge(sourcerevision: value.to_s)
      end

      # Information about translation completion (progress). JSON with the keys any, human, mt and mtSectionsCount. The keys' values are percentages.
      #
      # @param value [String]
      # @return [self]
      def progress(value)
        merge(progress: value.to_s)
      end

      # A "csrf" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end
    end
  end
end
