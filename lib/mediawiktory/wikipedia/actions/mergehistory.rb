# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Merge page histories. 
  #
  # Usage:
  #
  # ```ruby
  # api.mergehistory(**options).perform # returns string with raw output
  # # or
  # api.mergehistory(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.mergehistory.from(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Mergehistory < MediaWiktory::GetAction

    # Title of the page from which history will be merged. Cannot be used together with fromid.
    #
    # @param value [String]
    # @return [self]
    def from(value)
      merge(from: value.to_s)
    end

    # Page ID of the page from which history will be merged. Cannot be used together with from.
    #
    # @param value [Integer]
    # @return [self]
    def fromid(value)
      merge(fromid: value.to_s)
    end

    # Title of the page to which history will be merged. Cannot be used together with toid.
    #
    # @param value [String]
    # @return [self]
    def to(value)
      merge(to: value.to_s)
    end

    # Page ID of the page to which history will be merged. Cannot be used together with to.
    #
    # @param value [Integer]
    # @return [self]
    def toid(value)
      merge(toid: value.to_s)
    end

    # Timestamp up to which revisions will be moved from the source page's history to the destination page's history. If omitted, the entire page history of the source page will be merged into the destination page.
    #
    # @param value [Time]
    # @return [self]
    def timestamp(value)
      merge(timestamp: value.iso8601)
    end

    # Reason for the history merge.
    #
    # @param value [String]
    # @return [self]
    def reason(value)
      merge(reason: value.to_s)
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
