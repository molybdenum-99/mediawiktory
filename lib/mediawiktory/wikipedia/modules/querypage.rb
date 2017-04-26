# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Get a list provided by a QueryPage-based special page. 
    #
    # Usage:
    #
    # ```ruby
    # api.some_action.querypage(**options).perform # returns string with raw output
    # # or
    # api.some_action.querypage(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.some_action.querypage.page(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions and their
    # submodules.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module Querypage

      # The name of the special page. Note, this is case sensitive.
      #
      # @param value [String] One of "Ancientpages", "BrokenRedirects", "Deadendpages", "DoubleRedirects", "ListDuplicatedFiles", "Listredirects", "Lonelypages", "Longpages", "MediaStatistics", "Mostcategories", "Mostimages", "Mostinterwikis", "Mostlinkedcategories", "Mostlinkedtemplates", "Mostlinked", "Mostrevisions", "Fewestrevisions", "Shortpages", "Uncategorizedcategories", "Uncategorizedpages", "Uncategorizedimages", "Uncategorizedtemplates", "Unusedcategories", "Unusedimages", "Wantedcategories", "Wantedfiles", "Wantedpages", "Wantedtemplates", "Unwatchedpages", "Unusedtemplates", "Withoutinterwiki", "UnconnectedPages", "PagesWithBadges", "EntityUsage", "GadgetUsage", "MostGloballyLinkedFiles", "GloballyWantedFiles", "DisambiguationPages", "DisambiguationPageLinks".
      # @return [self]
      def page(value)
        merge(qppage: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def offset(value)
        merge(qpoffset: value.to_s)
      end

      # Number of results to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(qplimit: value.to_s)
      end
  end
  end
end
