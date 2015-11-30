module MediaWiktory
  class Setnotificationtimestamp < Action
    symbol :setnotificationtimestamp
    post!
    param :entirewatchlist, Params::Boolean
    param :timestamp, Params::Timestamp
    param :torevid, Params::Integer
    param :newerthanrevid, Params::Integer
    param :continue, Params::String
    param :titles, Params::List[Params::String]
    param :pageids, Params::List[Params::Integer]
    param :revids, Params::List[Params::Integer]
    param :generator, Params::Module[:allcategories, :alldeletedrevisions, :allfileusages, :allimages, :alllinks, :allpages, :allredirects, :alltransclusions, :backlinks, :categories, :categorymembers, :contenttranslation, :contenttranslationsuggestions, :deletedrevisions, :duplicatefiles, :embeddedin, :exturlusage, :fileusage, :geosearch, :gettingstartedgetpages, :images, :imageusage, :iwbacklinks, :langbacklinks, :links, :linkshere, :listpages, :oldreviewedpages, :pageswithprop, :prefixsearch, :protectedtitles, :querypage, :random, :recentchanges, :redirects, :revisions, :search, :templates, :transcludedin, :watchlist, :watchlistraw]
    param :redirects, Params::Boolean
    param :converttitles, Params::Boolean
    param :token, Params::String
  end
end