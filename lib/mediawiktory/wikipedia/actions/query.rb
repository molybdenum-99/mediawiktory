# frozen_string_literal: true

module MediaWiktory::Wikipedia::Actions
  # Fetch data from and about MediaWiki.
  #
  # Usage:
  #
  # ```ruby
  # api.query(**options).perform # returns string with raw output
  # # or
  # api.query(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.query.prop(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Query < MediaWiktory::Wikipedia::GetAction

    # Which properties to get for the queried pages.
    #
    # @param values [Array<Symbol>] All selected options include tweaking methods from corresponding modules:
    #   * `:categories` - {MediaWiktory::Wikipedia::Modules::Categories} List all categories the pages belong to.
    #   * `:categoryinfo` - {MediaWiktory::Wikipedia::Modules::Categoryinfo} Returns information about the given categories.
    #   * `:contributors` - {MediaWiktory::Wikipedia::Modules::Contributors} Get the list of logged-in contributors and the count of anonymous contributors to a page.
    #   * `:coordinates` - {MediaWiktory::Wikipedia::Modules::Coordinates} Returns coordinates of the given pages.
    #   * `:deletedrevisions` - {MediaWiktory::Wikipedia::Modules::Deletedrevisions} Get deleted revision information.
    #   * `:duplicatefiles` - {MediaWiktory::Wikipedia::Modules::Duplicatefiles} List all files that are duplicates of the given files based on hash values.
    #   * `:extlinks` - {MediaWiktory::Wikipedia::Modules::Extlinks} Returns all external URLs (not interwikis) from the given pages.
    #   * `:extracts` - {MediaWiktory::Wikipedia::Modules::Extracts} Returns plain-text or limited HTML extracts of the given pages.
    #   * `:fileusage` - {MediaWiktory::Wikipedia::Modules::Fileusage} Find all pages that use the given files.
    #   * `:flagged` - {MediaWiktory::Wikipedia::Modules::Flagged} Get information about the flagging status of the given pages.
    #   * `:globalusage` - {MediaWiktory::Wikipedia::Modules::Globalusage} Returns global image usage for a certain image.
    #   * `:imageinfo` - {MediaWiktory::Wikipedia::Modules::Imageinfo} Returns file information and upload history.
    #   * `:images` - {MediaWiktory::Wikipedia::Modules::Images} Returns all files contained on the given pages.
    #   * `:info` - {MediaWiktory::Wikipedia::Modules::Info} Get basic page information.
    #   * `:iwlinks` - {MediaWiktory::Wikipedia::Modules::Iwlinks} Returns all interwiki links from the given pages.
    #   * `:langlinks` - {MediaWiktory::Wikipedia::Modules::Langlinks} Returns all interlanguage links from the given pages.
    #   * `:links` - {MediaWiktory::Wikipedia::Modules::Links} Returns all links from the given pages.
    #   * `:linkshere` - {MediaWiktory::Wikipedia::Modules::Linkshere} Find all pages that link to the given pages.
    #   * `:mapdata` - {MediaWiktory::Wikipedia::Modules::Mapdata} Request all map data from the page Metallica
    #   * `:pageassessments` - {MediaWiktory::Wikipedia::Modules::Pageassessments} Return associated projects and assessments for the given pages.
    #   * `:pageimages` - {MediaWiktory::Wikipedia::Modules::Pageimages} Returns information about images on the page, such as thumbnail and presence of photos.
    #   * `:pageprops` - {MediaWiktory::Wikipedia::Modules::Pageprops} Get various page properties defined in the page content.
    #   * `:pageterms` - {MediaWiktory::Wikipedia::Modules::Pageterms} Get terms associated with a page via an associated data item. On a wikibase entity page, the entity terms are used directly. Caveat: On a repo wiki, pageterms only works directly on entity pages, not on pages connected to an item. This may change in the future.
    #   * `:pageviews` - {MediaWiktory::Wikipedia::Modules::Pageviews} Shows per-page pageview data (the number of daily pageviews for each of the last pvipdays days). The result format is page title (with underscores) => date (Ymd) => count.
    #   * `:redirects` - {MediaWiktory::Wikipedia::Modules::Redirects} Returns all redirects to the given pages.
    #   * `:references` - {MediaWiktory::Wikipedia::Modules::References} Return a data representation of references associated with the given pages.
    #   * `:revisions` - {MediaWiktory::Wikipedia::Modules::Revisions} Get revision information.
    #   * `:stashimageinfo` - {MediaWiktory::Wikipedia::Modules::Stashimageinfo} Returns file information for stashed files.
    #   * `:templates` - {MediaWiktory::Wikipedia::Modules::Templates} Returns all pages transcluded on the given pages.
    #   * `:transcludedin` - {MediaWiktory::Wikipedia::Modules::Transcludedin} Find all pages that transclude the given pages.
    #   * `:transcodestatus` - {MediaWiktory::Wikipedia::Modules::Transcodestatus} Get transcode status for a given file page.
    #   * `:videoinfo` - {MediaWiktory::Wikipedia::Modules::Videoinfo} Extends imageinfo to include video source (derivatives) information
    #   * `:wbentityusage` - {MediaWiktory::Wikipedia::Modules::Wbentityusage} Returns all entity IDs used in the given pages.
    # @return [self]
    def prop(*values)
      merge_modules(:prop, values, categories: MediaWiktory::Wikipedia::Modules::Categories, categoryinfo: MediaWiktory::Wikipedia::Modules::Categoryinfo, contributors: MediaWiktory::Wikipedia::Modules::Contributors, coordinates: MediaWiktory::Wikipedia::Modules::Coordinates, deletedrevisions: MediaWiktory::Wikipedia::Modules::Deletedrevisions, duplicatefiles: MediaWiktory::Wikipedia::Modules::Duplicatefiles, extlinks: MediaWiktory::Wikipedia::Modules::Extlinks, extracts: MediaWiktory::Wikipedia::Modules::Extracts, fileusage: MediaWiktory::Wikipedia::Modules::Fileusage, flagged: MediaWiktory::Wikipedia::Modules::Flagged, globalusage: MediaWiktory::Wikipedia::Modules::Globalusage, imageinfo: MediaWiktory::Wikipedia::Modules::Imageinfo, images: MediaWiktory::Wikipedia::Modules::Images, info: MediaWiktory::Wikipedia::Modules::Info, iwlinks: MediaWiktory::Wikipedia::Modules::Iwlinks, langlinks: MediaWiktory::Wikipedia::Modules::Langlinks, links: MediaWiktory::Wikipedia::Modules::Links, linkshere: MediaWiktory::Wikipedia::Modules::Linkshere, mapdata: MediaWiktory::Wikipedia::Modules::Mapdata, pageassessments: MediaWiktory::Wikipedia::Modules::Pageassessments, pageimages: MediaWiktory::Wikipedia::Modules::Pageimages, pageprops: MediaWiktory::Wikipedia::Modules::Pageprops, pageterms: MediaWiktory::Wikipedia::Modules::Pageterms, pageviews: MediaWiktory::Wikipedia::Modules::Pageviews, redirects: MediaWiktory::Wikipedia::Modules::Redirects, references: MediaWiktory::Wikipedia::Modules::References, revisions: MediaWiktory::Wikipedia::Modules::Revisions, stashimageinfo: MediaWiktory::Wikipedia::Modules::Stashimageinfo, templates: MediaWiktory::Wikipedia::Modules::Templates, transcludedin: MediaWiktory::Wikipedia::Modules::Transcludedin, transcodestatus: MediaWiktory::Wikipedia::Modules::Transcodestatus, videoinfo: MediaWiktory::Wikipedia::Modules::Videoinfo, wbentityusage: MediaWiktory::Wikipedia::Modules::Wbentityusage)
    end

    # Which lists to get.
    #
    # @param values [Array<Symbol>] All selected options include tweaking methods from corresponding modules:
    #   * `:abusefilters` - {MediaWiktory::Wikipedia::Modules::Abusefilters} Show details of the abuse filters.
    #   * `:abuselog` - {MediaWiktory::Wikipedia::Modules::Abuselog} Show events that were caught by one of the abuse filters.
    #   * `:allcategories` - {MediaWiktory::Wikipedia::Modules::Allcategories} Enumerate all categories.
    #   * `:alldeletedrevisions` - {MediaWiktory::Wikipedia::Modules::Alldeletedrevisions} List all deleted revisions by a user or in a namespace.
    #   * `:allfileusages` - {MediaWiktory::Wikipedia::Modules::Allfileusages} List all file usages, including non-existing.
    #   * `:allimages` - {MediaWiktory::Wikipedia::Modules::Allimages} Enumerate all images sequentially.
    #   * `:alllinks` - {MediaWiktory::Wikipedia::Modules::Alllinks} Enumerate all links that point to a given namespace.
    #   * `:allpages` - {MediaWiktory::Wikipedia::Modules::Allpages} Enumerate all pages sequentially in a given namespace.
    #   * `:allredirects` - {MediaWiktory::Wikipedia::Modules::Allredirects} List all redirects to a namespace.
    #   * `:allrevisions` - {MediaWiktory::Wikipedia::Modules::Allrevisions} List all revisions.
    #   * `:alltransclusions` - {MediaWiktory::Wikipedia::Modules::Alltransclusions} List all transclusions (pages embedded using {{x}}), including non-existing.
    #   * `:allusers` - {MediaWiktory::Wikipedia::Modules::Allusers} Enumerate all registered users.
    #   * `:backlinks` - {MediaWiktory::Wikipedia::Modules::Backlinks} Find all pages that link to the given page.
    #   * `:betafeatures` - {MediaWiktory::Wikipedia::Modules::Betafeatures} List all BetaFeatures
    #   * `:blocks` - {MediaWiktory::Wikipedia::Modules::Blocks} List all blocked users and IP addresses.
    #   * `:categorymembers` - {MediaWiktory::Wikipedia::Modules::Categorymembers} List all pages in a given category.
    #   * `:centralnoticelogs` - {MediaWiktory::Wikipedia::Modules::Centralnoticelogs} Get a log of campaign configuration changes.
    #   * `:checkuser` - {MediaWiktory::Wikipedia::Modules::Checkuser} Check which IP addresses are used by a given username or which usernames are used by a given IP address.
    #   * `:checkuserlog` - {MediaWiktory::Wikipedia::Modules::Checkuserlog} Get entries from the CheckUser log.
    #   * `:deletedrevs` - {MediaWiktory::Wikipedia::Modules::Deletedrevs} List deleted revisions.
    #   * `:embeddedin` - {MediaWiktory::Wikipedia::Modules::Embeddedin} Find all pages that embed (transclude) the given title.
    #   * `:exturlusage` - {MediaWiktory::Wikipedia::Modules::Exturlusage} Enumerate pages that contain a given URL.
    #   * `:filearchive` - {MediaWiktory::Wikipedia::Modules::Filearchive} Enumerate all deleted files sequentially.
    #   * `:gadgetcategories` - {MediaWiktory::Wikipedia::Modules::Gadgetcategories} Returns a list of gadget categories.
    #   * `:gadgets` - {MediaWiktory::Wikipedia::Modules::Gadgets} Returns a list of gadgets used on this wiki.
    #   * `:geosearch` - {MediaWiktory::Wikipedia::Modules::Geosearch} Returns pages having coordinates that are located in a certain area.
    #   * `:gettingstartedgetpages` - {MediaWiktory::Wikipedia::Modules::Gettingstartedgetpages} This API is for getting a list of one or more pages related to a particular GettingStarted task.
    #   * `:globalallusers` - {MediaWiktory::Wikipedia::Modules::Globalallusers} Enumerate all global users.
    #   * `:globalblocks` - {MediaWiktory::Wikipedia::Modules::Globalblocks} List all globally blocked IP addresses.
    #   * `:globalgroups` - {MediaWiktory::Wikipedia::Modules::Globalgroups} Enumerate all global groups.
    #   * `:imageusage` - {MediaWiktory::Wikipedia::Modules::Imageusage} Find all pages that use the given image title.
    #   * `:iwbacklinks` - {MediaWiktory::Wikipedia::Modules::Iwbacklinks} Find all pages that link to the given interwiki link.
    #   * `:langbacklinks` - {MediaWiktory::Wikipedia::Modules::Langbacklinks} Find all pages that link to the given language link.
    #   * `:logevents` - {MediaWiktory::Wikipedia::Modules::Logevents} Get events from logs.
    #   * `:mmsites` - {MediaWiktory::Wikipedia::Modules::Mmsites} Serve autocomplete requests for the site field in MassMessage.
    #   * `:mostviewed` - {MediaWiktory::Wikipedia::Modules::Mostviewed} Lists the most viewed pages (based on last day's pageview count).
    #   * `:mystashedfiles` - {MediaWiktory::Wikipedia::Modules::Mystashedfiles} Get a list of files in the current user's upload stash.
    #   * `:oldreviewedpages` - {MediaWiktory::Wikipedia::Modules::Oldreviewedpages} Enumerates pages that have changes pending review.
    #   * `:pagepropnames` - {MediaWiktory::Wikipedia::Modules::Pagepropnames} List all page property names in use on the wiki.
    #   * `:pageswithprop` - {MediaWiktory::Wikipedia::Modules::Pageswithprop} List all pages using a given page property.
    #   * `:prefixsearch` - {MediaWiktory::Wikipedia::Modules::Prefixsearch} Perform a prefix search for page titles.
    #   * `:projectpages` - {MediaWiktory::Wikipedia::Modules::Projectpages} List all pages associated with one or more projects.
    #   * `:projects` - {MediaWiktory::Wikipedia::Modules::Projects} List all the projects.
    #   * `:protectedtitles` - {MediaWiktory::Wikipedia::Modules::Protectedtitles} List all titles protected from creation.
    #   * `:querypage` - {MediaWiktory::Wikipedia::Modules::Querypage} Get a list provided by a QueryPage-based special page.
    #   * `:random` - {MediaWiktory::Wikipedia::Modules::Random} Get a set of random pages.
    #   * `:recentchanges` - {MediaWiktory::Wikipedia::Modules::Recentchanges} Enumerate recent changes.
    #   * `:search` - {MediaWiktory::Wikipedia::Modules::Search} Perform a full text search.
    #   * `:tags` - {MediaWiktory::Wikipedia::Modules::Tags} List change tags.
    #   * `:usercontribs` - {MediaWiktory::Wikipedia::Modules::Usercontribs} Get all edits by a user.
    #   * `:users` - {MediaWiktory::Wikipedia::Modules::Users} Get information about a list of users.
    #   * `:watchlist` - {MediaWiktory::Wikipedia::Modules::Watchlist} Get recent changes to pages in the current user's watchlist.
    #   * `:watchlistraw` - {MediaWiktory::Wikipedia::Modules::Watchlistraw} Get all pages on the current user's watchlist.
    #   * `:wblistentityusage` - {MediaWiktory::Wikipedia::Modules::Wblistentityusage} Returns all pages that use the given entity IDs.
    #   * `:wikisets` - {MediaWiktory::Wikipedia::Modules::Wikisets} Enumerate all wiki sets.
    # @return [self]
    def list(*values)
      merge_modules(:list, values, abusefilters: Modules::Abusefilters, abuselog: Modules::Abuselog, allcategories: Modules::Allcategories, alldeletedrevisions: Modules::Alldeletedrevisions, allfileusages: Modules::Allfileusages, allimages: Modules::Allimages, alllinks: Modules::Alllinks, allpages: Modules::Allpages, allredirects: Modules::Allredirects, allrevisions: Modules::Allrevisions, alltransclusions: Modules::Alltransclusions, allusers: Modules::Allusers, backlinks: Modules::Backlinks, betafeatures: Modules::Betafeatures, blocks: Modules::Blocks, categorymembers: Modules::Categorymembers, centralnoticelogs: Modules::Centralnoticelogs, checkuser: Modules::Checkuser, checkuserlog: Modules::Checkuserlog, deletedrevs: Modules::Deletedrevs, embeddedin: Modules::Embeddedin, exturlusage: Modules::Exturlusage, filearchive: Modules::Filearchive, gadgetcategories: Modules::Gadgetcategories, gadgets: Modules::Gadgets, geosearch: Modules::Geosearch, gettingstartedgetpages: Modules::Gettingstartedgetpages, globalallusers: Modules::Globalallusers, globalblocks: Modules::Globalblocks, globalgroups: Modules::Globalgroups, imageusage: Modules::Imageusage, iwbacklinks: Modules::Iwbacklinks, langbacklinks: Modules::Langbacklinks, logevents: Modules::Logevents, mmsites: Modules::Mmsites, mostviewed: Modules::Mostviewed, mystashedfiles: Modules::Mystashedfiles, oldreviewedpages: Modules::Oldreviewedpages, pagepropnames: Modules::Pagepropnames, pageswithprop: Modules::Pageswithprop, prefixsearch: Modules::Prefixsearch, projectpages: Modules::Projectpages, projects: Modules::Projects, protectedtitles: Modules::Protectedtitles, querypage: Modules::Querypage, random: Modules::Random, recentchanges: Modules::Recentchanges, search: Modules::Search, tags: Modules::Tags, usercontribs: Modules::Usercontribs, users: Modules::Users, watchlist: Modules::Watchlist, watchlistraw: Modules::Watchlistraw, wblistentityusage: Modules::Wblistentityusage, wikisets: Modules::Wikisets)
    end

    # Which metadata to get.
    #
    # @param values [Array<Symbol>] All selected options include tweaking methods from corresponding modules:
    #   * `:allmessages` - {MediaWiktory::Wikipedia::Modules::Allmessages} Return messages from this site.
    #   * `:authmanagerinfo` - {MediaWiktory::Wikipedia::Modules::Authmanagerinfo} Retrieve information about the current authentication status.
    #   * `:babel` - {MediaWiktory::Wikipedia::Modules::Babel} Get information about what languages the user knows
    #   * `:featureusage` - {MediaWiktory::Wikipedia::Modules::Featureusage} Get a summary of logged API feature usages for a user agent.
    #   * `:filerepoinfo` - {MediaWiktory::Wikipedia::Modules::Filerepoinfo} Return meta information about image repositories configured on the wiki.
    #   * `:globaluserinfo` - {MediaWiktory::Wikipedia::Modules::Globaluserinfo} Show information about a global user.
    #   * `:notifications` - {MediaWiktory::Wikipedia::Modules::Notifications} Get notifications waiting for the current user.
    #   * `:oath` - {MediaWiktory::Wikipedia::Modules::Oath} Check to see if two-factor authentication (OATH) is enabled for a user.
    #   * `:ores` - {MediaWiktory::Wikipedia::Modules::Ores} Return ORES configuration and model data for this wiki.
    #   * `:siteinfo` - {MediaWiktory::Wikipedia::Modules::Siteinfo} Return general information about the site.
    #   * `:siteviews` - {MediaWiktory::Wikipedia::Modules::Siteviews} Shows sitewide pageview data (daily pageview totals for each of the last pvisdays days). The result format is date (Ymd) => count.
    #   * `:tokens` - {MediaWiktory::Wikipedia::Modules::Tokens} Gets tokens for data-modifying actions.
    #   * `:unreadnotificationpages` - {MediaWiktory::Wikipedia::Modules::Unreadnotificationpages} Get pages for which there are unread notifications for the current user.
    #   * `:userinfo` - {MediaWiktory::Wikipedia::Modules::Userinfo} Get information about the current user.
    #   * `:wikibase` - {MediaWiktory::Wikipedia::Modules::Wikibase} Get information about the Wikibase client and the associated Wikibase repository.
    # @return [self]
    def meta(*values)
      merge_modules(:meta, values, allmessages: Modules::Allmessages, authmanagerinfo: Modules::Authmanagerinfo, babel: Modules::Babel, featureusage: Modules::Featureusage, filerepoinfo: Modules::Filerepoinfo, globaluserinfo: Modules::Globaluserinfo, notifications: Modules::Notifications, oath: Modules::Oath, ores: Modules::Ores, siteinfo: Modules::Siteinfo, siteviews: Modules::Siteviews, tokens: Modules::Tokens, unreadnotificationpages: Modules::Unreadnotificationpages, userinfo: Modules::Userinfo, wikibase: Modules::Wikibase)
    end

    # Include an additional pageids section listing all returned page IDs.
    #
    # @return [self]
    def indexpageids()
      merge(indexpageids: 'true')
    end

    # Export the current revisions of all given or generated pages.
    #
    # @return [self]
    def export()
      merge(export: 'true')
    end

    # Return the export XML without wrapping it in an XML result (same format as Special:Export). Can only be used with export.
    #
    # @return [self]
    def exportnowrap()
      merge(exportnowrap: 'true')
    end

    # Whether to get the full URL if the title is an interwiki link.
    #
    # @return [self]
    def iwurl()
      merge(iwurl: 'true')
    end

    # When more results are available, use this to continue.
    #
    # @param value [String]
    # @return [self]
    def continue(value)
      merge(continue: value.to_s)
    end

    # Return raw query-continue data for continuation.
    #
    # @return [self]
    def rawcontinue()
      merge(rawcontinue: 'true')
    end

    # A list of titles to work on.
    #
    # @param values [Array<String>]
    # @return [self]
    def titles(*values)
      merge(titles: values.join('|'))
    end

    # A list of page IDs to work on.
    #
    # @param values [Array<Integer>]
    # @return [self]
    def pageids(*values)
      merge(pageids: values.join('|'))
    end

    # A list of revision IDs to work on.
    #
    # @param values [Array<Integer>]
    # @return [self]
    def revids(*values)
      merge(revids: values.join('|'))
    end

    # Get the list of pages to work on by executing the specified query module.
    #
    # @param value [Symbol] Selecting an option includes tweaking methods from corresponding module:
    #   * `:allcategories` - {MediaWiktory::Wikipedia::Modules::Allcategories} Enumerate all categories.
    #   * `:alldeletedrevisions` - {MediaWiktory::Wikipedia::Modules::Alldeletedrevisions} List all deleted revisions by a user or in a namespace.
    #   * `:allfileusages` - {MediaWiktory::Wikipedia::Modules::Allfileusages} List all file usages, including non-existing.
    #   * `:allimages` - {MediaWiktory::Wikipedia::Modules::Allimages} Enumerate all images sequentially.
    #   * `:alllinks` - {MediaWiktory::Wikipedia::Modules::Alllinks} Enumerate all links that point to a given namespace.
    #   * `:allpages` - {MediaWiktory::Wikipedia::Modules::Allpages} Enumerate all pages sequentially in a given namespace.
    #   * `:allredirects` - {MediaWiktory::Wikipedia::Modules::Allredirects} List all redirects to a namespace.
    #   * `:allrevisions` - {MediaWiktory::Wikipedia::Modules::Allrevisions} List all revisions.
    #   * `:alltransclusions` - {MediaWiktory::Wikipedia::Modules::Alltransclusions} List all transclusions (pages embedded using {{x}}), including non-existing.
    #   * `:backlinks` - {MediaWiktory::Wikipedia::Modules::Backlinks} Find all pages that link to the given page.
    #   * `:categories` - {MediaWiktory::Wikipedia::Modules::Categories} List all categories the pages belong to.
    #   * `:categorymembers` - {MediaWiktory::Wikipedia::Modules::Categorymembers} List all pages in a given category.
    #   * `:deletedrevisions` - {MediaWiktory::Wikipedia::Modules::Deletedrevisions} Get deleted revision information.
    #   * `:duplicatefiles` - {MediaWiktory::Wikipedia::Modules::Duplicatefiles} List all files that are duplicates of the given files based on hash values.
    #   * `:embeddedin` - {MediaWiktory::Wikipedia::Modules::Embeddedin} Find all pages that embed (transclude) the given title.
    #   * `:exturlusage` - {MediaWiktory::Wikipedia::Modules::Exturlusage} Enumerate pages that contain a given URL.
    #   * `:fileusage` - {MediaWiktory::Wikipedia::Modules::Fileusage} Find all pages that use the given files.
    #   * `:geosearch` - {MediaWiktory::Wikipedia::Modules::Geosearch} Returns pages having coordinates that are located in a certain area.
    #   * `:gettingstartedgetpages` - {MediaWiktory::Wikipedia::Modules::Gettingstartedgetpages} This API is for getting a list of one or more pages related to a particular GettingStarted task.
    #   * `:images` - {MediaWiktory::Wikipedia::Modules::Images} Returns all files contained on the given pages.
    #   * `:imageusage` - {MediaWiktory::Wikipedia::Modules::Imageusage} Find all pages that use the given image title.
    #   * `:iwbacklinks` - {MediaWiktory::Wikipedia::Modules::Iwbacklinks} Find all pages that link to the given interwiki link.
    #   * `:langbacklinks` - {MediaWiktory::Wikipedia::Modules::Langbacklinks} Find all pages that link to the given language link.
    #   * `:links` - {MediaWiktory::Wikipedia::Modules::Links} Returns all links from the given pages.
    #   * `:linkshere` - {MediaWiktory::Wikipedia::Modules::Linkshere} Find all pages that link to the given pages.
    #   * `:mostviewed` - {MediaWiktory::Wikipedia::Modules::Mostviewed} Lists the most viewed pages (based on last day's pageview count).
    #   * `:oldreviewedpages` - {MediaWiktory::Wikipedia::Modules::Oldreviewedpages} Enumerates pages that have changes pending review.
    #   * `:pageswithprop` - {MediaWiktory::Wikipedia::Modules::Pageswithprop} List all pages using a given page property.
    #   * `:prefixsearch` - {MediaWiktory::Wikipedia::Modules::Prefixsearch} Perform a prefix search for page titles.
    #   * `:projectpages` - {MediaWiktory::Wikipedia::Modules::Projectpages} List all pages associated with one or more projects.
    #   * `:protectedtitles` - {MediaWiktory::Wikipedia::Modules::Protectedtitles} List all titles protected from creation.
    #   * `:querypage` - {MediaWiktory::Wikipedia::Modules::Querypage} Get a list provided by a QueryPage-based special page.
    #   * `:random` - {MediaWiktory::Wikipedia::Modules::Random} Get a set of random pages.
    #   * `:recentchanges` - {MediaWiktory::Wikipedia::Modules::Recentchanges} Enumerate recent changes.
    #   * `:redirects` - {MediaWiktory::Wikipedia::Modules::Redirects} Returns all redirects to the given pages.
    #   * `:revisions` - {MediaWiktory::Wikipedia::Modules::Revisions} Get revision information.
    #   * `:search` - {MediaWiktory::Wikipedia::Modules::Search} Perform a full text search.
    #   * `:templates` - {MediaWiktory::Wikipedia::Modules::Templates} Returns all pages transcluded on the given pages.
    #   * `:transcludedin` - {MediaWiktory::Wikipedia::Modules::Transcludedin} Find all pages that transclude the given pages.
    #   * `:watchlist` - {MediaWiktory::Wikipedia::Modules::Watchlist} Get recent changes to pages in the current user's watchlist.
    #   * `:watchlistraw` - {MediaWiktory::Wikipedia::Modules::Watchlistraw} Get all pages on the current user's watchlist.
    #   * `:wblistentityusage` - {MediaWiktory::Wikipedia::Modules::Wblistentityusage} Returns all pages that use the given entity IDs.
    # @return [self]
    def generator(value)
      merge_module(:generator, value, allcategories: Modules::Allcategories, alldeletedrevisions: Modules::Alldeletedrevisions, allfileusages: Modules::Allfileusages, allimages: Modules::Allimages, alllinks: Modules::Alllinks, allpages: Modules::Allpages, allredirects: Modules::Allredirects, allrevisions: Modules::Allrevisions, alltransclusions: Modules::Alltransclusions, backlinks: Modules::Backlinks, categories: Modules::Categories, categorymembers: Modules::Categorymembers, deletedrevisions: Modules::Deletedrevisions, duplicatefiles: Modules::Duplicatefiles, embeddedin: Modules::Embeddedin, exturlusage: Modules::Exturlusage, fileusage: Modules::Fileusage, geosearch: Modules::Geosearch, gettingstartedgetpages: Modules::Gettingstartedgetpages, images: Modules::Images, imageusage: Modules::Imageusage, iwbacklinks: Modules::Iwbacklinks, langbacklinks: Modules::Langbacklinks, links: Modules::Links, linkshere: Modules::Linkshere, mostviewed: Modules::Mostviewed, oldreviewedpages: Modules::Oldreviewedpages, pageswithprop: Modules::Pageswithprop, prefixsearch: Modules::Prefixsearch, projectpages: Modules::Projectpages, protectedtitles: Modules::Protectedtitles, querypage: Modules::Querypage, random: Modules::Random, recentchanges: Modules::Recentchanges, redirects: Modules::Redirects, revisions: Modules::Revisions, search: Modules::Search, templates: Modules::Templates, transcludedin: Modules::Transcludedin, watchlist: Modules::Watchlist, watchlistraw: Modules::Watchlistraw, wblistentityusage: Modules::Wblistentityusage)
    end

    # Automatically resolve redirects in titles, pageids, and revids, and in pages returned by generator.
    #
    # @return [self]
    def redirects()
      merge(redirects: 'true')
    end

    # Convert titles to other variants if necessary. Only works if the wiki's content language supports variant conversion. Languages that support variant conversion include gan, iu, kk, ku, shi, sr, tg, uz and zh.
    #
    # @return [self]
    def converttitles()
      merge(converttitles: 'true')
    end
  end
end
