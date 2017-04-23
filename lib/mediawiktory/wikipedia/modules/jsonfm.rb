# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Output data in JSON format (pretty-print in HTML). 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.jsonfm(**options).perform # returns string with raw output
  # # or
  # api.some_action.jsonfm(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.jsonfm.wrappedhtml(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Jsonfm
    # Return the pretty-printed HTML and associated ResourceLoader modules as a JSON object.
    #
    # @return [self]
    def wrappedhtml()
      merge(wrappedhtml: 'true')
    end
    # If specified, wraps the output into a given function call. For safety, all user-specific data will be restricted.
    #
    # @param value [String]
    # @return [self]
    def callback(value)
      merge(callback: value.to_s)
    end
    # If specified, encodes most (but not all) non-ASCII characters as UTF-8 instead of replacing them with hexadecimal escape sequences. Default when formatversion is not 1.
    #
    # @return [self]
    def utf8()
      merge(utf8: 'true')
    end
    # If specified, encodes all non-ASCII using hexadecimal escape sequences. Default when formatversion is 1.
    #
    # @return [self]
    def ascii()
      merge(ascii: 'true')
    end
    # Output formatting:
    #
    # @param value [String] One of "1" (Backwards-compatible format (XML-style booleans, * keys for content nodes, etc.)), "2" (Experimental modern format. Details may change!), "latest" (Use the latest format (currently 2), may change without warning).
    # @return [self]
    def formatversion(value)
      merge(formatversion: value.to_s)
    end
  end
end
