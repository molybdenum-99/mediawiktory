module MediaWiktory::Wikipedia::Modules
  # Returns all redirects to the given pages. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.redirects(**options).perform # returns string with raw output
  # # or
  # api.some_action.redirects(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.redirects.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Redirects < MediaWiktory::Submodule
    # Which properties to get:
    #
    # @param values [Array<String>] Allowed values: "pageid" (Page ID of each redirect), "title" (Title of each redirect), "fragment" (Fragment of each redirect, if any).
    # @return [self]
    def prop(*values)
      merge(rdprop: values.join('|'))
    end
    # Only include pages in these namespaces.
    #
    # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(rdnamespace: values.join('|'))
    end
    # Show only items that meet these criteria:
    #
    # @param values [Array<String>] Allowed values: "fragment" (Only show redirects with a fragment), "!fragment" (Only show redirects without a fragment).
    # @return [self]
    def show(*values)
      merge(rdshow: values.join('|'))
    end
    # How many redirects to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(rdlimit: value.to_s)
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(rdcontinue: value.to_s)
    end

  end
end
