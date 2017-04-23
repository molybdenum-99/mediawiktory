# Purge the cache for the given titles.
#
# Usage:
#
# ```ruby
# api.purge(**options).perform # returns string with raw output
# # or
# api.purge(**options).response # returns output parsed and wrapped into Mash-like object
#
# # or, with chainable interface:
# api.purge.forcelinkupdate(value)....perform
# ```
#
# See {MediaWiktory::Action} for generic explanation of working with MediaWiki actions.
#
# All action's parameters are documented as its public methods, see below.
#
class MediaWiktory::Wikipedia::Purge < GetAction
  # Update the links tables.
  #
  # @param value [true, false]
  # @return [self]
  def forcelinkupdate(value = true)
    merge(forcelinkupdate: 'true') if value
  end
  # Update the links table, and update the links tables for any page that uses this page as a template.
  #
  # @param value [true, false]
  # @return [self]
  def forcerecursivelinkupdate(value = true)
    merge(forcerecursivelinkupdate: 'true') if value
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
Note: Generator parameter names must be prefixed with a "g", see examples.
  #
  # Supported options and their settings:
  #
  #  * `:allcategories` (Enumerate all categories.):
  #    * from (String) The category to start enumerating from.
  #    * continue (String) When more results are available, use this to continue.
  #    * to (String) The category to stop enumerating at.
  #    * prefix (String) Search for all category titles that begin with this value.
  #    * dir (String) Direction to sort in. One of "ascending", "descending".
  #    * min (Integer) Only return categories with at least this many members.
  #    * max (Integer) Only return categories with at most this many members.
  #    * limit (Integer, "max") How many categories to return.
  #    * prop (Array<String>) Which properties to get: Allowed values: "size" (Adds number of pages in the category), "hidden" (Tags categories that are hidden with __HIDDENCAT__).
  #  * `:alldeletedrevisions` (List all deleted revisions by a user or in a namespace.):
  #    * prop (Array<String>) Which properties to get for each revision: Allowed values: "ids" (The ID of the revision), "flags" (Revision flags (minor)), "timestamp" (The timestamp of the revision), "user" (User that made the revision), "userid" (User ID of the revision creator), "size" (Length (bytes) of the revision), "sha1" (SHA-1 (base 16) of the revision), "contentmodel" (Content model ID of the revision), "comment" (Comment by the user for the revision), "parsedcomment" (Parsed comment by the user for the revision), "content" (Text of the revision), "tags" (Tags for the revision), "parsetree" (The XML parse tree of revision content (requires content model wikitext)).
  #    * limit (Integer, "max") Limit how many revisions will be returned.
  #    * expandtemplates (true, false) Expand templates in revision content (requires adrprop=content).
  #    * generatexml (true, false) Generate XML parse tree for revision content (requires adrprop=content; replaced by adrprop=parsetree).
  #    * parse (true, false) Parse revision content (requires adrprop=content). For performance reasons, if this option is used, adrlimit is enforced to 1.
  #    * section (String) Only retrieve the content of this section number.
  #    * diffto (String) Revision ID to diff each revision to. Use prev, next and cur for the previous, next and current revision respectively.
  #    * difftotext (String) Text to diff each revision to. Only diffs a limited number of revisions. Overrides adrdiffto. If adrsection is set, only that section will be diffed against this text.
  #    * difftotextpst (true, false) Perform a pre-save transform on the text before diffing it. Only valid when used with adrdifftotext.
  #    * contentformat (String) Serialization format used for adrdifftotext and expected for output of content. One of "application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain".
  #    * user (String) Only list revisions by this user.
Note: Due to miser mode, using adruser and adrnamespace together may result in fewer than adrlimit results returned before continuing; in extreme cases, zero results may be returned.
  #    * namespace (Array<String>) Only list pages in this namespace.
Note: Due to miser mode, using adruser and adrnamespace together may result in fewer than adrlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * start (Time) The timestamp to start enumerating from.
  #    * end (Time) The timestamp to stop enumerating at.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: adrstart has to be before adrend), "older" (List newest first (default). Note: adrstart has to be later than adrend).
  #    * from (String) Start listing at this title.
  #    * to (String) Stop listing at this title.
  #    * prefix (String) Search for all page titles that begin with this value.
  #    * excludeuser (String) Don't list revisions by this user.
  #    * tag (String) Only list revisions tagged with this tag.
  #    * continue (String) When more results are available, use this to continue.
  #    * generatetitles (true, false) When being used as a generator, generate titles rather than revision IDs.
  #  * `:allfileusages` (List all file usages, including non-existing.):
  #    * continue (String) When more results are available, use this to continue.
  #    * from (String) The title of the file to start enumerating from.
  #    * to (String) The title of the file to stop enumerating at.
  #    * prefix (String) Search for all file titles that begin with this value.
  #    * unique (true, false) Only show distinct file titles. Cannot be used with afprop=ids.
