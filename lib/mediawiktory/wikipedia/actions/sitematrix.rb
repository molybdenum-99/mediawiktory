module MediaWiktory::Wikipedia::Actions
  # Get Wikimedia sites list. 
  #
  # Usage:
  #
  # ```ruby
  # api.sitematrix(**options).perform # returns string with raw output
  # # or
  # api.sitematrix(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.sitematrix.type(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Sitematrix < MediaWiktory::GetAction
    # Filter the Site Matrix by type:
    #
    # @param values [Array<String>] Allowed values: "special" (One off and multilingual Wikimedia projects), "language" (Wikimedia projects under this language code).
    # @return [self]
    def type(*values)
      merge(smtype: values.join('|'))
    end
    # Filter the Site Matrix by wiki state:
    #
    # @param values [Array<String>] Allowed values: "all", "closed", "private", "fishbowl", "nonglobal".
    # @return [self]
    def state(*values)
      merge(smstate: values.join('|'))
    end
    # Which information about a language to return.
    #
    # @param values [Array<String>] Allowed values: "code", "name", "site", "localname".
    # @return [self]
    def langprop(*values)
      merge(smlangprop: values.join('|'))
    end
    # Which information about a site to return.
    #
    # @param values [Array<String>] Allowed values: "url", "dbname", "code", "sitename".
    # @return [self]
    def siteprop(*values)
      merge(smsiteprop: values.join('|'))
    end
    # Maximum number of results.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(smlimit: value.to_s)
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(smcontinue: value.to_s)
    end

  end
end
