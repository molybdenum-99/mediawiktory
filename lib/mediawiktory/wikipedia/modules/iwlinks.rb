module MediaWiktory::Wikipedia::Modules
  # Returns all interwiki links from the given pages. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.iwlinks(**options).perform # returns string with raw output
  # # or
  # api.some_action.iwlinks(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.iwlinks.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Iwlinks < MediaWiktory::Submodule
    # Which additional properties to get for each interlanguage link:
    #
    # @param values [Array<String>] Allowed values: "url" (Adds the full URL).
    # @return [self]
    def prop(*values)
      merge(iwprop: values.join('|'))
    end
    # Only return interwiki links with this prefix.
    #
    # @param value [String]
    # @return [self]
    def prefix(value)
      merge(iwprefix: value.to_s)
    end
    # Interwiki link to search for. Must be used with iwprefix.
    #
    # @param value [String]
    # @return [self]
    def title(value)
      merge(iwtitle: value.to_s)
    end
    # The direction in which to list.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(iwdir: value.to_s)
    end
    # How many interwiki links to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(iwlimit: value.to_s)
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(iwcontinue: value.to_s)
    end
    # Whether to get the full URL (cannot be used with iwprop).
    #
    # @return [self]
    def url()
      merge(iwurl: 'true')
    end

  end
end