When used as a generator, yields target pages instead of source pages.
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "ids" (Adds the page IDs of the using pages (cannot be used with afunique)), "title" (Adds the title of the file).
  #    * limit (Integer, "max") How many total items to return.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:allimages` (Enumerate all images sequentially.):
  #    * sort (String) Property to sort by. One of "name", "timestamp".
  #    * dir (String) The direction in which to list. One of "ascending", "descending", "newer", "older".
  #    * from (String) The image title to start enumerating from. Can only be used with aisort=name.
  #    * to (String) The image title to stop enumerating at. Can only be used with aisort=name.
  #    * continue (String) When more results are available, use this to continue.
  #    * start (Time) The timestamp to start enumerating from. Can only be used with aisort=timestamp.
  #    * end (Time) The timestamp to end enumerating. Can only be used with aisort=timestamp.
  #    * prop (Array<String>) Which file information to get: Allowed values: "timestamp" (Adds timestamp for the uploaded version), "user" (Adds the user who uploaded each file version), "userid" (Add the ID of the user that uploaded each file version), "comment" (Comment on the version), "parsedcomment" (Parse the comment on the version), "canonicaltitle" (Adds the canonical title of the file), "url" (Gives URL to the file and the description page), "size" (Adds the size of the file in bytes and the height, width and page count (if applicable)), "dimensions" (Alias for size), "sha1" (Adds SHA-1 hash for the file), "mime" (Adds MIME type of the file), "mediatype" (Adds the media type of the file), "metadata" (Lists Exif metadata for the version of the file), "commonmetadata" (Lists file format generic metadata for the version of the file), "extmetadata" (Lists formatted metadata combined from multiple sources. Results are HTML formatted), "bitdepth" (Adds the bit depth of the version), "badfile" (Adds whether the file is on the MediaWiki:Bad image list).
  #    * prefix (String) Search for all image titles that begin with this value. Can only be used with aisort=name.
  #    * minsize (Integer) Limit to images with at least this many bytes.
  #    * maxsize (Integer) Limit to images with at most this many bytes.
  #    * sha1 (String) SHA1 hash of image. Overrides aisha1base36.
  #    * sha1base36 (String) SHA1 hash of image in base 36 (used in MediaWiki).
  #    * user (String) Only return files uploaded by this user. Can only be used with aisort=timestamp. Cannot be used together with aifilterbots.
  #    * filterbots (String) How to filter files uploaded by bots. Can only be used with aisort=timestamp. Cannot be used together with aiuser. One of "all", "bots", "nobots".
  #    * mime (Array<String>) Disabled due to miser mode.
  #    * limit (Integer, "max") How many images in total to return.
  #  * `:alllinks` (Enumerate all links that point to a given namespace.):
  #    * continue (String) When more results are available, use this to continue.
  #    * from (String) The title of the link to start enumerating from.
  #    * to (String) The title of the link to stop enumerating at.
  #    * prefix (String) Search for all linked titles that begin with this value.
  #    * unique (true, false) Only show distinct linked titles. Cannot be used with alprop=ids.
When used as a generator, yields target pages instead of source pages.
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "ids" (Adds the page ID of the linking page (cannot be used with alunique)), "title" (Adds the title of the link).
  #    * namespace (String) The namespace to enumerate. One of "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") How many total items to return.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:allpages` (Enumerate all pages sequentially in a given namespace.):
  #    * from (String) The page title to start enumerating from.
  #    * continue (String) When more results are available, use this to continue.
  #    * to (String) The page title to stop enumerating at.
  #    * prefix (String) Search for all page titles that begin with this value.
  #    * namespace (String) The namespace to enumerate. One of "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * filterredir (String) Which pages to list.
Note: Due to miser mode, using this may result in fewer than aplimit results returned before continuing; in extreme cases, zero results may be returned. One of "all", "redirects", "nonredirects".
  #    * minsize (Integer) Limit to pages with at least this many bytes.
  #    * maxsize (Integer) Limit to pages with at most this many bytes.
  #    * prtype (Array<String>) Limit to protected pages only. Allowed values: "edit", "move", "upload".
  #    * prlevel (Array<String>) Filter protections based on protection level (must be used with apprtype= parameter). Allowed values: "autoconfirmed", "extendedconfirmed", "templateeditor", "sysop".
  #    * prfiltercascade (String) Filter protections based on cascadingness (ignored when apprtype isn't set). One of "cascading", "noncascading", "all".
  #    * limit (Integer, "max") How many total pages to return.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #    * filterlanglinks (String) Filter based on whether a page has langlinks. Note that this may not consider langlinks added by extensions. One of "withlanglinks", "withoutlanglinks", "all".
  #    * prexpiry (String) Which protection expiry to filter the page on: One of "indefinite" (Get only pages with indefinite protection expiry), "definite" (Get only pages with a definite (specific) protection expiry), "all" (Get pages with any protections expiry).
  #  * `:allredirects` (List all redirects to a namespace.):
  #    * continue (String) When more results are available, use this to continue.
  #    * from (String) The title of the redirect to start enumerating from.
  #    * to (String) The title of the redirect to stop enumerating at.
  #    * prefix (String) Search for all target pages that begin with this value.
  #    * unique (true, false) Only show distinct target pages. Cannot be used with arprop=ids|fragment|interwiki.
