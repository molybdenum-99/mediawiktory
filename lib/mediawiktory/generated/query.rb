module MediaWiktory
  class Query < Action
    symbol :query
    param :prop, Params::List[Params::Module[:categories, :categoryinfo, :contributors, :coordinates, :deletedrevisions, :duplicatefiles, :extlinks, :extracts, :fileusage, :flagged, :flowinfo, :globalusage, :imageinfo, :images, :info, :iwlinks, :langlinks, :links, :linkshere, :listmembership, :pageimages, :pageprops, :pageterms, :redirects, :revisions, :stashimageinfo, :templates, :transcludedin, :transcodestatus, :videoinfo]]
    param :list, Params::List[Params::Module[:abusefilters, :abuselog, :allcategories, :alldeletedrevisions, :allfileusages, :allimages, :alllinks, :allpages, :allredirects, :alltransclusions, :allusers, :backlinks, :betafeatures, :blocks, :categorymembers, :centralnoticelogs, :checkuser, :checkuserlog, :contenttranslation, :contenttranslationlangtrend, :contenttranslationstats, :contenttranslationsuggestions, :cxpublishedtranslations, :deletedrevs, :embeddedin, :exturlusage, :filearchive, :gadgetcategories, :gadgets, :geosearch, :gettingstartedgetpages, :globalallusers, :globalblocks, :globalgroups, :imageusage, :iwbacklinks, :langbacklinks, :listpages, :lists, :logevents, :mmsites, :oldreviewedpages, :pagepropnames, :pageswithprop, :prefixsearch, :protectedtitles, :querypage, :random, :recentchanges, :search, :tags, :usercontribs, :users, :watchlist, :watchlistraw, :wikisets]]
    param :meta, Params::List[Params::Module[:allmessages, :featureusage, :filerepoinfo, :globaluserinfo, :notifications, :siteinfo, :tokens, :userinfo, :wikibase]]
    param :indexpageids, Params::Boolean
    param :export, Params::Boolean
    param :exportnowrap, Params::Boolean
    param :iwurl, Params::Boolean
    param :continue, Params::String
    param :rawcontinue, Params::Boolean
    param :titles, Params::List[Params::String]
    param :pageids, Params::List[Params::Integer]
    param :revids, Params::List[Params::Integer]
    param :generator, Params::Module[:gallcategories, :galldeletedrevisions, :gallfileusages, :gallimages, :galllinks, :gallpages, :gallredirects, :galltransclusions, :gbacklinks, :gcategories, :gcategorymembers, :gcontenttranslation, :gcontenttranslationsuggestions, :gdeletedrevisions, :gduplicatefiles, :gembeddedin, :gexturlusage, :gfileusage, :ggeosearch, :ggettingstartedgetpages, :gimages, :gimageusage, :giwbacklinks, :glangbacklinks, :glinks, :glinkshere, :glistpages, :goldreviewedpages, :gpageswithprop, :gprefixsearch, :gprotectedtitles, :gquerypage, :grandom, :grecentchanges, :gredirects, :grevisions, :gsearch, :gtemplates, :gtranscludedin, :gwatchlist, :gwatchlistraw]
    param :redirects, Params::Boolean
    param :converttitles, Params::Boolean
  end
end