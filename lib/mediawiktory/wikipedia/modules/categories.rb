# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # List all categories the pages belong to. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.categories(**options).perform # returns string with raw output
  # # or
  # api.some_action.categories(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.categories.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Categories
    # Which additional properties to get for each category:
    #
    # @param values [Array<String>] Allowed values: "sortkey" (Adds the sortkey (hexadecimal string) and sortkey prefix (human-readable part) for the category), "timestamp" (Adds timestamp of when the category was added), "hidden" (Tags categories that are hidden with __HIDDENCAT__).
    # @return [self]
    def prop(*values)
      merge(clprop: values.join('|'))
    end
    # Which kind of categories to show.
    #
    # @param values [Array<String>] Allowed values: "hidden", "!hidden".
    # @return [self]
    def show(*values)
      merge(clshow: values.join('|'))
    end
    # How many categories to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(cllimit: value.to_s)
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(clcontinue: value.to_s)
    end
    # Only list these categories. Useful for checking whether a certain page is in a certain category.
    #
    # @param values [Array<String>]
    # @return [self]
    def categories(*values)
      merge(clcategories: values.join('|'))
    end
    # The direction in which to list.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(cldir: value.to_s)
    end
  end
end
