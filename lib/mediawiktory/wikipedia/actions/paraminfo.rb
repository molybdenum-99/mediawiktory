# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Obtain information about API modules. 
    #
    # Usage:
    #
    # ```ruby
    # api.paraminfo(**options).perform # returns string with raw output
    # # or
    # api.paraminfo(**options).response # returns output parsed and wrapped into Mash-like object
    #
    # # or, with chainable interface:
    # api.paraminfo.modules(value).perform
    # ```
    #
    # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Paraminfo < MediaWiktory::Wikipedia::Actions::Get

      # List of module names (values of the action and format parameters, or main). Can specify submodules with a +, or all submodules with +*, or all submodules recursively with +**.
      #
      # @param values [Array<String>]
      # @return [self]
      def modules(*values)
        merge(modules: values.join('|'))
      end

      # Format of help strings.
      #
      # @param value [String] One of "html", "wikitext", "raw", "none".
      # @return [self]
      def helpformat(value)
        merge(helpformat: value.to_s)
      end

      # List of query module names (value of prop, meta or list parameter). Use modules=query+foo instead of querymodules=foo.
      #
      # @param values [Array<String>] Allowed values: "abusefilters", "abuselog", "allcategories", "alldeletedrevisions", "allfileusages", "allimages", "alllinks", "allmessages", "allpages", "allredirects", "allrevisions", "alltransclusions", "allusers", "authmanagerinfo", "babel", "backlinks", "betafeatures", "blocks", "categories", "categoryinfo", "categorymembers", "centralnoticelogs", "checkuser", "checkuserlog", "contenttranslation", "contenttranslationcorpora", "contenttranslationlangtrend", "contenttranslationstats", "contenttranslationsuggestions", "contributors", "coordinates", "cxpublishedtranslations", "cxtranslatorstats", "deletedrevisions", "deletedrevs", "duplicatefiles", "embeddedin", "extlinks", "extracts", "exturlusage", "featureusage", "filearchive", "filerepoinfo", "fileusage", "flagged", "gadgetcategories", "gadgets", "geosearch", "gettingstartedgetpages", "globalallusers", "globalblocks", "globalgroups", "globalusage", "globaluserinfo", "imageinfo", "images", "imageusage", "info", "iwbacklinks", "iwlinks", "langbacklinks", "langlinks", "links", "linkshere", "logevents", "mapdata", "mmsites", "mostviewed", "mystashedfiles", "notifications", "oath", "oldreviewedpages", "ores", "pageassessments", "pageimages", "pagepropnames", "pageprops", "pageswithprop", "pageterms", "pageviews", "prefixsearch", "projectpages", "projects", "protectedtitles", "querypage", "random", "recentchanges", "redirects", "references", "revisions", "search", "siteinfo", "siteviews", "stashimageinfo", "tags", "templates", "tokens", "transcludedin", "transcodestatus", "unreadnotificationpages", "usercontribs", "userinfo", "users", "videoinfo", "watchlist", "watchlistraw", "wbentityusage", "wblistentityusage", "wikibase", "wikisets".
      # @return [self]
      def querymodules(*values)
        merge(querymodules: values.join('|'))
      end

      # Get information about the main (top-level) module as well. Use modules=main instead.
      #
      # @param value [String]
      # @return [self]
      def mainmodule(value)
        merge(mainmodule: value.to_s)
      end

      # Get information about the pageset module (providing titles= and friends) as well.
      #
      # @param value [String]
      # @return [self]
      def pagesetmodule(value)
        merge(pagesetmodule: value.to_s)
      end

      # List of format module names (value of format parameter). Use modules instead.
      #
      # @param values [Array<String>] Allowed values: "json", "jsonfm", "none", "php", "phpfm", "rawfm", "xml", "xmlfm".
      # @return [self]
      def formatmodules(*values)
        merge(formatmodules: values.join('|'))
      end
  end
  end
end
