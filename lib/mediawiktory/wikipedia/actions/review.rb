module MediaWiktory::Wikipedia::Actions
  # Review a revision by approving or de-approving it. 
  #
  # Usage:
  #
  # ```ruby
  # api.review(**options).perform # returns string with raw output
  # # or
  # api.review(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.review.revid(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Review < MediaWiktory::GetAction
    # The revision ID for which to set the flags.
    #
    # @param value [String]
    # @return [self]
    def revid(value)
      merge(revid: value.to_s)
    end
    # A "csrf" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(token: value.to_s)
    end
    # Comment for the review.
    #
    # @param value [String]
    # @return [self]
    def comment(value)
      merge(comment: value.to_s)
    end
    # If set, revision will be unapproved rather than approved.
    #
    # @return [self]
    def unapprove()
      merge(unapprove: 'true')
    end

  end
end