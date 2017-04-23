# frozen_string_literal: true

module MediaWiktory::Wikipedia::Modules
  # Return general information about the site. 
  #
  # Usage:
  #
  # ```ruby
  # api.some_action.siteinfo(**options).perform # returns string with raw output
  # # or
  # api.some_action.siteinfo(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.some_action.siteinfo.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
  # submodules.
  #
  # All submodule's parameters are documented as its public methods, see below.
  #
  module Siteinfo
    # Which information to get:
    #
    # @param values [Array<String>] Allowed values: "general" (Overall system information), "namespaces" (List of registered namespaces and their canonical names), "namespacealiases" (List of registered namespace aliases), "specialpagealiases" (List of special page aliases), "magicwords" (List of magic words and their aliases), "interwikimap" (Returns interwiki map (optionally filtered, optionally localised by using siinlanguagecode)), "dbrepllag" (Returns database server with the highest replication lag), "statistics" (Returns site statistics), "usergroups" (Returns user groups and the associated permissions), "libraries" (Returns libraries installed on the wiki), "extensions" (Returns extensions installed on the wiki), "fileextensions" (Returns list of file extensions (file types) allowed to be uploaded), "rightsinfo" (Returns wiki rights (license) information if available), "restrictions" (Returns information on available restriction (protection) types), "languages" (Returns a list of languages MediaWiki supports (optionally localised by using siinlanguagecode)), "languagevariants" (Returns a list of language codes for which LanguageConverter is enabled, and the variants supported for each), "skins" (Returns a list of all enabled skins (optionally localised by using siinlanguagecode, otherwise in the content language)), "extensiontags" (Returns a list of parser extension tags), "functionhooks" (Returns a list of parser function hooks), "showhooks" (Returns a list of all subscribed hooks (contents of $wgHooks)), "variables" (Returns a list of variable IDs), "protocols" (Returns a list of protocols that are allowed in external links), "defaultoptions" (Returns the default values for user preferences), "uploaddialog" (Returns the upload dialog configuration).
    # @return [self]
    def prop(*values)
      merge(siprop: values.join('|'))
    end
    # Return only local or only nonlocal entries of the interwiki map.
    #
    # @param value [String] One of "local", "!local".
    # @return [self]
    def filteriw(value)
      merge(sifilteriw: value.to_s)
    end
    # List all database servers, not just the one lagging the most.
    #
    # @return [self]
    def showalldb()
      merge(sishowalldb: 'true')
    end
    # Lists the number of users in user groups.
    #
    # @return [self]
    def numberingroup()
      merge(sinumberingroup: 'true')
    end
    # Language code for localised language names (best effort) and skin names.
    #
    # @param value [String]
    # @return [self]
    def inlanguagecode(value)
      merge(siinlanguagecode: value.to_s)
    end
  end
end