When used as a generator, yields target pages instead of source pages.
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "ids" (Adds the page ID of the redirecting page (cannot be used with arunique)), "title" (Adds the title of the redirect), "fragment" (Adds the fragment from the redirect, if any (cannot be used with arunique)), "interwiki" (Adds the interwiki prefix from the redirect, if any (cannot be used with arunique)).
  #    * namespace (String) The namespace to enumerate. One of "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") How many total items to return.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:allrevisions` (List all revisions.):
  #    * prop (Array<String>) Which properties to get for each revision: Allowed values: "ids" (The ID of the revision), "flags" (Revision flags (minor)), "timestamp" (The timestamp of the revision), "user" (User that made the revision), "userid" (User ID of the revision creator), "size" (Length (bytes) of the revision), "sha1" (SHA-1 (base 16) of the revision), "contentmodel" (Content model ID of the revision), "comment" (Comment by the user for the revision), "parsedcomment" (Parsed comment by the user for the revision), "content" (Text of the revision), "tags" (Tags for the revision), "parsetree" (The XML parse tree of revision content (requires content model wikitext)).
  #    * limit (Integer, "max") Limit how many revisions will be returned.
  #    * expandtemplates (true, false) Expand templates in revision content (requires arvprop=content).
  #    * generatexml (true, false) Generate XML parse tree for revision content (requires arvprop=content; replaced by arvprop=parsetree).
  #    * parse (true, false) Parse revision content (requires arvprop=content). For performance reasons, if this option is used, arvlimit is enforced to 1.
  #    * section (String) Only retrieve the content of this section number.
  #    * diffto (String) Revision ID to diff each revision to. Use prev, next and cur for the previous, next and current revision respectively.
  #    * difftotext (String) Text to diff each revision to. Only diffs a limited number of revisions. Overrides arvdiffto. If arvsection is set, only that section will be diffed against this text.
  #    * difftotextpst (true, false) Perform a pre-save transform on the text before diffing it. Only valid when used with arvdifftotext.
  #    * contentformat (String) Serialization format used for arvdifftotext and expected for output of content. One of "application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain".
  #    * user (String) Only list revisions by this user.
  #    * namespace (Array<String>) Only list pages in this namespace.
Note: Due to miser mode, using this may result in fewer than arvlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * start (Time) The timestamp to start enumerating from.
  #    * end (Time) The timestamp to stop enumerating at.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: arvstart has to be before arvend), "older" (List newest first (default). Note: arvstart has to be later than arvend).
  #    * excludeuser (String) Don't list revisions by this user.
  #    * continue (String) When more results are available, use this to continue.
  #    * generatetitles (true, false) When being used as a generator, generate titles rather than revision IDs.
  #  * `:alltransclusions` (List all transclusions (pages embedded using {{x}}), including non-existing.):
  #    * continue (String) When more results are available, use this to continue.
  #    * from (String) The title of the transclusion to start enumerating from.
  #    * to (String) The title of the transclusion to stop enumerating at.
  #    * prefix (String) Search for all transcluded titles that begin with this value.
  #    * unique (true, false) Only show distinct transcluded titles. Cannot be used with atprop=ids.
When used as a generator, yields target pages instead of source pages.
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "ids" (Adds the page ID of the transcluding page (cannot be used with atunique)), "title" (Adds the title of the transclusion).
  #    * namespace (String) The namespace to enumerate. One of "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") How many total items to return.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:backlinks` (Find all pages that link to the given page.):
  #    * title (String) Title to search. Cannot be used together with blpageid.
  #    * pageid (Integer) Page ID to search. Cannot be used together with bltitle.
  #    * continue (String) When more results are available, use this to continue.
  #    * namespace (Array<String>) The namespace to enumerate. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #    * filterredir (String) How to filter for redirects. If set to nonredirects when blredirect is enabled, this is only applied to the second level. One of "all", "redirects", "nonredirects".
  #    * limit (Integer, "max") How many total pages to return. If blredirect is enabled, the limit applies to each level separately (which means up to 2 * bllimit results may be returned).
  #    * redirect (true, false) If linking page is a redirect, find all pages that link to that redirect as well. Maximum limit is halved.
  #  * `:categories` (List all categories the pages belong to.):
  #    * prop (Array<String>) Which additional properties to get for each category: Allowed values: "sortkey" (Adds the sortkey (hexadecimal string) and sortkey prefix (human-readable part) for the category), "timestamp" (Adds timestamp of when the category was added), "hidden" (Tags categories that are hidden with __HIDDENCAT__).
  #    * show (Array<String>) Which kind of categories to show. Allowed values: "hidden", "!hidden".
  #    * limit (Integer, "max") How many categories to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * categories (Array<String>) Only list these categories. Useful for checking whether a certain page is in a certain category.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:categorymembers` (List all pages in a given category.):
  #    * title (String) Which category to enumerate (required). Must include the Category: prefix. Cannot be used together with cmpageid.
  #    * pageid (Integer) Page ID of the category to enumerate. Cannot be used together with cmtitle.
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "ids" (Adds the page ID), "title" (Adds the title and namespace ID of the page), "sortkey" (Adds the sortkey used for sorting in the category (hexadecimal string)), "sortkeyprefix" (Adds the sortkey prefix used for sorting in the category (human-readable part of the sortkey)), "type" (Adds the type that the page has been categorised as (page, subcat or file)), "timestamp" (Adds the timestamp of when the page was included).
  #    * namespace (Array<String>) Only include pages in these namespaces. Note that cmtype=subcat or cmtype=file may be used instead of cmnamespace=14 or 6.
Note: Due to miser mode, using this may result in fewer than cmlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * type (Array<String>) Which type of category members to include. Ignored when cmsort=timestamp is set. Allowed values: "page", "subcat", "file".
  #    * continue (String) When more results are available, use this to continue.
  #    * limit (Integer, "max") The maximum number of pages to return.
  #    * sort (String) Property to sort by. One of "sortkey", "timestamp".
  #    * dir (String) In which direction to sort. One of "asc", "desc", "ascending", "descending", "newer", "older".
  #    * start (Time) Timestamp to start listing from. Can only be used with cmsort=timestamp.
  #    * end (Time) Timestamp to end listing at. Can only be used with cmsort=timestamp.
  #    * starthexsortkey (String) Sortkey to start listing from, as returned by cmprop=sortkey. Can only be used with cmsort=sortkey.
  #    * endhexsortkey (String) Sortkey to end listing at, as returned by cmprop=sortkey. Can only be used with cmsort=sortkey.
  #    * startsortkeyprefix (String) Sortkey prefix to start listing from. Can only be used with cmsort=sortkey. Overrides cmstarthexsortkey.
  #    * endsortkeyprefix (String) Sortkey prefix to end listing before (not at; if this value occurs it will not be included!). Can only be used with cmsort=sortkey. Overrides cmendhexsortkey.
  #    * startsortkey (String) Use cmstarthexsortkey instead.
  #    * endsortkey (String) Use cmendhexsortkey instead.
  #  * `:deletedrevisions` (Get deleted revision information.
