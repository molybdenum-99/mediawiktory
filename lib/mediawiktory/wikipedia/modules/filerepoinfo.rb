# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Return meta information about image repositories configured on the wiki. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.filerepoinfo(**options).perform # returns string with raw output
    # # or
    # api.some_action.filerepoinfo(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.filerepoinfo.prop(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Filerepoinfo

      # Which repository properties to get (there may be more available on some wikis):
      #
      # @param values [Array<String>] Allowed values: "apiurl" (URL to the repository API - helpful for getting image info from the host), "name" (The key of the repository - used in e.g. $wgForeignFileRepos and imageinfo return values), "displayname" (The human-readable name of the repository wiki), "rooturl" (Root URL for image paths), "local" (Whether that repository is the local one or not).
      # @return [self]
      def prop(*values)
        merge(friprop: values.join('|'))
      end
    end
  end
end
