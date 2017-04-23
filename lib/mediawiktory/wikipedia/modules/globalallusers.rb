module MediaWiktory::Wikipedia::Modules
  # Enumerate all global users. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.globalallusers(**options).perform # returns string with raw output
  # # or
  # api.some_action.globalallusers(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.globalallusers.from(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  class Globalallusers < MediaWiktory::Submodule
    # The user name to start enumerating from.
    #
    # @param value [String]
    # @return [self]
    def from(value)
      merge(agufrom: value.to_s)
    end
    # The user name to stop enumerating at.
    #
    # @param value [String]
    # @return [self]
    def to(value)
      merge(aguto: value.to_s)
    end
    # Search for all users that begin with this value.
    #
    # @param value [String]
    # @return [self]
    def prefix(value)
      merge(aguprefix: value.to_s)
    end
    # Direction to sort in.
    #
    # @param value [String] One of "ascending", "descending".
    # @return [self]
    def dir(value)
      merge(agudir: value.to_s)
    end
    # Limit users to given global groups.
    #
    # @param values [Array<String>] Allowed values: "OTRS-member", "abusefilter-helper", "apihighlimits-requestor", "captcha-exempt", "delete-global", "founder", "global-bot", "global-flow-create", "global-interface-editor", "global-ipblock-exempt", "global-rollbacker", "global-sysop", "new-wikis-importer", "oathauth-tester", "ombudsman", "recursive-export", "staff", "steward", "sysadmin", "wmf-ops-monitoring", "wmf-researcher".
    # @return [self]
    def group(*values)
      merge(agugroup: values.join('|'))
    end
    # Exclude users in given global groups.
    #
    # @param values [Array<String>] Allowed values: "OTRS-member", "abusefilter-helper", "apihighlimits-requestor", "captcha-exempt", "delete-global", "founder", "global-bot", "global-flow-create", "global-interface-editor", "global-ipblock-exempt", "global-rollbacker", "global-sysop", "new-wikis-importer", "oathauth-tester", "ombudsman", "recursive-export", "staff", "steward", "sysadmin", "wmf-ops-monitoring", "wmf-researcher".
    # @return [self]
    def excludegroup(*values)
      merge(aguexcludegroup: values.join('|'))
    end
    # What pieces of information to include:
    #
    # @param values [Array<String>] Allowed values: "lockinfo" (Whether the user account is locked), "groups" (Lists global groups that the user is in. This uses more server resources and may return fewer results than the limit), "existslocally" (Adds the information if the user exists locally).
    # @return [self]
    def prop(*values)
      merge(aguprop: values.join('|'))
    end
    # How many total user names to return.
    #
    # @param value [Integer, "max"]
    # @return [self]
    def limit(value)
      merge(agulimit: value.to_s)
    end

  end
end