# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Returns a recent changes feed. 
  #
  # Usage:
  #
  # ```ruby
  # api.feedrecentchanges(**options).perform # returns string with raw output
  # # or
  # api.feedrecentchanges(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.feedrecentchanges.feedformat(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Feedrecentchanges < MediaWiktory::GetAction

    # The format of the feed.
    #
    # @param value [String] One of "rss", "atom".
    # @return [self]
    def feedformat(value)
      merge(feedformat: value.to_s)
    end

    # Namespace to limit the results to.
    #
    # @param value [String] One of "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(value)
      merge(namespace: value.to_s)
    end

    # All namespaces but the selected one.
    #
    # @return [self]
    def invert()
      merge(invert: 'true')
    end

    # Include associated (talk or main) namespace.
    #
    # @return [self]
    def associated()
      merge(associated: 'true')
    end

    # Days to limit the results to.
    #
    # @param value [Integer]
    # @return [self]
    def days(value)
      merge(days: value.to_s)
    end

    # Maximum number of results to return.
    #
    # @param value [Integer]
    # @return [self]
    def limit(value)
      merge(limit: value.to_s)
    end

    # Show changes since then.
    #
    # @param value [Time]
    # @return [self]
    def from(value)
      merge(from: value.iso8601)
    end

    # Hide minor changes.
    #
    # @return [self]
    def hideminor()
      merge(hideminor: 'true')
    end

    # Hide changes made by bots.
    #
    # @return [self]
    def hidebots()
      merge(hidebots: 'true')
    end

    # Hide changes made by anonymous users.
    #
    # @return [self]
    def hideanons()
      merge(hideanons: 'true')
    end

    # Hide changes made by registered users.
    #
    # @return [self]
    def hideliu()
      merge(hideliu: 'true')
    end

    # Hide patrolled changes.
    #
    # @return [self]
    def hidepatrolled()
      merge(hidepatrolled: 'true')
    end

    # Hide changes made by the current user.
    #
    # @return [self]
    def hidemyself()
      merge(hidemyself: 'true')
    end

    # Hide category membership changes.
    #
    # @return [self]
    def hidecategorization()
      merge(hidecategorization: 'true')
    end

    # Filter by tag.
    #
    # @param value [String]
    # @return [self]
    def tagfilter(value)
      merge(tagfilter: value.to_s)
    end

    # Show only changes on pages linked from this page.
    #
    # @param value [String]
    # @return [self]
    def target(value)
      merge(target: value.to_s)
    end

    # Show changes on pages linked to the selected page instead.
    #
    # @return [self]
    def showlinkedto()
      merge(showlinkedto: 'true')
    end
  end
end
