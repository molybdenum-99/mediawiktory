# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get the section-aligned parallel text for a given translation. See also list=cxpublishedtranslations. Dumps are provided in different formats for high volume access. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.contenttranslationcorpora(**options).perform # returns string with raw output
    # # or
    # api.some_action.contenttranslationcorpora(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.contenttranslationcorpora.translationid(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Contenttranslationcorpora

    # ID of the translation.
    #
    # @param value [Integer]
    # @return [self]
    def translationid(value)
      merge(translationid: value.to_s)
    end

    # Whether to strip all HTML tags to return plaintext.
    #
    # @return [self]
    def striphtml()
      merge(striphtml: 'true')
    end

    # By default you will get all three of following if available: source text, machine translation and the postedited translation by the user. This parameter allows you not return some of these types.
    #
    # @param values [Array<String>] Allowed values: "source", "mt", "user".
    # @return [self]
    def types(*values)
      merge(types: values.join('|'))
    end
  end
  end
end
