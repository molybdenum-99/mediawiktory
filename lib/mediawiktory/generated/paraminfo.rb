module MediaWiktory
  class Paraminfo < Action
    symbol :paraminfo
    param :modules, Params::List[Params::String]
    param :helpformat, Params::Enum[:html, :wikitext, :raw, :none]
    param :querymodules, Params::List[Params::Enum[:abusefilters, :abuselog, :allcategories, :alldeletedrevisions, :allfileusages, :allimages, :alllinks, :allmessages, :allpages, :allredirects, :alltransclusions, :allusers, :backlinks, :betafeatures, :blocks, :categories, :categoryinfo, :categorymembers, :centralnoticelogs, :checkuser, :checkuserlog, :contenttranslation, :contenttranslationlangtrend, :contenttranslationstats, :contenttranslationsuggestions, :contributors, :coordinates, :cxpublishedtranslations, :deletedrevisions, :deletedrevs, :duplicatefiles, :embeddedin, :extlinks, :extracts, :exturlusage, :featureusage, :filearchive, :filerepoinfo, :fileusage, :flagged, :flowinfo, :gadgetcategories, :gadgets, :geosearch, :gettingstartedgetpages, :globalallusers, :globalblocks, :globalgroups, :globalusage, :globaluserinfo, :imageinfo, :images, :imageusage, :info, :iwbacklinks, :iwlinks, :langbacklinks, :langlinks, :links, :linkshere, :listmembership, :listpages, :lists, :logevents, :mmsites, :notifications, :oldreviewedpages, :pageimages, :pagepropnames, :pageprops, :pageswithprop, :pageterms, :prefixsearch, :protectedtitles, :querypage, :random, :recentchanges, :redirects, :revisions, :search, :siteinfo, :stashimageinfo, :tags, :templates, :tokens, :transcludedin, :transcodestatus, :usercontribs, :userinfo, :users, :videoinfo, :watchlist, :watchlistraw, :wikibase, :wikisets]]
    param :mainmodule, Params::String
    param :pagesetmodule, Params::String
    param :formatmodules, Params::List[Params::Enum[:dbg, :dbgfm, :json, :jsonfm, :none, :php, :phpfm, :rawfm, :txt, :txtfm, :xml, :xmlfm, :yaml, :yamlfm]]
  end
end