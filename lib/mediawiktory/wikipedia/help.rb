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
# api.help.modules(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Help < GetAction
  # Modules to display help for (values of the action and format parameters, or main). Can specify submodules with a +.
  #
  # @param values [Array<String>]
  # @return [self]
  def modules(*values)
    merge(modules: values.join('|'))
  end
  # Include help for submodules of the named module.
  #
  # @param value [true, false]
  # @return [self]
  def submodules(value = true)
    merge(submodules: 'true') if value
  end
  # Include help for submodules recursively.
  #
  # @param value [true, false]
  # @return [self]
  def recursivesubmodules(value = true)
    merge(recursivesubmodules: 'true') if value
  end
  # Wrap the output in a standard API response structure.
  #
  # @param value [true, false]
  # @return [self]
  def wrap(value = true)
    merge(wrap: 'true') if value
  end
  # Include a table of contents in the HTML output.
  #
  # @param value [true, false]
  # @return [self]
  def toc(value = true)
    merge(toc: 'true') if value
  end

end