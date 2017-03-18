module MediaWiktory
  class Query < Action
    symbol :query
    param :prop, Params::Modules[:categories, :categoryinfo, :contributors, :coordinates, :deletedrevisions, :duplicatefiles, :extlinks, :extracts, :fileusage, :flagged, :globalusage, :imageinfo, :images, :info, :iwlinks, :langlinks, :links, :linkshere, :mapdata, :pageassessments, :pageimages, :pageprops, :pageterms, :pageviews, :redirects, :references, :revisions, :stashimageinfo, :templates, :transcludedin, :transcodestatus, :videoinfo, :wbentityusage]
    param :list, Params::Modules[:abusefilters, :abuselog, :allcategories, :alldeletedrevisions, :allfileusages, :allimages, :alllinks, :allpages, :allredirects, :allrevisions, :alltransclusions, :allusers, :backlinks, :betafeatures, :blocks, :categorymembers, :centralnoticelogs, :checkuser, :checkuserlog, :contenttranslation, :contenttranslationcorpora, :contenttranslationlangtrend, :contenttranslationstats, :contenttranslationsuggestions, :cxpublishedtranslations, :cxtranslatorstats, :deletedrevs, :embeddedin, :exturlusage, :filearchive, :gadgetcategories, :gadgets, :geosearch, :gettingstartedgetpages, :globalallusers, :globalblocks, :globalgroups, :imageusage, :iwbacklinks, :langbacklinks, :logevents, :mmsites, :mostviewed, :mystashedfiles, :oldreviewedpages, :pagepropnames, :pageswithprop, :prefixsearch, :projectpages, :projects, :protectedtitles, :querypage, :random, :recentchanges, :search, :tags, :usercontribs, :users, :watchlist, :watchlistraw, :wblistentityusage, :wikisets]
    param :meta, Params::Modules[:allmessages, :authmanagerinfo, :babel, :featureusage, :filerepoinfo, :globaluserinfo, :notifications, :oath, :ores, :siteinfo, :siteviews, :tokens, :unreadnotificationpages, :userinfo, :wikibase]
    param :indexpageids, Params::Boolean
    param :export, Params::Boolean
    param :exportnowrap, Params::Boolean
    param :iwurl, Params::Boolean
    param :continue, Params::String
    param :rawcontinue, Params::Boolean
    param :titles, Params::List[Params::String]
    param :pageids, Params::List[Params::Integer]
    param :revids, Params::List[Params::Integer]
    param :generator, Params::Module[:allcategories, :alldeletedrevisions, :allfileusages, :allimages, :alllinks, :allpages, :allredirects, :allrevisions, :alltransclusions, :backlinks, :categories, :categorymembers, :contenttranslation, :contenttranslationsuggestions, :deletedrevisions, :duplicatefiles, :embeddedin, :exturlusage, :fileusage, :geosearch, :gettingstartedgetpages, :images, :imageusage, :iwbacklinks, :langbacklinks, :links, :linkshere, :mostviewed, :oldreviewedpages, :pageswithprop, :prefixsearch, :projectpages, :protectedtitles, :querypage, :random, :recentchanges, :redirects, :revisions, :search, :templates, :transcludedin, :watchlist, :watchlistraw, :wblistentityusage]
    param :redirects, Params::Boolean
    param :converttitles, Params::Boolean
  end
end