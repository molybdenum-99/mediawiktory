# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Add tags to an article. 
  #
  # Usage:
  #
  # ```ruby
  # api.pagetriagetagging(**options).perform # returns string with raw output
  # # or
  # api.pagetriagetagging(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.pagetriagetagging.pageid(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Pagetriagetagging < MediaWiktory::GetAction
    # The article for which to be tagged.
    #
    # @param value [Integer]
    # @return [self]
    def pageid(value)
      merge(pageid: value.to_s)
    end
    # A "csrf" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(token: value.to_s)
    end
    # The tagging text to be added to the top of an article.
    #
    # @param value [String]
    # @return [self]
    def top(value)
      merge(top: value.to_s)
    end
    # The tagging text to be added to the bottom of an article.
    #
    # @param value [String]
    # @return [self]
    def bottom(value)
      merge(bottom: value.to_s)
    end
    # Whether or not the tagging is for a deletion nomination.
    #
    # @return [self]
    def deletion()
      merge(deletion: 'true')
    end
    # Personal note to page creators from reviewers.
    #
    # @param value [String]
    # @return [self]
    def note(value)
      merge(note: value.to_s)
    end
    # Pipe-separated list of tags.
    #
    # @param values [Array<String>]
    # @return [self]
    def taglist(*values)
      merge(taglist: values.join('|'))
    end
  end
end
