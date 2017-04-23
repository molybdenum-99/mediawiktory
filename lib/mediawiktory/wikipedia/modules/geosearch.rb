module MediaWiktory::Wikipedia::Modules
  # Returns pages having coordinates that are located in a certain area. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.geosearch(**options).perform # returns string with raw output
  # # or
  # api.some_action.geosearch(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.geosearch.coord(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Geosearch
    # Coordinate around which to search.
    #
    # @param value [String]
    # @return [self]
    def coord(value)
      merge(gscoord: value.to_s)
    end
    # Title of page around which to search.
    #
    # @param value [String]
    # @return [self]
    def page(value)
      merge(gspage: value.to_s)
    end
    # Bounding box to search in: pipe (|) separated coordinates of top left and bottom right corners.
    #
    # @param value [String]
    # @return [self]
    def bbox(value)
      merge(gsbbox: value.to_s)
    end
    # Search radius in meters.
    #
    # @param value [Integer]
    # @return [self]
    def radius(value)
      merge(gsradius: value.to_s)
    end
    # Restrict search to objects no larger than this, in meters.
    #
    # @param value [Integer]
    # @return [self]
    def maxdim(value)
      merge(gsmaxdim: value.to_s)
    end
    # Maximum number of pages to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(gslimit: value.to_s)
    end
    # Globe to search on (by default "earth").
    #
    # @param value [String] One of "earth".
    # @return [self]
    def globe(value)
      merge(gsglobe: value.to_s)
    end
    # Namespaces to search.
    #
    # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(gsnamespace: values.join('|'))
    end
    # Which additional coordinate properties to return.
    #
    # @param values [Array<String>] Allowed values: "type", "name", "dim", "country", "region", "globe".
    # @return [self]
    def prop(*values)
      merge(gsprop: values.join('|'))
    end
    # Whether to return only primary coordinates ("primary"), secondary ("secondary") or both ("all").
    #
    # @param value [String] One of "primary", "secondary", "all".
    # @return [self]
    def primary(value)
      merge(gsprimary: value.to_s)
    end
    # Whether debug information should be returned.
    #
    # @return [self]
    def debug()
      merge(gsdebug: 'true')
    end
  end
end
