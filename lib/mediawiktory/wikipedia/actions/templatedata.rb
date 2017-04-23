module MediaWiktory::Wikipedia::Actions
  # Fetch data stored by the TemplateData extension. 
  #
  # Usage:
  #
  # ```ruby
  # api.templatedata(**options).perform # returns string with raw output
  # # or
  # api.templatedata(**options).response # returns output parsed and wrapped into Mash-like object
  #
  # # or, with chainable interface:
  # api.templatedata.titles(value).perform
  # ```
  #
  # See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
  #
  # All action's parameters are documented as its public methods, see below.
  #
  class Templatedata < MediaWiktory::GetAction
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
      merge(generator: module_to_hash(value, [:allcategories, :alldeletedrevisions, :allfileusages, :allimages, :alllinks, :allpages, :allredirects, :allrevisions, :alltransclusions, :backlinks, :categories, :categorymembers, :deletedrevisions, :duplicatefiles, :embeddedin, :exturlusage, :fileusage, :geosearch, :gettingstartedgetpages, :images, :imageusage, :iwbacklinks, :langbacklinks, :links, :linkshere, :mostviewed, :oldreviewedpages, :pageswithprop, :prefixsearch, :projectpages, :protectedtitles, :querypage, :random, :recentchanges, :redirects, :revisions, :search, :templates, :transcludedin, :watchlist, :watchlistraw, :wblistentityusage]))
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
    # Return localized values in this language. By default all available translations are returned.
    #
    # @param value [String]
    # @return [self]
    def lang(value)
      merge(lang: value.to_s)
    end

  end
end
