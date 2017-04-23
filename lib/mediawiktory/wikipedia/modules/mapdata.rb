module MediaWiktory::Wikipedia::Modules
  # Request all map data from the page Metallica 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.mapdata(**options).perform # returns string with raw output
  # # or
  # api.some_action.mapdata(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.mapdata.groups(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Mapdata < MediaWiktory::Submodule
    # Pipe-separated groups to return data for
    #
    # @param value [String]
    # @return [self]
    def groups(value)
      merge(mpdgroups: value.to_s)
    end
    # Data for how many pages to return
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(mpdlimit: value.to_s)
    end
    # When more results are available, use this to continue.
    #
    # @param value [Integer]
    # @return [self]
    def continue(value)
      merge(mpdcontinue: value.to_s)
    end

  end
end