#
# May be used in several ways:):
  #    * prop (Array<String>) Which properties to get for each revision: Allowed values: "ids" (The ID of the revision), "flags" (Revision flags (minor)), "timestamp" (The timestamp of the revision), "user" (User that made the revision), "userid" (User ID of the revision creator), "size" (Length (bytes) of the revision), "sha1" (SHA-1 (base 16) of the revision), "contentmodel" (Content model ID of the revision), "comment" (Comment by the user for the revision), "parsedcomment" (Parsed comment by the user for the revision), "content" (Text of the revision), "tags" (Tags for the revision), "parsetree" (The XML parse tree of revision content (requires content model wikitext)).
  #    * limit (Integer, "max") Limit how many revisions will be returned.
  #    * expandtemplates (true, false) Expand templates in revision content (requires drvprop=content).
  #    * generatexml (true, false) Generate XML parse tree for revision content (requires drvprop=content; replaced by drvprop=parsetree).
  #    * parse (true, false) Parse revision content (requires drvprop=content). For performance reasons, if this option is used, drvlimit is enforced to 1.
  #    * section (String) Only retrieve the content of this section number.
  #    * diffto (String) Revision ID to diff each revision to. Use prev, next and cur for the previous, next and current revision respectively.
  #    * difftotext (String) Text to diff each revision to. Only diffs a limited number of revisions. Overrides drvdiffto. If drvsection is set, only that section will be diffed against this text.
  #    * difftotextpst (true, false) Perform a pre-save transform on the text before diffing it. Only valid when used with drvdifftotext.
  #    * contentformat (String) Serialization format used for drvdifftotext and expected for output of content. One of "application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain".
  #    * start (Time) The timestamp to start enumerating from. Ignored when processing a list of revision IDs.
  #    * end (Time) The timestamp to stop enumerating at. Ignored when processing a list of revision IDs.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: drvstart has to be before drvend), "older" (List newest first (default). Note: drvstart has to be later than drvend).
  #    * tag (String) Only list revisions tagged with this tag.
  #    * user (String) Only list revisions by this user.
  #    * excludeuser (String) Don't list revisions by this user.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:duplicatefiles` (List all files that are duplicates of the given files based on hash values.):
  #    * limit (Integer, "max") How many duplicate files to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #    * localonly (true, false) Look only for files in the local repository.
  #  * `:embeddedin` (Find all pages that embed (transclude) the given title.):
  #    * title (String) Title to search. Cannot be used together with eipageid.
  #    * pageid (Integer) Page ID to search. Cannot be used together with eititle.
  #    * continue (String) When more results are available, use this to continue.
  #    * namespace (Array<String>) The namespace to enumerate. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #    * filterredir (String) How to filter for redirects. One of "all", "redirects", "nonredirects".
  #    * limit (Integer, "max") How many total pages to return.
  #  * `:exturlusage` (Enumerate pages that contain a given URL.):
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "ids" (Adds the ID of page), "title" (Adds the title and namespace ID of the page), "url" (Adds the URL used in the page).
  #    * offset (Integer) When more results are available, use this to continue.
  #    * protocol (String) Protocol of the URL. If empty and euquery is set, the protocol is http. Leave both this and euquery empty to list all external links. One of "bitcoin", "ftp", "ftps", "geo", "git", "gopher", "http", "https", "irc", "ircs", "magnet", "mailto", "mms", "news", "nntp", "redis", "sftp", "sip", "sips", "sms", "ssh", "svn", "tel", "telnet", "urn", "worldwind", "xmpp".
  #    * query (String) Search string without protocol. See Special:LinkSearch. Leave empty to list all external links.
  #    * namespace (Array<String>) The page namespaces to enumerate.
Note: Due to miser mode, using this may result in fewer than eulimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") How many pages to return.
  #    * expandurl (true, false) Expand protocol-relative URLs with the canonical protocol.
  #  * `:fileusage` (Find all pages that use the given files.):
  #    * prop (Array<String>) Which properties to get: Allowed values: "pageid" (Page ID of each page), "title" (Title of each page), "redirect" (Flag if the page is a redirect).
  #    * namespace (Array<String>) Only include pages in these namespaces. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * show (Array<String>) Show only items that meet these criteria: Allowed values: "redirect" (Only show redirects), "!redirect" (Only show non-redirects).
  #    * limit (Integer, "max") How many to return.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:geosearch` (Returns pages having coordinates that are located in a certain area.):
  #    * coord (String) Coordinate around which to search.
