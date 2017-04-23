module MediaWiktory::Wikipedia::Actions
  # Get the localization of ULS in the given language. 
  #
  # Usage:
  #
  # ```ruby
  # api.ulslocalization(**options).perform # returns string with raw output
  # # or
  # api.ulslocalization(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.ulslocalization.language(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Ulslocalization < MediaWiktory::GetAction
    # Language code.
    #
    # @param value [String]
    # @return [self]
    def language(value)
      merge(language: value.to_s)
    end

  end
end
