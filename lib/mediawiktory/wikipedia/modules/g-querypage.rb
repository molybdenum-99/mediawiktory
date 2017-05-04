# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Modules
    # Generator module.
    #
    # All submodule's parameters are documented as its public methods, see below.
    #
    module GQuerypage

      # The name of the special page. Note, this is case sensitive.
      #
      # @param value [String] One of "Ancientpages", "BrokenRedirects", "Deadendpages", "DoubleRedirects", "ListDuplicatedFiles", "Listredirects", "Lonelypages", "Longpages", "MediaStatistics", "Mostcategories", "Mostimages", "Mostinterwikis", "Mostlinkedcategories", "Mostlinkedtemplates", "Mostlinked", "Mostrevisions", "Fewestrevisions", "Shortpages", "Uncategorizedcategories", "Uncategorizedpages", "Uncategorizedimages", "Uncategorizedtemplates", "Unusedcategories", "Unusedimages", "Wantedcategories", "Wantedfiles", "Wantedpages", "Wantedtemplates", "Unwatchedpages", "Unusedtemplates", "Withoutinterwiki", "UnconnectedPages", "PagesWithBadges", "EntityUsage", "GadgetUsage", "MostGloballyLinkedFiles", "GloballyWantedFiles", "DisambiguationPages", "DisambiguationPageLinks".
      # @return [self]
      def page(value)
        defined?(super) && super || ["Ancientpages", "BrokenRedirects", "Deadendpages", "DoubleRedirects", "ListDuplicatedFiles", "Listredirects", "Lonelypages", "Longpages", "MediaStatistics", "Mostcategories", "Mostimages", "Mostinterwikis", "Mostlinkedcategories", "Mostlinkedtemplates", "Mostlinked", "Mostrevisions", "Fewestrevisions", "Shortpages", "Uncategorizedcategories", "Uncategorizedpages", "Uncategorizedimages", "Uncategorizedtemplates", "Unusedcategories", "Unusedimages", "Wantedcategories", "Wantedfiles", "Wantedpages", "Wantedtemplates", "Unwatchedpages", "Unusedtemplates", "Withoutinterwiki", "UnconnectedPages", "PagesWithBadges", "EntityUsage", "GadgetUsage", "MostGloballyLinkedFiles", "GloballyWantedFiles", "DisambiguationPages", "DisambiguationPageLinks"].include?(value.to_s) && merge(gqppage: value.to_s)
      end

      # When more results are available, use this to continue.
      #
      # @param value [Integer]
      # @return [self]
      def offset(value)
        merge(gqpoffset: value.to_s)
      end

      # Number of results to return.
      #
      # @param value [Integer, "max"]
      # @return [self]
      def limit(value)
        merge(gqplimit: value.to_s)
      end
    end
  end
end
