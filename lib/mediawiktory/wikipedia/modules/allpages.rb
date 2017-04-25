# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Enumerate all pages sequentially in a given namespace. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.allpages(**options).perform # returns string with raw output
    # # or
    # api.some_action.allpages(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.allpages.from(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Allpages

    # The page title to start enumerating from.
    #
    # @param value [String]
    # @return [self]
    def from(value)
      merge(apfrom: value.to_s)
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(apcontinue: value.to_s)
    end

    # The page title to stop enumerating at.
    #
    # @param value [String]
    # @return [self]
    def to(value)
      merge(apto: value.to_s)
    end

    # Search for all page titles that begin with this value.
    #
    # @param value [String]
    # @return [self]
    def prefix(value)
      merge(apprefix: value.to_s)
    end

    # The namespace to enumerate.
    #
    # @param value [String] One of "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
    # @return [self]
    def namespace(value)
      merge(apnamespace: value.to_s)
    end

    # Which pages to list.
    #
    # @param value [String] One of "all", "redirects", "nonredirects".
    # @return [self]
    def filterredir(value)
      merge(apfilterredir: value.to_s)
    end

    # Limit to pages with at least this many bytes.
    #
    # @param value [Integer]
    # @return [self]
    def minsize(value)
      merge(apminsize: value.to_s)
    end

    # Limit to pages with at most this many bytes.
    #
    # @param value [Integer]
    # @return [self]
    def maxsize(value)
      merge(apmaxsize: value.to_s)
    end

    # Limit to protected pages only.
    #
    # @param values [Array<String>] Allowed values: "edit", "move", "upload".
    # @return [self]
    def prtype(*values)
      merge(apprtype: values.join('|'))
    end

    # Filter protections based on protection level (must be used with apprtype= parameter).
    #
    # @param values [Array<String>] Allowed values: "autoconfirmed", "extendedconfirmed", "templateeditor", "sysop".
    # @return [self]
    def prlevel(*values)
      merge(apprlevel: values.join('|'))
    end

    # Filter protections based on cascadingness (ignored when apprtype isn't set).
    #
    # @param value [String] One of "cascading", "noncascading", "all".
    # @return [self]
    def prfiltercascade(value)
      merge(apprfiltercascade: value.to_s)
    end

    # How many total pages to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(aplimit: value.to_s)
    end

    # The direction in which to list.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(apdir: value.to_s)
    end

    # Filter based on whether a page has langlinks. Note that this may not consider langlinks added by extensions.
    #
    # @param value [String] One of "withlanglinks", "withoutlanglinks", "all".
    # @return [self]
    def filterlanglinks(value)
      merge(apfilterlanglinks: value.to_s)
    end

    # Which protection expiry to filter the page on:
    #
    # @param value [String] One of "indefinite" (Get only pages with indefinite protection expiry), "definite" (Get only pages with a definite (specific) protection expiry), "all" (Get pages with any protections expiry).
    # @return [self]
    def prexpiry(value)
      merge(apprexpiry: value.to_s)
    end
  end
  end
end