Format: Latitude and longitude separated by pipe ("|").
  #    * page (String) Title of page around which to search.
  #    * bbox (String) Bounding box to search in: pipe (|) separated coordinates of top left and bottom right corners.
  #    * radius (Integer) Search radius in meters.
  #    * maxdim (Integer) Restrict search to objects no larger than this, in meters.
  #    * limit (Integer, "max") Maximum number of pages to return.
  #    * globe (String) Globe to search on (by default "earth"). One of "earth".
  #    * namespace (Array<String>) Namespaces to search. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * prop (Array<String>) Which additional coordinate properties to return. Allowed values: "type", "name", "dim", "country", "region", "globe".
  #    * primary (String) Whether to return only primary coordinates ("primary"), secondary ("secondary") or both ("all"). One of "primary", "secondary", "all".
  #    * debug (true, false) Whether debug information should be returned.
  #  * `:gettingstartedgetpages` (This API is for getting a list of one or more pages related to a particular GettingStarted task.):
  #    * taskname (String) Task name, generally either "copyedit" (copy-editing suggestions) or "morelike" (pages similar to the base page/excluded title)
  #    * excludedtitle (String) Full title of a page to exclude from the list; also used as the base title for recommendations based on a given page
  #    * count (Integer) Requested count; will attempt to fetch this exact number, but may fetch fewer if no more are found after multiple attempts
  #  * `:images` (Returns all files contained on the given pages.):
  #    * limit (Integer, "max") How many files to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * images (Array<String>) Only list these files. Useful for checking whether a certain page has a certain file.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:imageusage` (Find all pages that use the given image title.):
  #    * title (String) Title to search. Cannot be used together with iupageid.
  #    * pageid (Integer) Page ID to search. Cannot be used together with iutitle.
  #    * continue (String) When more results are available, use this to continue.
  #    * namespace (Array<String>) The namespace to enumerate. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #    * filterredir (String) How to filter for redirects. If set to nonredirects when iuredirect is enabled, this is only applied to the second level. One of "all", "redirects", "nonredirects".
  #    * limit (Integer, "max") How many total pages to return. If iuredirect is enabled, the limit applies to each level separately (which means up to 2 * iulimit results may be returned).
  #    * redirect (true, false) If linking page is a redirect, find all pages that link to that redirect as well. Maximum limit is halved.
  #  * `:iwbacklinks` (Find all pages that link to the given interwiki link.
#
# Can be used to find all links with a prefix, or all links to a title (with a given prefix). Using neither parameter is effectively "all interwiki links".):
  #    * prefix (String) Prefix for the interwiki.
  #    * title (String) Interwiki link to search for. Must be used with iwblblprefix.
  #    * continue (String) When more results are available, use this to continue.
  #    * limit (Integer, "max") How many total pages to return.
  #    * prop (Array<String>) Which properties to get: Allowed values: "iwprefix" (Adds the prefix of the interwiki), "iwtitle" (Adds the title of the interwiki).
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:langbacklinks` (Find all pages that link to the given language link.
#
# Can be used to find all links with a language code, or all links to a title (with a given language). Using neither parameter is effectively "all language links".
#
# Note that this may not consider language links added by extensions.):
  #    * lang (String) Language for the language link.
  #    * title (String) Language link to search for. Must be used with lbllang.
  #    * continue (String) When more results are available, use this to continue.
  #    * limit (Integer, "max") How many total pages to return.
  #    * prop (Array<String>) Which properties to get: Allowed values: "lllang" (Adds the language code of the language link), "lltitle" (Adds the title of the language link).
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:links` (Returns all links from the given pages.):
  #    * namespace (Array<String>) Show links in these namespaces only. Allowed values: "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") How many links to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * titles (Array<String>) Only list links to these titles. Useful for checking whether a certain page links to a certain title.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:linkshere` (Find all pages that link to the given pages.):
  #    * prop (Array<String>) Which properties to get: Allowed values: "pageid" (Page ID of each page), "title" (Title of each page), "redirect" (Flag if the page is a redirect).
  #    * namespace (Array<String>) Only include pages in these namespaces. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * show (Array<String>) Show only items that meet these criteria: Allowed values: "redirect" (Only show redirects), "!redirect" (Only show non-redirects).
  #    * limit (Integer, "max") How many to return.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:mostviewed` (Lists the most viewed pages (based on last day's pageview count).):
  #    * metric (String) The metric to use for counting views. Depending on what backend is used, not all metrics might be supported. You can use the siteinfo API (action=query&meta=siteinfo) to check, under pageviewservice-supported-metrics / <module name> One of "pageviews" (Plain pageviews).
  #    * limit (Integer, "max") The number of pages to return.
  #    * offset (Integer) When more results are available, use this to continue.
  #  * `:oldreviewedpages` (Enumerates pages that have changes pending review.):
  #    * start (Time) Start listing at this timestamp.
  #    * end (Time) Stop listing at this timestamp.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: orstart has to be before orend), "older" (List newest first (default). Note: orstart has to be later than orend).
  #    * maxsize (Integer) Maximum character count change size.
  #    * filterwatched (String) How to filter for pages on your watchlist. One of "watched", "all".
  #    * namespace (Array<String>) The namespaces to enumerate. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * category (String) Show pages only in the given category.
  #    * filterredir (String) How to filter for redirects. One of "redirects", "nonredirects", "all".
  #    * limit (Integer, "max") How many total pages to return.
  #  * `:pageswithprop` (List all pages using a given page property.):
  #    * propname (String) Page property for which to enumerate pages (action=query&list=pagepropnames returns page property names in use).
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "ids" (Adds the page ID), "title" (Adds the title and namespace ID of the page), "value" (Adds the value of the page property).
  #    * continue (String) When more results are available, use this to continue.
  #    * limit (Integer, "max") The maximum number of pages to return.
  #    * dir (String) In which direction to sort. One of "ascending", "descending".
  #  * `:prefixsearch` (Perform a prefix search for page titles.
