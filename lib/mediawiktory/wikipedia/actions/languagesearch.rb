module MediaWiktory::Wikipedia::Actions
  # Search for language names in any script. 
  #
  # Usage:
  #
  # ```ruby
  # api.languagesearch(**options).perform # returns string with raw output
  # # or
  # api.languagesearch(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.languagesearch.search(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Languagesearch < MediaWiktory::GetAction
    # Search string.
    #
    # @param value [String]
    # @return [self]
    def search(value)
      merge(search: value.to_s)
    end
    # Number of spelling mistakes allowed in the search string.
    #
    # @param value [Integer]
    # @return [self]
    def typos(value)
      merge(typos: value.to_s)
    end

  end
end