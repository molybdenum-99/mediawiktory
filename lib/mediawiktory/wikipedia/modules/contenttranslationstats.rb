# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get Content Translation statistics. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.contenttranslationstats(**options).perform # returns string with raw output
    # # or
    # api.some_action.contenttranslationstats(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.contenttranslationstats.(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Contenttranslationstats
    end
  end
end
