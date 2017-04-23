# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Internal module for the CategoryTree extension. 
  #
  # Usage:
  #
  # ```ruby
  # api.categorytree(**options).perform # returns string with raw output
  # # or
  # api.categorytree(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.categorytree.category(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Categorytree < MediaWiktory::GetAction

    # Title in the category namespace, prefix will be ignored if given.
    #
    # @param value [String]
    # @return [self]
    def category(value)
      merge(category: value.to_s)
    end

    # Options for the CategoryTree constructor as a JSON object. The depth option defaults to 1.
    #
    # @param value [String]
    # @return [self]
    def options(value)
      merge(options: value.to_s)
    end
  end
end
