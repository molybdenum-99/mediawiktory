# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Prepare an edit in shared cache. 
    #
    # Usage:
    #
    # ```ruby
    # api.stashedit(**options).perform # returns string with raw output
    # # or
    # api.stashedit(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.stashedit.title(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Stashedit < MediaWiktory::Wikipedia::GetAction

    # Title of the page being edited.
    #
    # @param value [String]
    # @return [self]
    def title(value)
      merge(title: value.to_s)
    end

    # Section number. 0 for the top section, new for a new section.
    #
    # @param value [String]
    # @return [self]
    def section(value)
      merge(section: value.to_s)
    end

    # The title for a new section.
    #
    # @param value [String]
    # @return [self]
    def sectiontitle(value)
      merge(sectiontitle: value.to_s)
    end

    # Page content.
    #
    # @param value [String]
    # @return [self]
    def text(value)
      merge(text: value.to_s)
    end

    # Page content hash from a prior stash to use instead.
    #
    # @param value [String]
    # @return [self]
    def stashedtexthash(value)
      merge(stashedtexthash: value.to_s)
    end

    # Change summary.
    #
    # @param value [String]
    # @return [self]
    def summary(value)
      merge(summary: value.to_s)
    end

    # Content model of the new content.
    #
    # @param value [String] One of "GadgetDefinition", "SecurePoll", "MassMessageListContent", "JsonSchema", "wikitext", "javascript", "json", "css", "text", "Scribunto".
    # @return [self]
    def contentmodel(value)
      merge(contentmodel: value.to_s)
    end

    # Content serialization format used for the input text.
    #
    # @param value [String] One of "application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain".
    # @return [self]
    def contentformat(value)
      merge(contentformat: value.to_s)
    end

    # Revision ID of the base revision.
    #
    # @param value [Integer]
    # @return [self]
    def baserevid(value)
      merge(baserevid: value.to_s)
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
