module MediaWiktory
  class Templatedata < MWModule
    symbol :templatedata
    param :titles, Params::List[Params::String]
    param :pageids, Params::List[Params::Integer]
    param :revids, Params::List[Params::Integer]
    param :generator, Params::Module[:gallcategories, :galldeletedrevisions, :gallfileusages, :gallimages, :galllinks, :gallpages, :gallredirects, :galltransclusions, :gbacklinks, :gcategories, :gcategorymembers, :gcontenttranslation, :gcontenttranslationsuggestions, :gdeletedrevisions, :gduplicatefiles, :gembeddedin, :gexturlusage, :gfileusage, :ggeosearch, :ggettingstartedgetpages, :gimages, :gimageusage, :giwbacklinks, :glangbacklinks, :glinks, :glinkshere, :glistpages, :goldreviewedpages, :gpageswithprop, :gprefixsearch, :gprotectedtitles, :gquerypage, :grandom, :grecentchanges, :gredirects, :grevisions, :gsearch, :gtemplates, :gtranscludedin, :gwatchlist, :gwatchlistraw]
    param :redirects, Params::Boolean
    param :converttitles, Params::Boolean
    param :format, Params::Enum["json", "jsonfm"]
    param :lang, Params::String
  end
end