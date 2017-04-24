# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Display help for the specified modules. 
  #
  # Usage:
  #
  # ```ruby
  # api.help(**options).perform # returns string with raw output
  # # or
  # api.help(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.help.modules(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Help < MediaWiktory::Wikipedia::GetAction

    # Modules to display help for (values of the action and format parameters, or main). Can specify submodules with a +.
    #
    # @param values [Array<String>]
    # @return [self]
    def modules(*values)
      merge(modules: values.join('|'))
    end

    # Include help for submodules of the named module.
    #
    # @return [self]
    def submodules()
      merge(submodules: 'true')
    end

    # Include help for submodules recursively.
    #
    # @return [self]
    def recursivesubmodules()
      merge(recursivesubmodules: 'true')
    end

    # Wrap the output in a standard API response structure.
    #
    # @return [self]
    def wrap()
      merge(wrap: 'true')
    end

    # Include a table of contents in the HTML output.
    #
    # @return [self]
    def toc()
      merge(toc: 'true')
    end
  end
end
