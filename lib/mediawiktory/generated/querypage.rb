module MediaWiktory
  class Querypage < MWModule
    symbol :querypage
    prefix "qp"
    param :page, Params::Enum[:Ancientpages, :BrokenRedirects, :Deadendpages, :DoubleRedirects, :ListDuplicatedFiles, :Listredirects, :Lonelypages, :Longpages, :MediaStatistics, :Mostcategories, :Mostimages, :Mostinterwikis, :Mostlinkedcategories, :Mostlinkedtemplates, :Mostlinked, :Mostrevisions, :Fewestrevisions, :Shortpages, :Uncategorizedcategories, :Uncategorizedpages, :Uncategorizedimages, :Uncategorizedtemplates, :Unusedcategories, :Unusedimages, :Wantedcategories, :Wantedfiles, :Wantedpages, :Wantedtemplates, :Unwatchedpages, :Unusedtemplates, :Withoutinterwiki, :DisambiguationPages, :DisambiguationPageLinks, :UnconnectedPages, :PagesWithBadges]
    param :offset, Params::Integer
    param :limit, Params::IntegerOrMax
  end
end