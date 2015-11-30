module MediaWiktory
  class Editlist < Action
    symbol :editlist
    post!
    param :id, Params::Integer
    param :label, Params::String
    param :perm, Params::Enum["public", "private"]
    param :description, Params::String
    param :image, Params::String
    param :mode, Params::Enum["update", "remove", "deletelist", "hidelist", "showlist", "flag", "approve"]
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