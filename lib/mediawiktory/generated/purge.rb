module MediaWiktory
  class Purge < Action
    symbol :purge
    post!
    param :forcelinkupdate, Params::Boolean
    param :forcerecursivelinkupdate, Params::Boolean
    param :continue, Params::String
    param :titles, Params::List[Params::String]
    param :pageids, Params::List[Params::Integer]
    param :revids, Params::List[Params::Integer]
    param :generator, Params::Module[:allcategories, :alldeletedrevisions, :allfileusages, :allimages, :alllinks, :allpages, :allredirects, :allrevisions, :alltransclusions, :backlinks, :categories, :categorymembers, :contenttranslation, :contenttranslationsuggestions, :deletedrevisions, :duplicatefiles, :embeddedin, :exturlusage, :fileusage, :geosearch, :gettingstartedgetpages, :images, :imageusage, :iwbacklinks, :langbacklinks, :links, :linkshere, :mostviewed, :oldreviewedpages, :pageswithprop, :prefixsearch, :projectpages, :protectedtitles, :querypage, :random, :recentchanges, :redirects, :revisions, :search, :templates, :transcludedin, :watchlist, :watchlistraw, :wblistentityusage]
    param :redirects, Params::Boolean
    param :converttitles, Params::Boolean
  end
end