#
# Despite the similarity in names, this module is not intended to be equivalent to Special:PrefixIndex; for that, see action=query&list=allpages with the apprefix parameter. The purpose of this module is similar to action=opensearch: to take user input and provide the best-matching titles. Depending on the search engine backend, this might include typo correction, redirect avoidance, or other heuristics.):
  #    * search (String) Search string.
  #    * namespace (Array<String>) Namespaces to search. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") Maximum number of results to return.
  #    * offset (Integer) When more results are available, use this to continue.
  #    * profile (String) Search profile to use. One of "strict" (Strict profile with few punctuation characters removed but diacritics and stress marks are kept), "normal" (Few punctuation characters, some diacritics and stopwords removed), "fuzzy" (Similar to normal with typo correction (two typos supported)), "fast-fuzzy" ((no description)), "classic" (Classic prefix, few punctuation characters and some diacritics removed).
  #  * `:projectpages` (List all pages associated with one or more projects.):
  #    * assessments (true, false) Also return assessments for the pages returned.
  #    * projects (Array<String>) The projects to list pages for. If this parameter is omitted, all projects will be included.
  #    * limit (Integer, "max") The maximum number of pages to return.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:protectedtitles` (List all titles protected from creation.):
  #    * namespace (Array<String>) Only list titles in these namespaces. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * level (Array<String>) Only list titles with these protection levels. Allowed values: "autoconfirmed", "extendedconfirmed", "templateeditor", "sysop".
  #    * limit (Integer, "max") How many total pages to return.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: ptstart has to be before ptend), "older" (List newest first (default). Note: ptstart has to be later than ptend).
  #    * start (Time) Start listing at this protection timestamp.
  #    * end (Time) Stop listing at this protection timestamp.
  #    * prop (Array<String>) Which properties to get: Allowed values: "timestamp" (Adds the timestamp of when protection was added), "user" (Adds the user that added the protection), "userid" (Adds the user ID that added the protection), "comment" (Adds the comment for the protection), "parsedcomment" (Adds the parsed comment for the protection), "expiry" (Adds the timestamp of when the protection will be lifted), "level" (Adds the protection level).
  #    * continue (String) When more results are available, use this to continue.
  #  * `:querypage` (Get a list provided by a QueryPage-based special page.):
  #    * page (String) The name of the special page. Note, this is case sensitive. One of "Ancientpages", "BrokenRedirects", "Deadendpages", "DoubleRedirects", "ListDuplicatedFiles", "Listredirects", "Lonelypages", "Longpages", "MediaStatistics", "Mostcategories", "Mostimages", "Mostinterwikis", "Mostlinkedcategories", "Mostlinkedtemplates", "Mostlinked", "Mostrevisions", "Fewestrevisions", "Shortpages", "Uncategorizedcategories", "Uncategorizedpages", "Uncategorizedimages", "Uncategorizedtemplates", "Unusedcategories", "Unusedimages", "Wantedcategories", "Wantedfiles", "Wantedpages", "Wantedtemplates", "Unwatchedpages", "Unusedtemplates", "Withoutinterwiki", "UnconnectedPages", "PagesWithBadges", "EntityUsage", "GadgetUsage", "MostGloballyLinkedFiles", "GloballyWantedFiles", "DisambiguationPages", "DisambiguationPageLinks".
  #    * offset (Integer) When more results are available, use this to continue.
  #    * limit (Integer, "max") Number of results to return.
  #  * `:random` (Get a set of random pages.
#
# Pages are listed in a fixed sequence, only the starting point is random. This means that if, for example, Main Page is the first random page in the list, List of fictional monkeys will always be second, List of people on stamps of Vanuatu third, etc.):
  #    * namespace (Array<String>) Return pages in these namespaces only. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * filterredir (String) How to filter for redirects. One of "all", "redirects", "nonredirects".
  #    * redirect (true, false) Use rnfilterredir=redirects instead.
  #    * limit (Integer, "max") Limit how many random pages will be returned.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:recentchanges` (Enumerate recent changes.):
  #    * start (Time) The timestamp to start enumerating from.
  #    * end (Time) The timestamp to end enumerating.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: rcstart has to be before rcend), "older" (List newest first (default). Note: rcstart has to be later than rcend).
  #    * namespace (Array<String>) Filter changes to only these namespaces. Allowed values: "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * user (String) Only list changes by this user.
  #    * excludeuser (String) Don't list changes by this user.
  #    * tag (String) Only list changes tagged with this tag.
  #    * prop (Array<String>) Include additional pieces of information: Allowed values: "user" (Adds the user responsible for the edit and tags if they are an IP), "userid" (Adds the user ID responsible for the edit), "comment" (Adds the comment for the edit), "parsedcomment" (Adds the parsed comment for the edit), "flags" (Adds flags for the edit), "timestamp" (Adds timestamp of the edit), "title" (Adds the page title of the edit), "ids" (Adds the page ID, recent changes ID and the new and old revision ID), "sizes" (Adds the new and old page length in bytes), "redirect" (Tags edit if page is a redirect), "patrolled" (Tags patrollable edits as being patrolled or unpatrolled), "loginfo" (Adds log information (log ID, log type, etc) to log entries), "tags" (Lists tags for the entry), "sha1" (Adds the content checksum for entries associated with a revision).
  #    * token (Array<String>) Use action=query&meta=tokens instead. Allowed values: "patrol".
  #    * show (Array<String>) Show only items that meet these criteria. For example, to see only minor edits done by logged-in users, set rcshow=minor|!anon. Allowed values: "minor", "!minor", "bot", "!bot", "anon", "!anon", "redirect", "!redirect", "patrolled", "!patrolled", "unpatrolled".
  #    * limit (Integer, "max") How many total changes to return.
  #    * type (Array<String>) Which types of changes to show. Allowed values: "edit", "new", "log", "external", "categorize".
  #    * toponly (true, false) Only list changes which are the latest revision.
  #    * continue (String) When more results are available, use this to continue.
  #    * generaterevisions (true, false) When being used as a generator, generate revision IDs rather than titles. Recent change entries without associated revision IDs (e.g. most log entries) will generate nothing.
  #  * `:redirects` (Returns all redirects to the given pages.):
  #    * prop (Array<String>) Which properties to get: Allowed values: "pageid" (Page ID of each redirect), "title" (Title of each redirect), "fragment" (Fragment of each redirect, if any).
  #    * namespace (Array<String>) Only include pages in these namespaces.
