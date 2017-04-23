module MediaWiktory::Wikipedia::Actions
  # Change preferences of the current user. 
  #
  # Usage:
  #
  # ```ruby
  # api.options(**options).perform # returns string with raw output
  # # or
  # api.options(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.options.reset(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Options < MediaWiktory::GetAction
    # Resets preferences to the site defaults.
    #
    # @return [self]
    def reset()
      merge(reset: 'true')
    end
    # List of types of options to reset when the reset option is set.
    #
    # @param values [Array<String>] Allowed values: "registered", "registered-multiselect", "registered-checkmatrix", "userjs", "special", "unused", "all".
    # @return [self]
    def resetkinds(*values)
      merge(resetkinds: values.join('|'))
    end
    # List of changes, formatted name=value (e.g. skin=vector). If no value is given (not even an equals sign), e.g., optionname|otheroption|..., the option will be reset to its default value. If any value passed contains the pipe character (|), use the alternative multiple-value separator for correct operation.
    #
    # @param values [Array<String>]
    # @return [self]
    def change(*values)
      merge(change: values.join('|'))
    end
    # The name of the option that should be set to the value given by optionvalue.
    #
    # @param value [String]
    # @return [self]
    def optionname(value)
      merge(optionname: value.to_s)
    end
    # The value for the option specified by optionname.
    #
    # @param value [String]
    # @return [self]
    def optionvalue(value)
      merge(optionvalue: value.to_s)
    end
    # A "csrf" token retrieved from action=query&meta=tokens
    #
    # @param value [String]
    # @return [self]
    def token(value)
      merge(token: value.to_s)
    end

  end
end
