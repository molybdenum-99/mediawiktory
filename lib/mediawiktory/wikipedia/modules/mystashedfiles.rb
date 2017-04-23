# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Get a list of files in the current user's upload stash. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.mystashedfiles(**options).perform # returns string with raw output
  # # or
  # api.some_action.mystashedfiles(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.mystashedfiles.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Mystashedfiles
    # Which properties to fetch for the files.
    #
    # @param values [Array<String>] Allowed values: "size" (Fetch the file size and image dimensions), "type" (Fetch the file's MIME type and media type).
    # @return [self]
    def prop(*values)
      merge(msfprop: values.join('|'))
    end
    # How many files to get.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(msflimit: value.to_s)
    end
    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(msfcontinue: value.to_s)
    end
  end
end