Note: Due to miser mode, using this may result in fewer than rdlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * show (Array<String>) Show only items that meet these criteria: Allowed values: "fragment" (Only show redirects with a fragment), "!fragment" (Only show redirects without a fragment).
  #    * limit (Integer, "max") How many redirects to return.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:revisions` (Get revision information.
#
# May be used in several ways:):
  #    * prop (Array<String>) Which properties to get for each revision: Allowed values: "ids" (The ID of the revision), "flags" (Revision flags (minor)), "timestamp" (The timestamp of the revision), "user" (User that made the revision), "userid" (User ID of the revision creator), "size" (Length (bytes) of the revision), "sha1" (SHA-1 (base 16) of the revision), "contentmodel" (Content model ID of the revision), "comment" (Comment by the user for the revision), "parsedcomment" (Parsed comment by the user for the revision), "content" (Text of the revision), "tags" (Tags for the revision), "parsetree" (The XML parse tree of revision content (requires content model wikitext)), "flagged" (Flagged status of the revision).
  #    * limit (Integer, "max") Limit how many revisions will be returned.
  #    * expandtemplates (true, false) Expand templates in revision content (requires rvprop=content).
  #    * generatexml (true, false) Generate XML parse tree for revision content (requires rvprop=content; replaced by rvprop=parsetree).
  #    * parse (true, false) Parse revision content (requires rvprop=content). For performance reasons, if this option is used, rvlimit is enforced to 1.
  #    * section (String) Only retrieve the content of this section number.
  #    * diffto (String) Revision ID to diff each revision to. Use prev, next and cur for the previous, next and current revision respectively.
  #    * difftotext (String) Text to diff each revision to. Only diffs a limited number of revisions. Overrides rvdiffto. If rvsection is set, only that section will be diffed against this text.
  #    * difftotextpst (true, false) Perform a pre-save transform on the text before diffing it. Only valid when used with rvdifftotext.
  #    * contentformat (String) Serialization format used for rvdifftotext and expected for output of content. One of "application/json", "text/x-wiki", "text/javascript", "text/css", "text/plain".
  #    * startid (Integer) From which revision ID to start enumeration.
  #    * endid (Integer) Stop revision enumeration on this revision ID.
  #    * start (Time) From which revision timestamp to start enumeration.
  #    * end (Time) Enumerate up to this timestamp.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: rvstart has to be before rvend), "older" (List newest first (default). Note: rvstart has to be later than rvend).
  #    * user (String) Only include revisions made by user.
  #    * excludeuser (String) Exclude revisions made by user.
  #    * tag (String) Only list revisions tagged with this tag.
  #    * token (Array<String>) Which tokens to obtain for each revision. Allowed values: "rollback".
  #    * continue (String) When more results are available, use this to continue.
  #  * `:search` (Perform a full text search.):
  #    * search (String) Search for page titles or content matching this value. You can use the search string to invoke special search features, depending on what the wiki's search backend implements.
  #    * namespace (Array<String>) Search only within these namespaces. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") How many total pages to return.
  #    * offset (Integer) When more results are available, use this to continue.
  #    * qiprofile (String) Query independent profile to use (affects ranking algorithm). One of "classic" (Ranking based on the number of incoming links, some templates, article language and recency (templates/language/recency may not be activated on this wiki)), "classic_noboostlinks" (Ranking based on some templates, article language and recency when activated on this wiki), "empty" (Ranking based solely on query dependent features (for debug only)), "wsum_inclinks" ((no description)), "wsum_inclinks_pv" ((no description)), "popular_inclinks_pv" (Ranking based primarily on page views), "popular_inclinks" (Ranking based primarily on incoming link counts).
  #    * what (String) Which type of search to perform. One of "title", "text", "nearmatch".
  #    * info (Array<String>) Which metadata to return. Allowed values: "totalhits", "suggestion", "rewrittenquery".
  #    * prop (Array<String>) Which properties to return: Allowed values: "size" (Adds the size of the page in bytes), "wordcount" (Adds the word count of the page), "timestamp" (Adds the timestamp of when the page was last edited), "snippet" (Adds a parsed snippet of the page), "titlesnippet" (Adds a parsed snippet of the page title), "redirecttitle" (Adds the title of the matching redirect), "redirectsnippet" (Adds a parsed snippet of the redirect title), "sectiontitle" (Adds the title of the matching section), "sectionsnippet" (Adds a parsed snippet of the matching section title), "isfilematch" (Adds a boolean indicating if the search matched file content), "categorysnippet" (Adds a parsed snippet of the matching category), "score" (Deprecated and ignored), "hasrelated" (Deprecated and ignored).
  #    * interwiki (true, false) Include interwiki results in the search, if available.
  #    * enablerewrites (true, false) Enable internal query rewriting. Some search backends can rewrite the query into one its thinks gives better results, such as correcting spelling errors.
  #  * `:templates` (Returns all pages transcluded on the given pages.):
  #    * namespace (Array<String>) Show templates in this namespaces only. Allowed values: "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") How many templates to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * templates (Array<String>) Only list these templates. Useful for checking whether a certain page uses a certain template.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:transcludedin` (Find all pages that transclude the given pages.):
  #    * prop (Array<String>) Which properties to get: Allowed values: "pageid" (Page ID of each page), "title" (Title of each page), "redirect" (Flag if the page is a redirect).
  #    * namespace (Array<String>) Only include pages in these namespaces. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * show (Array<String>) Show only items that meet these criteria: Allowed values: "redirect" (Only show redirects), "!redirect" (Only show non-redirects).
  #    * limit (Integer, "max") How many to return.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:watchlist` (Get recent changes to pages in the current user's watchlist.):
  #    * allrev (true, false) Include multiple revisions of the same page within given timeframe.
  #    * start (Time) The timestamp to start enumerating from.
  #    * end (Time) The timestamp to end enumerating.
  #    * namespace (Array<String>) Filter changes to only the given namespaces. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * user (String) Only list changes by this user.
  #    * excludeuser (String) Don't list changes by this user.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: wlstart has to be before wlend), "older" (List newest first (default). Note: wlstart has to be later than wlend).
  #    * limit (Integer, "max") How many total results to return per request.
  #    * prop (Array<String>) Which additional properties to get: Allowed values: "ids" (Adds revision IDs and page IDs), "title" (Adds title of the page), "flags" (Adds flags for the edit), "user" (Adds the user who made the edit), "userid" (Adds user ID of whoever made the edit), "comment" (Adds comment of the edit), "parsedcomment" (Adds parsed comment of the edit), "timestamp" (Adds timestamp of the edit), "patrol" (Tags edits that are patrolled), "sizes" (Adds the old and new lengths of the page), "notificationtimestamp" (Adds timestamp of when the user was last notified about the edit), "loginfo" (Adds log information where appropriate).
  #    * show (Array<String>) Show only items that meet these criteria. For example, to see only minor edits done by logged-in users, set wlshow=minor|!anon. Allowed values: "minor", "!minor", "bot", "!bot", "anon", "!anon", "patrolled", "!patrolled", "unread", "!unread".
  #    * type (Array<String>) Which types of changes to show: Allowed values: "edit" (Regular page edits), "new" (Page creations), "log" (Log entries), "external" (External changes), "categorize" (Category membership changes).
  #    * owner (String) Used along with wltoken to access a different user's watchlist.
  #    * token (String) A security token (available in the user's preferences) to allow access to another user's watchlist.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:watchlistraw` (Get all pages on the current user's watchlist.):
  #    * continue (String) When more results are available, use this to continue.
  #    * namespace (Array<String>) Only list pages in the given namespaces. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") How many total results to return per request.
  #    * prop (Array<String>) Which additional properties to get: Allowed values: "changed" (Adds timestamp of when the user was last notified about the edit).
  #    * show (Array<String>) Only list items that meet these criteria. Allowed values: "changed", "!changed".
  #    * owner (String) Used along with wrtoken to access a different user's watchlist.
  #    * token (String) A security token (available in the user's preferences) to allow access to another user's watchlist.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #    * fromtitle (String) Title (with namespace prefix) to begin enumerating from.
  #    * totitle (String) Title (with namespace prefix) to stop enumerating at.
  #  * `:wblistentityusage` (Returns all pages that use the given entity IDs.):
  #    * prop (Array<String>) Properties to add to the result. Allowed values: "url" (If enabled the url of the entity will be added to the result).
  #    * aspect (Array<String>) Only return entity IDs that used this aspect. Allowed values: "S", "L", "T", "X", "O".
  #    * entities (Array<String>) Entities that have been used.
  #    * limit (Integer, "max") How many entity usages to return.
  #    * continue (String) When more results are available, use this to continue.
  #
  # @param value [Symbol, Hash] Either symbol of selected option, or `{symbol: settings}` Hash.
  # @return [self]
  def generator(value)
    merge(generator: module_to_hash(value, [:allcategories, :alldeletedrevisions, :allfileusages, :allimages, :alllinks, :allpages, :allredirects, :allrevisions, :alltransclusions, :backlinks, :categories, :categorymembers, :deletedrevisions, :duplicatefiles, :embeddedin, :exturlusage, :fileusage, :geosearch, :gettingstartedgetpages, :images, :imageusage, :iwbacklinks, :langbacklinks, :links, :linkshere, :mostviewed, :oldreviewedpages, :pageswithprop, :prefixsearch, :projectpages, :protectedtitles, :querypage, :random, :recentchanges, :redirects, :revisions, :search, :templates, :transcludedin, :watchlist, :watchlistraw, :wblistentityusage]))
  end
  # Automatically resolve redirects in titles, pageids, and revids, and in pages returned by generator.
  #
  # @param value [true, false]
  # @return [self]
  def redirects(value = true)
    merge(redirects: 'true') if value
  end
  # Convert titles to other variants if necessary. Only works if the wiki's content language supports variant conversion. Languages that support variant conversion include gan, iu, kk, ku, shi, sr, tg, uz and zh.
  #
  # @param value [true, false]
  # @return [self]
  def converttitles(value = true)
    merge(converttitles: 'true') if value
  end

end