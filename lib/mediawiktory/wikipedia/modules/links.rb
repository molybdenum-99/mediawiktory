module MediaWiktory::Wikipedia::Modules
  # Returns all links from the given pages. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.links(**options).perform # returns string with raw output
  # # or
  # api.some_action.links(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.links.namespace(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Links < MediaWiktory::Submodule
    # Show links in these namespaces only.
    #
    # @param values [Array<String>] Allowed values: "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(plnamespace: values.join('|'))
    end
    # How many links to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(pllimit: value.to_s)
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(plcontinue: value.to_s)
    end
    # Only list links to these titles. Useful for checking whether a certain page links to a certain title.
    #
    # @param values [Array<String>]
    # @return [self]
    def titles(*values)
      merge(pltitles: values.join('|'))
    end
    # The direction in which to list.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(pldir: value.to_s)
    end

  end
end