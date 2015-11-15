module MediaWiktory
  class Watch < MWModule
    symbol :watch
    post!
    param :title, Params::String
    param :unwatch, Params::Boolean
    param :continue, Params::String
    param :titles, Params::List[Params::String]
    param :pageids, Params::List[Params::Integer]
    param :revids, Params::List[Params::Integer]
    param :generator, Params::Module[:gallcategories, :galldeletedrevisions, :gallfileusages, :gallimages, :galllinks, :gallpages, :gallredirects, :galltransclusions, :gbacklinks, :gcategories, :gcategorymembers, :gcontenttranslation, :gcontenttranslationsuggestions, :gdeletedrevisions, :gduplicatefiles, :gembeddedin, :gexturlusage, :gfileusage, :ggeosearch, :ggettingstartedgetpages, :gimages, :gimageusage, :giwbacklinks, :glangbacklinks, :glinks, :glinkshere, :glistpages, :goldreviewedpages, :gpageswithprop, :gprefixsearch, :gprotectedtitles, :gquerypage, :grandom, :grecentchanges, :gredirects, :grevisions, :gsearch, :gtemplates, :gtranscludedin, :gwatchlist, :gwatchlistraw]
    param :redirects, Params::Boolean
    param :converttitles, Params::Boolean
    param :token, Params::String
  end
end