module MediaWiktory::Wikipedia::Modules
  # List all the projects. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.projects(**options).perform # returns string with raw output
  # # or
  # api.some_action.projects(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.projects.subprojects(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Projects < MediaWiktory::Submodule
    # Also include subprojects.
    #
    # @return [self]
    def subprojects()
      merge(pjsubprojects: 'true')
    end

  end
end