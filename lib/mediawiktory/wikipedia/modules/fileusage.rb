# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Find all pages that use the given files. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.fileusage(**options).perform # returns string with raw output
    # # or
    # api.some_action.fileusage(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.fileusage.prop(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Fileusage

    # Which properties to get:
    #
    # @param values [Array<String>] Allowed values: "pageid" (Page ID of each page), "title" (Title of each page), "redirect" (Flag if the page is a redirect).
    # @return [self]
    def prop(*values)
      merge(fuprop: values.join('|'))
    end

    # Only include pages in these namespaces.
    #
    # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(funamespace: values.join('|'))
    end

    # Show only items that meet these criteria:
    #
    # @param values [Array<String>] Allowed values: "redirect" (Only show redirects), "!redirect" (Only show non-redirects).
    # @return [self]
    def show(*values)
      merge(fushow: values.join('|'))
    end

    # How many to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(fulimit: value.to_s)
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(fucontinue: value.to_s)
    end
  end
  end
end
