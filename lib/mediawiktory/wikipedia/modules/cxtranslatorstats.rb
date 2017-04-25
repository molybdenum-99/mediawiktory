# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Fetch the translation statistics for the given user. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.cxtranslatorstats(**options).perform # returns string with raw output
    # # or
    # api.some_action.cxtranslatorstats(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.cxtranslatorstats.translator(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Cxtranslatorstats

    # The translator's user name. This parameter is optional. If not passed, the currently logged-in user will be used.
    #
    # @param value [String]
    # @return [self]
    def translator(value)
      merge(translator: value.to_s)
    end
  end
  end
end
