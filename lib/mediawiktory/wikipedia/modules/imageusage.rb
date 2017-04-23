# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Find all pages that use the given image title. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.imageusage(**options).perform # returns string with raw output
  # # or
  # api.some_action.imageusage(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.imageusage.title(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Imageusage

    # Title to search. Cannot be used together with iupageid.
    #
    # @param value [String]
    # @return [self]
    def title(value)
      merge(iutitle: value.to_s)
    end

    # Page ID to search. Cannot be used together with iutitle.
    #
    # @param value [Integer]
    # @return [self]
    def pageid(value)
      merge(iupageid: value.to_s)
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(iucontinue: value.to_s)
    end

    # The namespace to enumerate.
    #
    # @param values [Array<String>] Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(*values)
      merge(iunamespace: values.join('|'))
    end

    # The direction in which to list.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(iudir: value.to_s)
    end

    # How to filter for redirects. If set to nonredirects when iuredirect is enabled, this is only applied to the second level.
    #
    # @param value [String] One of "all", "redirects", "nonredirects".
    # @return [self]
    def filterredir(value)
      merge(iufilterredir: value.to_s)
    end

    # How many total pages to return. If iuredirect is enabled, the limit applies to each level separately (which means up to 2 * iulimit results may be returned).
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(iulimit: value.to_s)
    end

    # If linking page is a redirect, find all pages that link to that redirect as well. Maximum limit is halved.
    #
    # @return [self]
    def redirect()
      merge(iuredirect: 'true')
    end
  end
end
