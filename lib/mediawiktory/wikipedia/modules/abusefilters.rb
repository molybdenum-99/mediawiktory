module MediaWiktory::Wikipedia::Modules
  # Show details of the abuse filters. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.abusefilters(**options).perform # returns string with raw output
  # # or
  # api.some_action.abusefilters(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.abusefilters.startid(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Abusefilters < MediaWiktory::Submodule
    # The filter ID to start enumerating from.
    #
    # @param value [Integer]
    # @return [self]
    def startid(value)
      merge(abfstartid: value.to_s)
    end
    # The filter ID to stop enumerating at.
    #
    # @param value [Integer]
    # @return [self]
    def endid(value)
      merge(abfendid: value.to_s)
    end
    # In which direction to enumerate:
    #
    # @param value [String] One of "newer" (List oldest first. Note: abfstart has to be before abfend), "older" (List newest first (default). Note: abfstart has to be later than abfend).
    # @return [self]
    def dir(value)
      merge(abfdir: value.to_s)
    end
    # Show only filters which meet these criteria.
    #
    # @param values [Array<String>] Allowed values: "enabled", "!enabled", "deleted", "!deleted", "private", "!private".
    # @return [self]
    def show(*values)
      merge(abfshow: values.join('|'))
    end
    # The maximum number of filters to list.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(abflimit: value.to_s)
    end
    # Which properties to get.
    #
    # @param values [Array<String>] Allowed values: "id", "description", "pattern", "actions", "hits", "comments", "lasteditor", "lastedittime", "status", "private".
    # @return [self]
    def prop(*values)
      merge(abfprop: values.join('|'))
    end

  end
end
