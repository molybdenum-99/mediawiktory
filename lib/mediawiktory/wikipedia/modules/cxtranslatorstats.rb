# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Fetch the translation statistics for the given user. 
    #
    # The "submodule" (MediaWiki API term) is included in action after setting some param, providing
    # additional tweaking for this param. Example (for {MediaWiktory::Wikipedia::Actions::Query} and
    # its submodules):
    #
    # ```ruby
    # api.query             # returns Actions::Query
    #    .prop(:revisions)  # adds prop=revisions to action URL, and includes Modules::Revisions into action
    #    .limit(10)         # method of Modules::Revisions, adds rvlimit=10 to URL
    # ```
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
