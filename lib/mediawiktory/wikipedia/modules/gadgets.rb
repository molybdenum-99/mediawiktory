module MediaWiktory::Wikipedia::Modules
  # Returns a list of gadgets used on this wiki. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.gadgets(**options).perform # returns string with raw output
  # # or
  # api.some_action.gadgets(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.gadgets.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Gadgets < MediaWiktory::Submodule
    # What gadget information to get:
    #
    # @param values [Array<String>] Allowed values: "id" (Internal gadget ID), "metadata" (The gadget metadata), "desc" (Gadget description transformed into HTML (can be slow, use only if really needed)).
    # @return [self]
    def prop(*values)
      merge(gaprop: values.join('|'))
    end
    # Gadgets from what categories to retrieve.
    #
    # @param values [Array<String>]
    # @return [self]
    def categories(*values)
      merge(gacategories: values.join('|'))
    end
    # IDs of gadgets to retrieve.
    #
    # @param values [Array<String>]
    # @return [self]
    def ids(*values)
      merge(gaids: values.join('|'))
    end
    # List only gadgets allowed to current user.
    #
    # @return [self]
    def allowedonly()
      merge(gaallowedonly: 'true')
    end
    # List only gadgets enabled by current user.
    #
    # @return [self]
    def enabledonly()
      merge(gaenabledonly: 'true')
    end

  end
end