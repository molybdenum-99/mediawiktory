module MediaWiktory::Wikipedia::Actions
  # Get a list of page IDs for building a PageTriage queue. 
  #
  # Usage:
  #
  # ```ruby
  # api.pagetriagelist(**options).perform # returns string with raw output
  # # or
  # api.pagetriagelist(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.pagetriagelist.page_id(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Pagetriagelist < MediaWiktory::GetAction
    # Return data for the specified page IDs, ignoring other parameters.
    #
    # @param value [Integer]
    # @return [self]
    def page_id(value)
      merge(page_id: value.to_s)
    end
    # Whether to show only bot edits.
    #
    # @return [self]
    def showbots()
      merge(showbots: 'true')
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
    # The maximum number of results to return.
    #
    # @param value [Integer]
    # @return [self]
    def limit(value)
      merge(limit: value.to_s)
    end
    # Timestamp to start from.
    #
    # @param value [Integer]
    # @return [self]
    def offset(value)
      merge(offset: value.to_s)
    end
    # Page ID to start from (requires offset param to be passed as well).
    #
    # @param value [Integer]
    # @return [self]
    def pageoffset(value)
      merge(pageoffset: value.to_s)
    end
    # The direction the list should be sorted in - oldestfirst or newestfirst.
    #
    # @param value [String]
    # @return [self]
    def dir(value)
      merge(dir: value.to_s)
    end
    # What namespace to pull pages from.
    #
    # @param value [Integer]
    # @return [self]
    def namespace(value)
      merge(namespace: value.to_s)
    end
    # Whether to show only pages with no category.
    #
    # @return [self]
    def no_category()
      merge(no_category: 'true')
    end
    # Whether to show only pages with no inbound links.
    #
    # @return [self]
    def no_inbound_links()
      merge(no_inbound_links: 'true')
    end
    # Whether to show only pages created by non auto confirmed users.
    #
    # @return [self]
    def non_autoconfirmed_users()
      merge(non_autoconfirmed_users: 'true')
    end
    # Whether to show only pages created by blocked users.
    #
    # @return [self]
    def blocked_users()
      merge(blocked_users: 'true')
    end
    # Show only pages created by username.
    #
    # @param value [String]
    # @return [self]
    def username(value)
      merge(username: value.to_s)
    end

  end
end