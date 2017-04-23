# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Get the stats for page triage. 
  #
  # Usage:
  #
  # ```ruby
  # api.pagetriagestats(**options).perform # returns string with raw output
  # # or
  # api.pagetriagestats(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.pagetriagestats.namespace(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Pagetriagestats < MediaWiktory::GetAction

    # What namespace to pull stats from.
    #
    # @param value [Integer]
    # @return [self]
    def namespace(value)
      merge(namespace: value.to_s)
    end

    # Whether to include redirects.
    #
    # @return [self]
    def showredirs()
      merge(showredirs: 'true')
    end

    # Whether to include reviewed.
    #
    # @return [self]
    def showreviewed()
      merge(showreviewed: 'true')
    end

    # Whether to include unreviewed.
    #
    # @return [self]
    def showunreviewed()
      merge(showunreviewed: 'true')
    end

    # Whether to include "proposed for deleted".
    #
    # @return [self]
    def showdeleted()
      merge(showdeleted: 'true')
    end
  end
end
