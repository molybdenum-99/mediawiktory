module MediaWiktory::Wikipedia::Modules
  # Get information about the Wikibase client and the associated Wikibase repository. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.wikibase(**options).perform # returns string with raw output
  # # or
  # api.some_action.wikibase(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.wikibase.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Wikibase < MediaWiktory::Submodule
    # Which properties to get:
    #
    # @param values [Array<String>] Allowed values: "url" ( Base URL, script path and article path of the Wikibase repository), "siteid" ( The siteid of this site).
    # @return [self]
    def prop(*values)
      merge(wbprop: values.join('|'))
    end

  end
end