# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Enumerate all global groups. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.globalgroups(**options).perform # returns string with raw output
    # # or
    # api.some_action.globalgroups(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.globalgroups.prop(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Globalgroups

    # What pieces of information to include.
    #
    # @param values [Array<String>] Allowed values: "rights".
    # @return [self]
    def prop(*values)
      merge(ggpprop: values.join('|'))
    end
  end
  end
end
