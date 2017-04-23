# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # List change tags. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.tags(**options).perform # returns string with raw output
  # # or
  # api.some_action.tags(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.tags.continue(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Tags

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(tgcontinue: value.to_s)
    end

    # The maximum number of tags to list.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(tglimit: value.to_s)
    end

    # Which properties to get:
    #
    # @param values [Array<String>] Allowed values: "name" (Adds name of tag), "displayname" (Adds system message for the tag), "description" (Adds description of the tag), "hitcount" (Adds the number of revisions and log entries that have this tag), "defined" (Indicate whether the tag is defined), "source" (Gets the sources of the tag, which may include extension for extension-defined tags and manual for tags that may be applied manually by users), "active" (Whether the tag is still being applied).
    # @return [self]
    def prop(*values)
      merge(tgprop: values.join('|'))
    end
  end
end
