# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Get the difference between 2 pages. 
  #
  # Usage:
  #
  # ```ruby
  # api.compare(**options).perform # returns string with raw output
  # # or
  # api.compare(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.compare.fromtitle(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Compare < MediaWiktory::Wikipedia::GetAction

    # First title to compare.
    #
    # @param value [String]
    # @return [self]
    def fromtitle(value)
      merge(fromtitle: value.to_s)
    end

    # First page ID to compare.
    #
    # @param value [Integer]
    # @return [self]
    def fromid(value)
      merge(fromid: value.to_s)
    end

    # First revision to compare.
    #
    # @param value [Integer]
    # @return [self]
    def fromrev(value)
      merge(fromrev: value.to_s)
    end

    # Second title to compare.
    #
    # @param value [String]
    # @return [self]
    def totitle(value)
      merge(totitle: value.to_s)
    end

    # Second page ID to compare.
    #
    # @param value [Integer]
    # @return [self]
    def toid(value)
      merge(toid: value.to_s)
    end

    # Second revision to compare.
    #
    # @param value [Integer]
    # @return [self]
    def torev(value)
      merge(torev: value.to_s)
    end
  end
end
