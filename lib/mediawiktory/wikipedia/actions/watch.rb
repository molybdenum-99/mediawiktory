# frozen_string_literal: true

module MediaWiktory::Wikipedia
  module Actions
    # Add or remove pages from the current user's watchlist. 
    #
    # Usage:
    #
    # ```ruby
    # api.watch.title(value).perform # returns string with raw output
    # # or
    # api.watch.title(value).response # returns output parsed and wrapped into Response object
    # ```
    #
    # See {Base} for generic explanation of working with MediaWiki actions and
    # {MediaWiktory::Wikipedia::Response} for working with action responses.
    #
    # All action's parameters are documented as its public methods, see below.
    #
    class Watch < MediaWiktory::Wikipedia::Actions::Post

      # The page to (un)watch. Use titles instead.
      #
      # @param value [String]
      # @return [self]
      def title(value)
        merge(title: value.to_s)
      end

      # If set the page will be unwatched rather than watched.
      #
      # @return [self]
      def unwatch()
        merge(unwatch: 'true')
      end

      # When more results are available, use this to continue.
      #
      # @param value [String]
      # @return [self]
      def continue(value)
        merge(continue: value.to_s)
      end

      # A list of titles to work on.
      #
      # @param values [Array<String>]
      # @return [self]
      def titles(*values)
        values.inject(self) { |res, val| res._titles(val) }
      end

      # @private
      def _titles(value)
        merge(titles: value.to_s)
      end

      # A list of page IDs to work on.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def pageids(*values)
        values.inject(self) { |res, val| res._pageids(val) }
      end

      # @private
      def _pageids(value)
        merge(pageids: value.to_s)
      end

      # A list of revision IDs to work on.
      #
      # @param values [Array<Integer>]
      # @return [self]
      def revids(*values)
        values.inject(self) { |res, val| res._revids(val) }
      end

      # @private
      def _revids(value)
        merge(revids: value.to_s)
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
      #   * `:contenttranslation` - {MediaWiktory::Wikipedia::Modules::Contenttranslation} Query Content Translation database for translations. 
      #   * `:contenttranslationsuggestions` - {MediaWiktory::Wikipedia::Modules::Contenttranslationsuggestions} Get suggestion lists for Content Translation. 
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
        _generator(value) or fail ArgumentError, "Unknown value for generator: #{value}"
      end

      # @private
      def _generator(value)
        defined?(super) && super || [:allcategories, :alldeletedrevisions, :allfileusages, :allimages, :alllinks, :allpages, :allredirects, :allrevisions, :alltransclusions, :backlinks, :categories, :categorymembers, :contenttranslation, :contenttranslationsuggestions, :deletedrevisions, :duplicatefiles, :embeddedin, :exturlusage, :fileusage, :geosearch, :gettingstartedgetpages, :images, :imageusage, :iwbacklinks, :langbacklinks, :links, :linkshere, :mostviewed, :oldreviewedpages, :pageswithprop, :prefixsearch, :projectpages, :protectedtitles, :querypage, :random, :recentchanges, :redirects, :revisions, :search, :templates, :transcludedin, :watchlist, :watchlistraw, :wblistentityusage].include?(value.to_sym) && merge(generator: value.to_s).submodule({allcategories: Modules::Allcategories, alldeletedrevisions: Modules::Alldeletedrevisions, allfileusages: Modules::Allfileusages, allimages: Modules::Allimages, alllinks: Modules::Alllinks, allpages: Modules::Allpages, allredirects: Modules::Allredirects, allrevisions: Modules::Allrevisions, alltransclusions: Modules::Alltransclusions, backlinks: Modules::Backlinks, categories: Modules::Categories, categorymembers: Modules::Categorymembers, contenttranslation: Modules::Contenttranslation, contenttranslationsuggestions: Modules::Contenttranslationsuggestions, deletedrevisions: Modules::Deletedrevisions, duplicatefiles: Modules::Duplicatefiles, embeddedin: Modules::Embeddedin, exturlusage: Modules::Exturlusage, fileusage: Modules::Fileusage, geosearch: Modules::Geosearch, gettingstartedgetpages: Modules::Gettingstartedgetpages, images: Modules::Images, imageusage: Modules::Imageusage, iwbacklinks: Modules::Iwbacklinks, langbacklinks: Modules::Langbacklinks, links: Modules::Links, linkshere: Modules::Linkshere, mostviewed: Modules::Mostviewed, oldreviewedpages: Modules::Oldreviewedpages, pageswithprop: Modules::Pageswithprop, prefixsearch: Modules::Prefixsearch, projectpages: Modules::Projectpages, protectedtitles: Modules::Protectedtitles, querypage: Modules::Querypage, random: Modules::Random, recentchanges: Modules::Recentchanges, redirects: Modules::Redirects, revisions: Modules::Revisions, search: Modules::Search, templates: Modules::Templates, transcludedin: Modules::Transcludedin, watchlist: Modules::Watchlist, watchlistraw: Modules::Watchlistraw, wblistentityusage: Modules::Wblistentityusage}[value.to_sym])
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

      # A "watch" token retrieved from action=query&meta=tokens
      #
      # @param value [String]
      # @return [self]
      def token(value)
        merge(token: value.to_s)
      end
    end
  end
end
