# Fetch data from and about MediaWiki.
#
# All data modifications will first have to use query to acquire a token to prevent abuse from malicious sites.
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
class MediaWiktory::Wikipedia::Query < GetAction
  # Which properties to get for the queried pages.
  #
  # Supported options and their settings:
  #
  #  * `:categories` (List all categories the pages belong to.):
  #    * prop (Array<String>) Which additional properties to get for each category: Allowed values: "sortkey" (Adds the sortkey (hexadecimal string) and sortkey prefix (human-readable part) for the category), "timestamp" (Adds timestamp of when the category was added), "hidden" (Tags categories that are hidden with __HIDDENCAT__).
  #    * show (Array<String>) Which kind of categories to show. Allowed values: "hidden", "!hidden".
  #    * limit (Integer, "max") How many categories to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * categories (Array<String>) Only list these categories. Useful for checking whether a certain page is in a certain category.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:categoryinfo` (Returns information about the given categories.):
  #    * continue (String) When more results are available, use this to continue.
  #  * `:contributors` (Get the list of logged-in contributors and the count of anonymous contributors to a page.):
  #    * group (Array<String>) Only include users in the given groups. Does not include implicit or auto-promoted groups like *, user, or autoconfirmed. Allowed values: "bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor".
  #    * excludegroup (Array<String>) Exclude users in the given groups. Does not include implicit or auto-promoted groups like *, user, or autoconfirmed. Allowed values: "bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor".
  #    * rights (Array<String>) Only include users having the given rights. Does not include rights granted by implicit or auto-promoted groups like *, user, or autoconfirmed. Allowed values: "apihighlimits", "applychangetags", "autoconfirmed", "autocreateaccount", "autopatrol", "bigdelete", "block", "blockemail", "bot", "browsearchive", "changetags", "createaccount", "createpage", "createtalk", "delete", "deletechangetags", "deletedhistory", "deletedtext", "deletelogentry", "deleterevision", "edit", "editcontentmodel", "editinterface", "editprotected", "editmyoptions", "editmyprivateinfo", "editmyusercss", "editmyuserjs", "editmywatchlist", "editsemiprotected", "editusercssjs", "editusercss", "edituserjs", "hideuser", "import", "importupload", "ipblock-exempt", "managechangetags", "markbotedits", "mergehistory", "minoredit", "move", "movefile", "move-categorypages", "move-rootuserpages", "move-subpages", "nominornewtalk", "noratelimit", "override-export-depth", "pagelang", "patrol", "patrolmarks", "protect", "purge", "read", "reupload", "reupload-own", "reupload-shared", "rollback", "sendemail", "siteadmin", "suppressionlog", "suppressredirect", "suppressrevision", "unblockself", "undelete", "unwatchedpages", "upload", "upload_by_url", "userrights", "userrights-interwiki", "viewmyprivateinfo", "viewmywatchlist", "viewsuppressed", "writeapi", "spamblacklistlog", "tboverride", "tboverride-account", "titleblacklistlog", "gadgets-edit", "gadgets-definition-edit", "globalblock", "globalblock-whitelist", "globalblock-exempt", "securepoll-create-poll", "renameuser", "nuke", "torunblocked", "skipcaptcha", "override-antispoof", "centralauth-merge", "centralauth-unmerge", "centralauth-lock", "centralauth-oversight", "globalgrouppermissions", "globalgroupmembership", "centralauth-rename", "centralauth-usermerge", "abusefilter-modify", "abusefilter-log-detail", "abusefilter-view", "abusefilter-log", "abusefilter-private", "abusefilter-modify-restricted", "abusefilter-revert", "abusefilter-view-private", "abusefilter-log-private", "abusefilter-hidden-log", "abusefilter-hide-log", "abusefilter-modify-global", "massmessage", "vipsscaler-test", "ep-org", "ep-course", "ep-token", "ep-enroll", "ep-remstudent", "ep-online", "ep-campus", "ep-instructor", "ep-beonline", "ep-becampus", "ep-beinstructor", "ep-bereviewer", "ep-remreviewer", "ep-bulkdelorgs", "ep-bulkdelcourses", "ep-remarticle", "ep-addstudent", "usermerge", "mwoauthproposeconsumer", "mwoauthupdateownconsumer", "mwoauthmanageconsumer", "mwoauthsuppress", "mwoauthviewsuppressed", "mwoauthviewprivate", "mwoauthmanagemygrants", "oathauth-enable", "oathauth-api-all", "checkuser", "checkuser-log", "autoreviewrestore", "stablesettings", "review", "unreviewedpages", "movestable", "validate", "templateeditor", "editeditorprotected", "editextendedsemiprotected", "extendedconfirmed", "flow-create-board", "flow-edit-post", "flow-suppress", "flow-hide", "flow-delete", "viewdeletedfile", "autoreview", "transcode-reset", "transcode-status", "collectionsaveasuserpage", "collectionsaveascommunitypage".
  #    * excluderights (Array<String>) Exclude users having the given rights. Does not include rights granted by implicit or auto-promoted groups like *, user, or autoconfirmed. Allowed values: "apihighlimits", "applychangetags", "autoconfirmed", "autocreateaccount", "autopatrol", "bigdelete", "block", "blockemail", "bot", "browsearchive", "changetags", "createaccount", "createpage", "createtalk", "delete", "deletechangetags", "deletedhistory", "deletedtext", "deletelogentry", "deleterevision", "edit", "editcontentmodel", "editinterface", "editprotected", "editmyoptions", "editmyprivateinfo", "editmyusercss", "editmyuserjs", "editmywatchlist", "editsemiprotected", "editusercssjs", "editusercss", "edituserjs", "hideuser", "import", "importupload", "ipblock-exempt", "managechangetags", "markbotedits", "mergehistory", "minoredit", "move", "movefile", "move-categorypages", "move-rootuserpages", "move-subpages", "nominornewtalk", "noratelimit", "override-export-depth", "pagelang", "patrol", "patrolmarks", "protect", "purge", "read", "reupload", "reupload-own", "reupload-shared", "rollback", "sendemail", "siteadmin", "suppressionlog", "suppressredirect", "suppressrevision", "unblockself", "undelete", "unwatchedpages", "upload", "upload_by_url", "userrights", "userrights-interwiki", "viewmyprivateinfo", "viewmywatchlist", "viewsuppressed", "writeapi", "spamblacklistlog", "tboverride", "tboverride-account", "titleblacklistlog", "gadgets-edit", "gadgets-definition-edit", "globalblock", "globalblock-whitelist", "globalblock-exempt", "securepoll-create-poll", "renameuser", "nuke", "torunblocked", "skipcaptcha", "override-antispoof", "centralauth-merge", "centralauth-unmerge", "centralauth-lock", "centralauth-oversight", "globalgrouppermissions", "globalgroupmembership", "centralauth-rename", "centralauth-usermerge", "abusefilter-modify", "abusefilter-log-detail", "abusefilter-view", "abusefilter-log", "abusefilter-private", "abusefilter-modify-restricted", "abusefilter-revert", "abusefilter-view-private", "abusefilter-log-private", "abusefilter-hidden-log", "abusefilter-hide-log", "abusefilter-modify-global", "massmessage", "vipsscaler-test", "ep-org", "ep-course", "ep-token", "ep-enroll", "ep-remstudent", "ep-online", "ep-campus", "ep-instructor", "ep-beonline", "ep-becampus", "ep-beinstructor", "ep-bereviewer", "ep-remreviewer", "ep-bulkdelorgs", "ep-bulkdelcourses", "ep-remarticle", "ep-addstudent", "usermerge", "mwoauthproposeconsumer", "mwoauthupdateownconsumer", "mwoauthmanageconsumer", "mwoauthsuppress", "mwoauthviewsuppressed", "mwoauthviewprivate", "mwoauthmanagemygrants", "oathauth-enable", "oathauth-api-all", "checkuser", "checkuser-log", "autoreviewrestore", "stablesettings", "review", "unreviewedpages", "movestable", "validate", "templateeditor", "editeditorprotected", "editextendedsemiprotected", "extendedconfirmed", "flow-create-board", "flow-edit-post", "flow-suppress", "flow-hide", "flow-delete", "viewdeletedfile", "autoreview", "transcode-reset", "transcode-status", "collectionsaveasuserpage", "collectionsaveascommunitypage".
  #    * limit (Integer, "max") How many contributors to return.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:coordinates` (Returns coordinates of the given pages.):
  #    * limit (Integer, "max") How many coordinates to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * prop (Array<String>) Which additional coordinate properties to return. Allowed values: "type", "name", "dim", "country", "region", "globe".
  #    * primary (String) Whether to return only primary coordinates ("primary"), secondary ("secondary") or both ("all"). One of "primary", "secondary", "all".
  #    * distancefrompoint (String) Return distance in meters from the geographical coordinates of every valid result from the given coordinates. Format: Latitude and longitude separated by pipe ("|").
  #    * distancefrompage (String) Return distance in meters from the geographical coordinates of every valid result from the coordinates of this page.
  #  * `:deletedrevisions` (Get deleted revision information. May be used in several ways:):
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
  #  * `:extlinks` (Returns all external URLs (not interwikis) from the given pages.):
  #    * limit (Integer, "max") How many links to return.
  #    * offset (Integer) When more results are available, use this to continue.
  #    * protocol (String) Protocol of the URL. If empty and elquery is set, the protocol is http. Leave both this and elquery empty to list all external links. One of "bitcoin", "ftp", "ftps", "geo", "git", "gopher", "http", "https", "irc", "ircs", "magnet", "mailto", "mms", "news", "nntp", "redis", "sftp", "sip", "sips", "sms", "ssh", "svn", "tel", "telnet", "urn", "worldwind", "xmpp".
  #    * query (String) Search string without protocol. Useful for checking whether a certain page contains a certain external url.
  #    * expandurl (true, false) Expand protocol-relative URLs with the canonical protocol.
  #  * `:extracts` (Returns plain-text or limited HTML extracts of the given pages.):
  #    * chars (Integer) How many characters to return. Actual text returned might be slightly longer.
  #    * sentences (Integer) How many sentences to return.
  #    * limit (Integer, "max") How many extracts to return. (Multiple extracts can only be returned if exintro is set to true.)
  #    * intro (true, false) Return only content before the first section.
  #    * plaintext (true, false) Return extracts as plain text instead of limited HTML.
  #    * sectionformat (String) How to format sections in plaintext mode: One of "plain" (No formatting), "wiki" (Wikitext-style formatting (== like this ==)), "raw" (This module's internal representation (section titles prefixed with <ASCII 1><ASCII 2><section level><ASCII 2><ASCII 1>)).
  #    * continue (Integer) When more results are available, use this to continue.
  #  * `:fileusage` (Find all pages that use the given files.):
  #    * prop (Array<String>) Which properties to get: Allowed values: "pageid" (Page ID of each page), "title" (Title of each page), "redirect" (Flag if the page is a redirect).
  #    * namespace (Array<String>) Only include pages in these namespaces. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * show (Array<String>) Show only items that meet these criteria: Allowed values: "redirect" (Only show redirects), "!redirect" (Only show non-redirects).
  #    * limit (Integer, "max") How many to return.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:flagged` (Get information about the flagging status of the given pages. If a page is flagged, the following parameters are returned: If the page has protection configuration, the following parameters are returned:):
  #  * `:globalusage` (Returns global image usage for a certain image.):
  #    * prop (Array<String>) Which properties to return: Allowed values: "url" (Adds url), "pageid" (Adds page ID), "namespace" (Adds namespace ID).
  #    * limit (Integer, "max") How many links to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * filterlocal (true, false) Filter local usage of the file.
  #  * `:imageinfo` (Returns file information and upload history.):
  #    * prop (Array<String>) Which file information to get: Allowed values: "timestamp" (Adds timestamp for the uploaded version), "user" (Adds the user who uploaded each file version), "userid" (Add the ID of the user that uploaded each file version), "comment" (Comment on the version), "parsedcomment" (Parse the comment on the version), "canonicaltitle" (Adds the canonical title of the file), "url" (Gives URL to the file and the description page), "size" (Adds the size of the file in bytes and the height, width and page count (if applicable)), "dimensions" (Alias for size), "sha1" (Adds SHA-1 hash for the file), "mime" (Adds MIME type of the file), "thumbmime" (Adds MIME type of the image thumbnail (requires url and param iiurlwidth)), "mediatype" (Adds the media type of the file), "metadata" (Lists Exif metadata for the version of the file), "commonmetadata" (Lists file format generic metadata for the version of the file), "extmetadata" (Lists formatted metadata combined from multiple sources. Results are HTML formatted), "archivename" (Adds the filename of the archive version for non-latest versions), "bitdepth" (Adds the bit depth of the version), "uploadwarning" (Used by the Special:Upload page to get information about an existing file. Not intended for use outside MediaWiki core), "badfile" (Adds whether the file is on the MediaWiki:Bad image list).
  #    * limit (Integer, "max") How many file revisions to return per file.
  #    * start (Time) Timestamp to start listing from.
  #    * end (Time) Timestamp to stop listing at.
  #    * urlwidth (Integer) If iiprop=url is set, a URL to an image scaled to this width will be returned. For performance reasons if this option is used, no more than 50 scaled images will be returned.
  #    * urlheight (Integer) Similar to iiurlwidth.
  #    * metadataversion (String) Version of metadata to use. If latest is specified, use latest version. Defaults to 1 for backwards compatibility.
  #    * extmetadatalanguage (String) What language to fetch extmetadata in. This affects both which translation to fetch, if multiple are available, as well as how things like numbers and various values are formatted.
  #    * extmetadatamultilang (true, false) If translations for extmetadata property are available, fetch all of them.
  #    * extmetadatafilter (Array<String>) If specified and non-empty, only these keys will be returned for iiprop=extmetadata.
  #    * urlparam (String) A handler specific parameter string. For example, PDFs might use page15-100px. iiurlwidth must be used and be consistent with iiurlparam.
  #    * badfilecontexttitle (String) If badfilecontexttitleprop=badfile is set, this is the page title used when evaluating the MediaWiki:Bad image list
  #    * continue (String) When more results are available, use this to continue.
  #    * localonly (true, false) Look only for files in the local repository.
  #  * `:images` (Returns all files contained on the given pages.):
  #    * limit (Integer, "max") How many files to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * images (Array<String>) Only list these files. Useful for checking whether a certain page has a certain file.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:info` (Get basic page information.):
  #    * prop (Array<String>) Which additional properties to get: Allowed values: "protection" (List the protection level of each page), "talkid" (The page ID of the talk page for each non-talk page), "watched" (List the watched status of each page), "watchers" (The number of watchers, if allowed), "visitingwatchers" (The number of watchers of each page who have visited recent edits to that page, if allowed), "notificationtimestamp" (The watchlist notification timestamp of each page), "subjectid" (The page ID of the parent page for each talk page), "url" (Gives a full URL, an edit URL, and the canonical URL for each page), "readable" (Whether the user can read this page), "preload" (Gives the text returned by EditFormPreloadText), "displaytitle" (Gives the manner in which the page title is actually displayed).
  #    * testactions (Array<String>) Test whether the current user can perform certain actions on the page.
  #    * token (Array<String>) Use action=query&meta=tokens instead. Allowed values: "edit", "delete", "protect", "move", "block", "unblock", "email", "import", "watch".
  #    * continue (String) When more results are available, use this to continue.
  #  * `:iwlinks` (Returns all interwiki links from the given pages.):
  #    * prop (Array<String>) Which additional properties to get for each interlanguage link: Allowed values: "url" (Adds the full URL).
  #    * prefix (String) Only return interwiki links with this prefix.
  #    * title (String) Interwiki link to search for. Must be used with iwprefix.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #    * limit (Integer, "max") How many interwiki links to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * url (true, false) Whether to get the full URL (cannot be used with iwprop).
  #  * `:langlinks` (Returns all interlanguage links from the given pages.):
  #    * prop (Array<String>) Which additional properties to get for each interlanguage link: Allowed values: "url" (Adds the full URL), "langname" (Adds the localised language name (best effort). Use llinlanguagecode to control the language), "autonym" (Adds the native language name).
  #    * lang (String) Only return language links with this language code.
  #    * title (String) Link to search for. Must be used with lllang.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #    * inlanguagecode (String) Language code for localised language names.
  #    * limit (Integer, "max") How many langlinks to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * url (true, false) Whether to get the full URL (cannot be used with llprop).
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
  #  * `:mapdata` (Request all map data from the page Metallica):
  #    * groups (String) Pipe-separated groups to return data for
  #    * limit (Integer, "max") Data for how many pages to return
  #    * continue (Integer) When more results are available, use this to continue.
  #  * `:pageassessments` (Return associated projects and assessments for the given pages.):
  #    * continue (String) When more results are available, use this to continue.
  #    * limit (Integer, "max") Limit for total number of projects returned (total for all pages).
  #    * subprojects (true, false) Also return assessments by subprojects.
  #  * `:pageimages` (Returns information about images on the page, such as thumbnail and presence of photos.):
  #    * prop (Array<String>) Which information to return: Allowed values: "thumbnail" (URL and dimensions of thumbnail image associated with page, if any), "original" (URL and original dimensions of image associated with page, if any), "name" (Image title).
  #    * thumbsize (Integer) Maximum thumbnail dimension.
  #    * limit (Integer, "max") Properties of how many pages to return.
  #    * license (String) Limit page images to a certain license type One of "free", "any".
  #    * continue (Integer) When more results are available, use this to continue.
  #  * `:pageprops` (Get various page properties defined in the page content.):
  #    * continue (String) When more results are available, use this to continue.
  #    * prop (Array<String>) Only list these page properties (action=query&list=pagepropnames returns page property names in use). Useful for checking whether pages use a certain page property.
  #  * `:pageterms` (Get terms associated with a page via an associated data item. On a wikibase entity page, the entity terms are used directly. Caveat: On a repo wiki, pageterms only works directly on entity pages, not on pages connected to an item. This may change in the future.):
  #    * continue (Integer) When more results are available, use this to continue.
  #    * terms (Array<String>) The types of terms to get, e.g. 'description'. If not specified, all types are returned. Allowed values: "alias", "description", "label".
  #  * `:pageviews` (Shows per-page pageview data (the number of daily pageviews for each of the last pvipdays days). The result format is page title (with underscores) => date (Ymd) => count.):
  #    * metric (String) The metric to use for counting views. Depending on what backend is used, not all metrics might be supported. You can use the siteinfo API (action=query&meta=siteinfo) to check, under pageviewservice-supported-metrics / <module name> One of "pageviews" (Plain pageviews).
  #    * days (Integer) The number of days to show.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:redirects` (Returns all redirects to the given pages.):
  #    * prop (Array<String>) Which properties to get: Allowed values: "pageid" (Page ID of each redirect), "title" (Title of each redirect), "fragment" (Fragment of each redirect, if any).
  #    * namespace (Array<String>) Only include pages in these namespaces. Note: Due to miser mode, using this may result in fewer than rdlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * show (Array<String>) Show only items that meet these criteria: Allowed values: "fragment" (Only show redirects with a fragment), "!fragment" (Only show redirects without a fragment).
  #    * limit (Integer, "max") How many redirects to return.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:references` (Return a data representation of references associated with the given pages.):
  #    * continue (String) When more results are available, use this to continue.
  #  * `:revisions` (Get revision information. May be used in several ways:):
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
  #  * `:stashimageinfo` (Returns file information for stashed files.):
  #    * filekey (Array<String>) Key that identifies a previous upload that was stashed temporarily.
  #    * sessionkey (Array<String>) Alias for siifilekey, for backward compatibility.
  #    * prop (Array<String>) Which file information to get: Allowed values: "timestamp" (Adds timestamp for the uploaded version), "canonicaltitle" (Adds the canonical title of the file), "url" (Gives URL to the file and the description page), "size" (Adds the size of the file in bytes and the height, width and page count (if applicable)), "dimensions" (Alias for size), "sha1" (Adds SHA-1 hash for the file), "mime" (Adds MIME type of the file), "thumbmime" (Adds MIME type of the image thumbnail (requires url and param siiurlwidth)), "metadata" (Lists Exif metadata for the version of the file), "commonmetadata" (Lists file format generic metadata for the version of the file), "extmetadata" (Lists formatted metadata combined from multiple sources. Results are HTML formatted), "bitdepth" (Adds the bit depth of the version), "badfile" (Adds whether the file is on the MediaWiki:Bad image list).
  #    * urlwidth (Integer) If siiprop=url is set, a URL to an image scaled to this width will be returned. For performance reasons if this option is used, no more than 50 scaled images will be returned.
  #    * urlheight (Integer) Similar to siiurlwidth.
  #    * urlparam (String) A handler specific parameter string. For example, PDFs might use page15-100px. siiurlwidth must be used and be consistent with siiurlparam.
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
  #  * `:transcodestatus` (Get transcode status for a given file page.):
  #  * `:videoinfo` (Extends imageinfo to include video source (derivatives) information):
  #    * prop (Array<String>) Which file information to get: Allowed values: "timestamp" (Adds timestamp for the uploaded version), "user" (Adds the user who uploaded each file version), "userid" (Add the ID of the user that uploaded each file version), "comment" (Comment on the version), "parsedcomment" (Parse the comment on the version), "canonicaltitle" (Adds the canonical title of the file), "url" (Gives URL to the file and the description page), "size" (Adds the size of the file in bytes and the height, width and page count (if applicable)), "dimensions" (Alias for size), "sha1" (Adds SHA-1 hash for the file), "mime" (Adds MIME type of the file), "thumbmime" (Adds MIME type of the image thumbnail (requires url and param viurlwidth)), "mediatype" (Adds the media type of the file), "metadata" (Lists Exif metadata for the version of the file), "commonmetadata" (Lists file format generic metadata for the version of the file), "extmetadata" (Lists formatted metadata combined from multiple sources. Results are HTML formatted), "archivename" (Adds the filename of the archive version for non-latest versions), "bitdepth" (Adds the bit depth of the version), "uploadwarning" (Used by the Special:Upload page to get information about an existing file. Not intended for use outside MediaWiki core), "badfile" (Adds whether the file is on the MediaWiki:Bad image list), "derivatives" (Adds an array of the different format and quality versions of an audio or video file that are available), "timedtext" (Adds an array of the subtitles, captions and descriptions of an audio or video file that are available).
  #    * limit (Integer, "max") How many file revisions to return per file.
  #    * start (Time) Timestamp to start listing from.
  #    * end (Time) Timestamp to stop listing at.
  #    * urlwidth (Integer) If viprop=url is set, a URL to an image scaled to this width will be returned. For performance reasons if this option is used, no more than 50 scaled images will be returned.
  #    * urlheight (Integer) Similar to viurlwidth.
  #    * metadataversion (String) Version of metadata to use. If latest is specified, use latest version. Defaults to 1 for backwards compatibility.
  #    * extmetadatalanguage (String) What language to fetch extmetadata in. This affects both which translation to fetch, if multiple are available, as well as how things like numbers and various values are formatted.
  #    * extmetadatamultilang (true, false) If translations for extmetadata property are available, fetch all of them.
  #    * extmetadatafilter (Array<String>) If specified and non-empty, only these keys will be returned for viprop=extmetadata.
  #    * urlparam (String) A handler specific parameter string. For example, PDFs might use page15-100px. viurlwidth must be used and be consistent with viurlparam.
  #    * badfilecontexttitle (String) If badfilecontexttitleprop=badfile is set, this is the page title used when evaluating the MediaWiki:Bad image list
  #    * continue (String) When more results are available, use this to continue.
  #    * localonly (String) Look only for files in the local repository.
  #  * `:wbentityusage` (Returns all entity IDs used in the given pages.):
  #    * prop (Array<String>) Properties to add to the result. Allowed values: "url" (If enabled url of entity will be added).
  #    * aspect (Array<String>) Only return entity IDs that used this aspect. Allowed values: "S", "L", "T", "X", "O".
  #    * entities (Array<String>) Only return page that used these entities.
  #    * limit (Integer, "max") How many entity usages to return.
  #    * continue (String) When more results are available, use this to continue.
  #
  # @param values [Array<Symbol, Hash>] Any number of options (either symbol, or `{symbol: settings}` Hash).
  # @return [self]
  def prop(*values)
    merge(prop: modules_to_hash(values, [:categories, :categoryinfo, :contributors, :coordinates, :deletedrevisions, :duplicatefiles, :extlinks, :extracts, :fileusage, :flagged, :globalusage, :imageinfo, :images, :info, :iwlinks, :langlinks, :links, :linkshere, :mapdata, :pageassessments, :pageimages, :pageprops, :pageterms, :pageviews, :redirects, :references, :revisions, :stashimageinfo, :templates, :transcludedin, :transcodestatus, :videoinfo, :wbentityusage]))
  end

  # Which lists to get.
  #
  # Supported options and their settings:
  #
  #  * `:abusefilters` (Show details of the abuse filters.):
  #    * startid (Integer) The filter ID to start enumerating from.
  #    * endid (Integer) The filter ID to stop enumerating at.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: abfstart has to be before abfend), "older" (List newest first (default). Note: abfstart has to be later than abfend).
  #    * show (Array<String>) Show only filters which meet these criteria. Allowed values: "enabled", "!enabled", "deleted", "!deleted", "private", "!private".
  #    * limit (Integer, "max") The maximum number of filters to list.
  #    * prop (Array<String>) Which properties to get. Allowed values: "id", "description", "pattern", "actions", "hits", "comments", "lasteditor", "lastedittime", "status", "private".
  #  * `:abuselog` (Show events that were caught by one of the abuse filters.):
  #    * start (Time) The timestamp to start enumerating from.
  #    * end (Time) The timestamp to stop enumerating at.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: aflstart has to be before aflend), "older" (List newest first (default). Note: aflstart has to be later than aflend).
  #    * user (String) Show only entries done by a given user or IP address.
  #    * title (String) Show only entries occurring on a given page.
  #    * filter (Array<String>) Show only entries that were caught by a given filter ID.
  #    * limit (Integer, "max") The maximum amount of entries to list.
  #    * prop (Array<String>) Which properties to get. Allowed values: "ids", "filter", "user", "ip", "title", "action", "details", "result", "timestamp", "hidden", "revid".
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
  #    * user (String) Only list revisions by this user. Note: Due to miser mode, using adruser and adrnamespace together may result in fewer than adrlimit results returned before continuing; in extreme cases, zero results may be returned.
  #    * namespace (Array<String>) Only list pages in this namespace. Note: Due to miser mode, using adruser and adrnamespace together may result in fewer than adrlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
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
  #    * unique (true, false) Only show distinct file titles. Cannot be used with afprop=ids. When used as a generator, yields target pages instead of source pages.
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
  #    * unique (true, false) Only show distinct linked titles. Cannot be used with alprop=ids. When used as a generator, yields target pages instead of source pages.
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
  #    * filterredir (String) Which pages to list. Note: Due to miser mode, using this may result in fewer than aplimit results returned before continuing; in extreme cases, zero results may be returned. One of "all", "redirects", "nonredirects".
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
  #    * unique (true, false) Only show distinct target pages. Cannot be used with arprop=ids|fragment|interwiki. When used as a generator, yields target pages instead of source pages.
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
  #    * namespace (Array<String>) Only list pages in this namespace. Note: Due to miser mode, using this may result in fewer than arvlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
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
  #    * unique (true, false) Only show distinct transcluded titles. Cannot be used with atprop=ids. When used as a generator, yields target pages instead of source pages.
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "ids" (Adds the page ID of the transcluding page (cannot be used with atunique)), "title" (Adds the title of the transclusion).
  #    * namespace (String) The namespace to enumerate. One of "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") How many total items to return.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:allusers` (Enumerate all registered users.):
  #    * from (String) The user name to start enumerating from.
  #    * to (String) The user name to stop enumerating at.
  #    * prefix (String) Search for all users that begin with this value.
  #    * dir (String) Direction to sort in. One of "ascending", "descending".
  #    * group (Array<String>) Only include users in the given groups. Allowed values: "bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor".
  #    * excludegroup (Array<String>) Exclude users in the given groups. Allowed values: "bot", "sysop", "bureaucrat", "reviewer", "steward", "accountcreator", "import", "transwiki", "ipblock-exempt", "oversight", "founder", "rollbacker", "autoreviewer", "researcher", "filemover", "checkuser", "templateeditor", "massmessage-sender", "extendedconfirmed", "extendedmover", "patroller", "abusefilter", "confirmed", "epcoordinator", "eponline", "epcampus", "epinstructor".
  #    * rights (Array<String>) Only include users with the given rights. Does not include rights granted by implicit or auto-promoted groups like *, user, or autoconfirmed. Allowed values: "apihighlimits", "applychangetags", "autoconfirmed", "autocreateaccount", "autopatrol", "bigdelete", "block", "blockemail", "bot", "browsearchive", "changetags", "createaccount", "createpage", "createtalk", "delete", "deletechangetags", "deletedhistory", "deletedtext", "deletelogentry", "deleterevision", "edit", "editcontentmodel", "editinterface", "editprotected", "editmyoptions", "editmyprivateinfo", "editmyusercss", "editmyuserjs", "editmywatchlist", "editsemiprotected", "editusercssjs", "editusercss", "edituserjs", "hideuser", "import", "importupload", "ipblock-exempt", "managechangetags", "markbotedits", "mergehistory", "minoredit", "move", "movefile", "move-categorypages", "move-rootuserpages", "move-subpages", "nominornewtalk", "noratelimit", "override-export-depth", "pagelang", "patrol", "patrolmarks", "protect", "purge", "read", "reupload", "reupload-own", "reupload-shared", "rollback", "sendemail", "siteadmin", "suppressionlog", "suppressredirect", "suppressrevision", "unblockself", "undelete", "unwatchedpages", "upload", "upload_by_url", "userrights", "userrights-interwiki", "viewmyprivateinfo", "viewmywatchlist", "viewsuppressed", "writeapi", "spamblacklistlog", "tboverride", "tboverride-account", "titleblacklistlog", "gadgets-edit", "gadgets-definition-edit", "globalblock", "globalblock-whitelist", "globalblock-exempt", "securepoll-create-poll", "renameuser", "nuke", "torunblocked", "skipcaptcha", "override-antispoof", "centralauth-merge", "centralauth-unmerge", "centralauth-lock", "centralauth-oversight", "globalgrouppermissions", "globalgroupmembership", "centralauth-rename", "centralauth-usermerge", "abusefilter-modify", "abusefilter-log-detail", "abusefilter-view", "abusefilter-log", "abusefilter-private", "abusefilter-modify-restricted", "abusefilter-revert", "abusefilter-view-private", "abusefilter-log-private", "abusefilter-hidden-log", "abusefilter-hide-log", "abusefilter-modify-global", "massmessage", "vipsscaler-test", "ep-org", "ep-course", "ep-token", "ep-enroll", "ep-remstudent", "ep-online", "ep-campus", "ep-instructor", "ep-beonline", "ep-becampus", "ep-beinstructor", "ep-bereviewer", "ep-remreviewer", "ep-bulkdelorgs", "ep-bulkdelcourses", "ep-remarticle", "ep-addstudent", "usermerge", "mwoauthproposeconsumer", "mwoauthupdateownconsumer", "mwoauthmanageconsumer", "mwoauthsuppress", "mwoauthviewsuppressed", "mwoauthviewprivate", "mwoauthmanagemygrants", "oathauth-enable", "oathauth-api-all", "checkuser", "checkuser-log", "autoreviewrestore", "stablesettings", "review", "unreviewedpages", "movestable", "validate", "templateeditor", "editeditorprotected", "editextendedsemiprotected", "extendedconfirmed", "flow-create-board", "flow-edit-post", "flow-suppress", "flow-hide", "flow-delete", "viewdeletedfile", "autoreview", "transcode-reset", "transcode-status", "collectionsaveasuserpage", "collectionsaveascommunitypage".
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "blockinfo" (Adds the information about a current block on the user), "groups" (Lists groups that the user is in. This uses more server resources and may return fewer results than the limit), "implicitgroups" (Lists all the groups the user is automatically in), "rights" (Lists rights that the user has), "editcount" (Adds the edit count of the user), "registration" (Adds the timestamp of when the user registered if available (may be blank)), "centralids" (Adds the central IDs and attachment status for the user).
  #    * limit (Integer, "max") How many total user names to return.
  #    * witheditsonly (true, false) Only list users who have made edits.
  #    * activeusers (true, false) Only list users active in the last 30 days.
  #    * attachedwiki (String) With auprop=centralids, also indicate whether the user is attached with the wiki identified by this ID.
  #  * `:backlinks` (Find all pages that link to the given page.):
  #    * title (String) Title to search. Cannot be used together with blpageid.
  #    * pageid (Integer) Page ID to search. Cannot be used together with bltitle.
  #    * continue (String) When more results are available, use this to continue.
  #    * namespace (Array<String>) The namespace to enumerate. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #    * filterredir (String) How to filter for redirects. If set to nonredirects when blredirect is enabled, this is only applied to the second level. One of "all", "redirects", "nonredirects".
  #    * limit (Integer, "max") How many total pages to return. If blredirect is enabled, the limit applies to each level separately (which means up to 2 * bllimit results may be returned).
  #    * redirect (true, false) If linking page is a redirect, find all pages that link to that redirect as well. Maximum limit is halved.
  #  * `:betafeatures` (List all BetaFeatures):
  #    * counts (String) Whether to fetch how many users have enabled a certain preference.
  #  * `:blocks` (List all blocked users and IP addresses.):
  #    * start (Time) The timestamp to start enumerating from.
  #    * end (Time) The timestamp to stop enumerating at.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: bkstart has to be before bkend), "older" (List newest first (default). Note: bkstart has to be later than bkend).
  #    * ids (Array<Integer>) List of block IDs to list (optional).
  #    * users (Array<String>) List of users to search for (optional).
  #    * ip (String) Get all blocks applying to this IP address or CIDR range, including range blocks. Cannot be used together with bkusers. CIDR ranges broader than IPv4/16 or IPv6/19 are not accepted.
  #    * limit (Integer, "max") The maximum number of blocks to list.
  #    * prop (Array<String>) Which properties to get: Allowed values: "id" (Adds the ID of the block), "user" (Adds the username of the blocked user), "userid" (Adds the user ID of the blocked user), "by" (Adds the username of the blocking user), "byid" (Adds the user ID of the blocking user), "timestamp" (Adds the timestamp of when the block was given), "expiry" (Adds the timestamp of when the block expires), "reason" (Adds the reason given for the block), "range" (Adds the range of IP addresses affected by the block), "flags" (Tags the ban with (autoblock, anononly, etc.)).
  #    * show (Array<String>) Show only items that meet these criteria. For example, to see only indefinite blocks on IP addresses, set bkshow=ip|!temp. Allowed values: "account", "!account", "temp", "!temp", "ip", "!ip", "range", "!range".
  #    * continue (String) When more results are available, use this to continue.
  #  * `:categorymembers` (List all pages in a given category.):
  #    * title (String) Which category to enumerate (required). Must include the Category: prefix. Cannot be used together with cmpageid.
  #    * pageid (Integer) Page ID of the category to enumerate. Cannot be used together with cmtitle.
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "ids" (Adds the page ID), "title" (Adds the title and namespace ID of the page), "sortkey" (Adds the sortkey used for sorting in the category (hexadecimal string)), "sortkeyprefix" (Adds the sortkey prefix used for sorting in the category (human-readable part of the sortkey)), "type" (Adds the type that the page has been categorised as (page, subcat or file)), "timestamp" (Adds the timestamp of when the page was included).
  #    * namespace (Array<String>) Only include pages in these namespaces. Note that cmtype=subcat or cmtype=file may be used instead of cmnamespace=14 or 6. Note: Due to miser mode, using this may result in fewer than cmlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
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
  #  * `:centralnoticelogs` (Get a log of campaign configuration changes.):
  #    * campaign (String) Campaign name (optional). Separate multiple values with a "|" (vertical bar).
  #    * user (String) Username (optional).
  #    * limit (Integer, "max") Maximum rows to return (optional).
  #    * offset (Integer) Offset into result set (optional).
  #    * start (Time) Start time of range (optional).
  #    * end (Time) End time of range (optional).
  #  * `:checkuser` (Check which IP addresses are used by a given username or which usernames are used by a given IP address.):
  #    * request (String) Type of CheckUser request: One of "userips" (Get IP address of target user), "edits" (Get changes from target IP address or range), "ipusers" (Get users from target IP address or range).
  #    * target (String) Username, IP address, or CIDR range to check.
  #    * reason (String) Reason to check.
  #    * limit (Integer, "max") Limit of rows.
  #    * timecond (String) Time limit of user data (like "-2 weeks" or "2 weeks ago").
  #    * xff (String) Use XFF data instead of IP address.
  #    * token (String) A "csrf" token retrieved from action=query&meta=tokens
  #  * `:checkuserlog` (Get entries from the CheckUser log.):
  #    * user (String) Username of the CheckUser.
  #    * target (String) Checked user, IP address, or CIDR range.
  #    * limit (Integer, "max") Limit of rows.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: culstart has to be before culend), "older" (List newest first (default). Note: culstart has to be later than culend).
  #    * from (Time) The timestamp to start enumerating from.
  #    * to (Time) The timestamp to end enumerating.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:deletedrevs` (List deleted revisions. Operates in three modes: Certain parameters only apply to some modes and are ignored in others.):
  #    * start (Time) The timestamp to start enumerating from.
  #    * end (Time) The timestamp to stop enumerating at.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: drstart has to be before drend), "older" (List newest first (default). Note: drstart has to be later than drend).
  #    * from (String) Start listing at this title.
  #    * to (String) Stop listing at this title.
  #    * prefix (String) Search for all page titles that begin with this value.
  #    * unique (true, false) List only one revision for each page.
  #    * namespace (String) Only list pages in this namespace. One of "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * tag (String) Only list revisions tagged with this tag.
  #    * user (String) Only list revisions by this user.
  #    * excludeuser (String) Don't list revisions by this user.
  #    * prop (Array<String>) Which properties to get: Allowed values: "revid" (Adds the revision ID of the deleted revision), "parentid" (Adds the revision ID of the previous revision to the page), "user" (Adds the user who made the revision), "userid" (Adds the ID of the user who made the revision), "comment" (Adds the comment of the revision), "parsedcomment" (Adds the parsed comment of the revision), "minor" (Tags if the revision is minor), "len" (Adds the length (bytes) of the revision), "sha1" (Adds the SHA-1 (base 16) of the revision), "content" (Adds the content of the revision), "token" (Deprecated. Gives the edit token), "tags" (Tags for the revision).
  #    * limit (Integer, "max") The maximum amount of revisions to list.
  #    * continue (String) When more results are available, use this to continue.
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
  #    * namespace (Array<String>) The page namespaces to enumerate. Note: Due to miser mode, using this may result in fewer than eulimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") How many pages to return.
  #    * expandurl (true, false) Expand protocol-relative URLs with the canonical protocol.
  #  * `:filearchive` (Enumerate all deleted files sequentially.):
  #    * from (String) The image title to start enumerating from.
  #    * to (String) The image title to stop enumerating at.
  #    * prefix (String) Search for all image titles that begin with this value.
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #    * sha1 (String) SHA1 hash of image. Overrides fasha1base36.
  #    * sha1base36 (String) SHA1 hash of image in base 36 (used in MediaWiki).
  #    * prop (Array<String>) Which image information to get: Allowed values: "sha1" (Adds SHA-1 hash for the image), "timestamp" (Adds timestamp for the uploaded version), "user" (Adds user who uploaded the image version), "size" (Adds the size of the image in bytes and the height, width and page count (if applicable)), "dimensions" (Alias for size), "description" (Adds description of the image version), "parseddescription" (Parse the description of the version), "mime" (Adds MIME of the image), "mediatype" (Adds the media type of the image), "metadata" (Lists Exif metadata for the version of the image), "bitdepth" (Adds the bit depth of the version), "archivename" (Adds the filename of the archive version for non-latest versions).
  #    * limit (Integer, "max") How many images to return in total.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:gadgetcategories` (Returns a list of gadget categories.):
  #    * prop (Array<String>) What gadget category information to get: Allowed values: "name" (Internal category name), "title" (Category title), "members" (Number of gadgets in category).
  #    * names (Array<String>) Names of categories to retrieve.
  #  * `:gadgets` (Returns a list of gadgets used on this wiki.):
  #    * prop (Array<String>) What gadget information to get: Allowed values: "id" (Internal gadget ID), "metadata" (The gadget metadata), "desc" (Gadget description transformed into HTML (can be slow, use only if really needed)).
  #    * categories (Array<String>) Gadgets from what categories to retrieve.
  #    * ids (Array<String>) IDs of gadgets to retrieve.
  #    * allowedonly (true, false) List only gadgets allowed to current user.
  #    * enabledonly (true, false) List only gadgets enabled by current user.
  #  * `:geosearch` (Returns pages having coordinates that are located in a certain area.):
  #    * coord (String) Coordinate around which to search. Format: Latitude and longitude separated by pipe ("|").
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
  #  * `:globalallusers` (Enumerate all global users.):
  #    * from (String) The user name to start enumerating from.
  #    * to (String) The user name to stop enumerating at.
  #    * prefix (String) Search for all users that begin with this value.
  #    * dir (String) Direction to sort in. One of "ascending", "descending".
  #    * group (Array<String>) Limit users to given global groups. Allowed values: "OTRS-member", "abusefilter-helper", "apihighlimits-requestor", "captcha-exempt", "delete-global", "founder", "global-bot", "global-flow-create", "global-interface-editor", "global-ipblock-exempt", "global-rollbacker", "global-sysop", "new-wikis-importer", "oathauth-tester", "ombudsman", "recursive-export", "staff", "steward", "sysadmin", "wmf-ops-monitoring", "wmf-researcher".
  #    * excludegroup (Array<String>) Exclude users in given global groups. Allowed values: "OTRS-member", "abusefilter-helper", "apihighlimits-requestor", "captcha-exempt", "delete-global", "founder", "global-bot", "global-flow-create", "global-interface-editor", "global-ipblock-exempt", "global-rollbacker", "global-sysop", "new-wikis-importer", "oathauth-tester", "ombudsman", "recursive-export", "staff", "steward", "sysadmin", "wmf-ops-monitoring", "wmf-researcher".
  #    * prop (Array<String>) What pieces of information to include: Allowed values: "lockinfo" (Whether the user account is locked), "groups" (Lists global groups that the user is in. This uses more server resources and may return fewer results than the limit), "existslocally" (Adds the information if the user exists locally).
  #    * limit (Integer, "max") How many total user names to return.
  #  * `:globalblocks` (List all globally blocked IP addresses.):
  #    * start (Time) The timestamp to start enumerating from.
  #    * end (Time) The timestamp to stop enumerating at.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: bgstart has to be before bgend), "older" (List newest first (default). Note: bgstart has to be later than bgend).
  #    * ids (Array<Integer>) Pipe-separated list of block IDs to list.
  #    * addresses (Array<String>) Pipe-separated list of IP addresses to search for.
  #    * ip (String) Get all blocks applying to this IP address or CIDR range, including range blocks. Cannot be used together with bgaddresses. CIDR ranges broader than /16 are not accepted.
  #    * limit (Integer, "max") The maximum amount of blocks to list.
  #    * prop (Array<String>) Which properties to get. Allowed values: "id", "address", "by", "timestamp", "expiry", "reason", "range".
  #  * `:globalgroups` (Enumerate all global groups.):
  #    * prop (Array<String>) What pieces of information to include. Allowed values: "rights".
  #  * `:imageusage` (Find all pages that use the given image title.):
  #    * title (String) Title to search. Cannot be used together with iupageid.
  #    * pageid (Integer) Page ID to search. Cannot be used together with iutitle.
  #    * continue (String) When more results are available, use this to continue.
  #    * namespace (Array<String>) The namespace to enumerate. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #    * filterredir (String) How to filter for redirects. If set to nonredirects when iuredirect is enabled, this is only applied to the second level. One of "all", "redirects", "nonredirects".
  #    * limit (Integer, "max") How many total pages to return. If iuredirect is enabled, the limit applies to each level separately (which means up to 2 * iulimit results may be returned).
  #    * redirect (true, false) If linking page is a redirect, find all pages that link to that redirect as well. Maximum limit is halved.
  #  * `:iwbacklinks` (Find all pages that link to the given interwiki link. Can be used to find all links with a prefix, or all links to a title (with a given prefix). Using neither parameter is effectively "all interwiki links".):
  #    * prefix (String) Prefix for the interwiki.
  #    * title (String) Interwiki link to search for. Must be used with iwblblprefix.
  #    * continue (String) When more results are available, use this to continue.
  #    * limit (Integer, "max") How many total pages to return.
  #    * prop (Array<String>) Which properties to get: Allowed values: "iwprefix" (Adds the prefix of the interwiki), "iwtitle" (Adds the title of the interwiki).
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:langbacklinks` (Find all pages that link to the given language link. Can be used to find all links with a language code, or all links to a title (with a given language). Using neither parameter is effectively "all language links". Note that this may not consider language links added by extensions.):
  #    * lang (String) Language for the language link.
  #    * title (String) Language link to search for. Must be used with lbllang.
  #    * continue (String) When more results are available, use this to continue.
  #    * limit (Integer, "max") How many total pages to return.
  #    * prop (Array<String>) Which properties to get: Allowed values: "lllang" (Adds the language code of the language link), "lltitle" (Adds the title of the language link).
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:logevents` (Get events from logs.):
  #    * prop (Array<String>) Which properties to get: Allowed values: "ids" (Adds the ID of the log event), "title" (Adds the title of the page for the log event), "type" (Adds the type of log event), "user" (Adds the user responsible for the log event), "userid" (Adds the user ID who was responsible for the log event), "timestamp" (Adds the timestamp for the log event), "comment" (Adds the comment of the log event), "parsedcomment" (Adds the parsed comment of the log event), "details" (Lists additional details about the log event), "tags" (Lists tags for the log event).
  #    * type (String) Filter log entries to only this type. One of "spamblacklist", "titleblacklist", "gblblock", "renameuser", "globalauth", "gblrights", "gblrename", "abusefilter", "massmessage", "pagetriage-curation", "pagetriage-deletion", "institution", "course", "student", "online", "campus", "instructor", "thanks", "usermerge", "block", "protect", "rights", "delete", "upload", "move", "import", "patrol", "merge", "suppress", "tag", "managetags", "contentmodel", "review", "stable", "timedmediahandler", "newusers".
  #    * action (String) Filter log actions to only this action. Overrides letype. In the list of possible values, values with the asterisk wildcard such as action/* can have different strings after the slash (/). One of "gblblock/gblock", "gblblock/gblock2", "gblblock/gunblock", "gblblock/modify", "globalauth/delete", "globalauth/lock", "globalauth/unlock", "globalauth/hide", "globalauth/unhide", "globalauth/lockandhid", "globalauth/setstatus", "suppress/setstatus", "suppress/cadelete", "gblrights/usergroups", "gblrights/groupperms", "gblrights/groupprms2", "gblrights/groupprms3", "suppress/hide-afl", "suppress/unhide-afl", "usermerge/mergeuser", "usermerge/deleteuser", "rights/erevoke", "spamblacklist/*", "titleblacklist/*", "gblblock/whitelist", "gblblock/dwhitelist", "renameuser/renameuser", "gblrights/grouprename", "gblrename/rename", "gblrename/promote", "gblrename/merge", "gblrights/newset", "gblrights/setrename", "gblrights/setnewtype", "gblrights/setchange", "gblrights/deleteset", "abusefilter/modify", "abusefilter/hit", "massmessage/*", "massmessage/send", "massmessage/failure", "massmessage/skipoptout", "massmessage/skipnouser", "massmessage/skipbadns", "pagetriage-curation/reviewed", "pagetriage-curation/unreviewed", "pagetriage-curation/tag", "pagetriage-curation/delete", "pagetriage-deletion/delete", "institution/*", "course/*", "student/*", "student/add", "student/remove", "online/*", "online/add", "online/remove", "campus/*", "campus/add", "campus/remove", "instructor/*", "instructor/add", "instructor/remove", "eparticle/*", "thanks/*", "block/block", "block/reblock", "block/unblock", "contentmodel/change", "contentmodel/new", "delete/delete", "delete/delete_redir", "delete/event", "delete/restore", "delete/revision", "import/interwiki", "import/upload", "managetags/activate", "managetags/create", "managetags/deactivate", "managetags/delete", "merge/merge", "move/move", "move/move_redir", "patrol/patrol", "patrol/autopatrol", "protect/modify", "protect/move_prot", "protect/protect", "protect/unprotect", "rights/autopromote", "rights/rights", "suppress/block", "suppress/delete", "suppress/event", "suppress/reblock", "suppress/revision", "tag/update", "upload/overwrite", "upload/revert", "upload/upload", "review/approve", "review/approve2", "review/approve-i", "review/approve2-i", "review/approve-a", "review/approve2-a", "review/approve-ia", "review/approve2-ia", "review/unapprove", "review/unapprove2", "stable/config", "stable/modify", "stable/reset", "stable/move_stable", "timedmediahandler/resettranscode", "newusers/newusers", "newusers/create", "newusers/create2", "newusers/byemail", "newusers/autocreate".
  #    * start (Time) The timestamp to start enumerating from.
  #    * end (Time) The timestamp to end enumerating.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: lestart has to be before leend), "older" (List newest first (default). Note: lestart has to be later than leend).
  #    * user (String) Filter entries to those made by the given user.
  #    * title (String) Filter entries to those related to a page.
  #    * namespace (String) Filter entries to those in the given namespace. One of "-2", "-1", "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * prefix (String) Disabled due to miser mode.
  #    * tag (String) Only list event entries tagged with this tag.
  #    * limit (Integer, "max") How many total event entries to return.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:mmsites` (Serve autocomplete requests for the site field in MassMessage.):
  #    * term (String) The prefix to search for.
  #  * `:mostviewed` (Lists the most viewed pages (based on last day's pageview count).):
  #    * metric (String) The metric to use for counting views. Depending on what backend is used, not all metrics might be supported. You can use the siteinfo API (action=query&meta=siteinfo) to check, under pageviewservice-supported-metrics / <module name> One of "pageviews" (Plain pageviews).
  #    * limit (Integer, "max") The number of pages to return.
  #    * offset (Integer) When more results are available, use this to continue.
  #  * `:mystashedfiles` (Get a list of files in the current user's upload stash.):
  #    * prop (Array<String>) Which properties to fetch for the files. Allowed values: "size" (Fetch the file size and image dimensions), "type" (Fetch the file's MIME type and media type).
  #    * limit (Integer, "max") How many files to get.
  #    * continue (String) When more results are available, use this to continue.
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
  #  * `:pagepropnames` (List all page property names in use on the wiki.):
  #    * continue (String) When more results are available, use this to continue.
  #    * limit (Integer, "max") The maximum number of names to return.
  #  * `:pageswithprop` (List all pages using a given page property.):
  #    * propname (String) Page property for which to enumerate pages (action=query&list=pagepropnames returns page property names in use).
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "ids" (Adds the page ID), "title" (Adds the title and namespace ID of the page), "value" (Adds the value of the page property).
  #    * continue (String) When more results are available, use this to continue.
  #    * limit (Integer, "max") The maximum number of pages to return.
  #    * dir (String) In which direction to sort. One of "ascending", "descending".
  #  * `:prefixsearch` (Perform a prefix search for page titles. Despite the similarity in names, this module is not intended to be equivalent to Special:PrefixIndex; for that, see action=query&list=allpages with the apprefix parameter. The purpose of this module is similar to action=opensearch: to take user input and provide the best-matching titles. Depending on the search engine backend, this might include typo correction, redirect avoidance, or other heuristics.):
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
  #  * `:projects` (List all the projects.):
  #    * subprojects (true, false) Also include subprojects.
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
  #  * `:random` (Get a set of random pages.  Pages are listed in a fixed sequence, only the starting point is random. This means that if, for example, Main Page is the first random page in the list, List of fictional monkeys will always be second, List of people on stamps of Vanuatu third, etc.):
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
  #  * `:tags` (List change tags.):
  #    * continue (String) When more results are available, use this to continue.
  #    * limit (Integer, "max") The maximum number of tags to list.
  #    * prop (Array<String>) Which properties to get: Allowed values: "name" (Adds name of tag), "displayname" (Adds system message for the tag), "description" (Adds description of the tag), "hitcount" (Adds the number of revisions and log entries that have this tag), "defined" (Indicate whether the tag is defined), "source" (Gets the sources of the tag, which may include extension for extension-defined tags and manual for tags that may be applied manually by users), "active" (Whether the tag is still being applied).
  #  * `:usercontribs` (Get all edits by a user.):
  #    * limit (Integer, "max") The maximum number of contributions to return.
  #    * start (Time) The start timestamp to return from.
  #    * end (Time) The end timestamp to return to.
  #    * continue (String) When more results are available, use this to continue.
  #    * user (Array<String>) The users to retrieve contributions for. Cannot be used with ucuserids or ucuserprefix.
  #    * userids (Array<Integer>) The user IDs to retrieve contributions for. Cannot be used with ucuser or ucuserprefix.
  #    * userprefix (String) Retrieve contributions for all users whose names begin with this value. Cannot be used with ucuser or ucuserids.
  #    * dir (String) In which direction to enumerate: One of "newer" (List oldest first. Note: ucstart has to be before ucend), "older" (List newest first (default). Note: ucstart has to be later than ucend).
  #    * namespace (Array<String>) Only list contributions in these namespaces. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * prop (Array<String>) Include additional pieces of information: Allowed values: "ids" (Adds the page ID and revision ID), "title" (Adds the title and namespace ID of the page), "timestamp" (Adds the timestamp of the edit), "comment" (Adds the comment of the edit), "parsedcomment" (Adds the parsed comment of the edit), "size" (Adds the new size of the edit), "sizediff" (Adds the size delta of the edit against its parent), "flags" (Adds flags of the edit), "patrolled" (Tags patrolled edits), "tags" (Lists tags for the edit).
  #    * show (Array<String>) Show only items that meet these criteria, e.g. non minor edits only: ucshow=!minor.
  #      If ucshow=patrolled or ucshow=!patrolled is set, revisions older than $wgRCMaxAge (2592000 seconds) won't be shown. Allowed values: "minor", "!minor", "patrolled", "!patrolled", "top", "!top", "new", "!new".
  #    * tag (String) Only list revisions tagged with this tag.
  #    * toponly (true, false) Only list changes which are the latest revision.
  #  * `:users` (Get information about a list of users.):
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "blockinfo" (Tags if the user is blocked, by whom, and for what reason), "groups" (Lists all the groups each user belongs to), "groupmemberships" (Lists groups that each user has been explicitly assigned to, including the expiry date of each group membership), "implicitgroups" (Lists all the groups a user is automatically a member of), "rights" (Lists all the rights each user has), "editcount" (Adds the user's edit count), "registration" (Adds the user's registration timestamp), "emailable" (Tags if the user can and wants to receive email through Special:Emailuser), "gender" (Tags the gender of the user. Returns "male", "female", or "unknown"), "centralids" (Adds the central IDs and attachment status for the user), "cancreate" (Indicates whether an account for valid but unregistered usernames can be created).
  #    * attachedwiki (String) With usprop=centralids, indicate whether the user is attached with the wiki identified by this ID.
  #    * users (Array<String>) A list of users to obtain information for.
  #    * userids (Array<Integer>) A list of user IDs to obtain information for.
  #    * token (Array<String>) Use action=query&meta=tokens instead. Allowed values: "userrights".
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
  #  * `:wikisets` (Enumerate all wiki sets.):
  #    * from (String) The name of the wiki set to start from.
  #    * prop (Array<String>) What pieces of information to include. Allowed values: "type" (Opt-in based (includes only specified wikis) or opt-out based (includes all wikis except specified)), "wikisincluded" (The wikis that are included in this wiki set), "wikisnotincluded" (The wikis that are not included in this wiki set).
  #    * limit (Integer, "max") How many wiki sets to return.
  #    * orderbyname (true, false) Order results by name.
  #
  # @param values [Array<Symbol, Hash>] Any number of options (either symbol, or `{symbol: settings}` Hash).
  # @return [self]
  def list(*values)
    merge(list: modules_to_hash(values, [:abusefilters, :abuselog, :allcategories, :alldeletedrevisions, :allfileusages, :allimages, :alllinks, :allpages, :allredirects, :allrevisions, :alltransclusions, :allusers, :backlinks, :betafeatures, :blocks, :categorymembers, :centralnoticelogs, :checkuser, :checkuserlog, :deletedrevs, :embeddedin, :exturlusage, :filearchive, :gadgetcategories, :gadgets, :geosearch, :gettingstartedgetpages, :globalallusers, :globalblocks, :globalgroups, :imageusage, :iwbacklinks, :langbacklinks, :logevents, :mmsites, :mostviewed, :mystashedfiles, :oldreviewedpages, :pagepropnames, :pageswithprop, :prefixsearch, :projectpages, :projects, :protectedtitles, :querypage, :random, :recentchanges, :search, :tags, :usercontribs, :users, :watchlist, :watchlistraw, :wblistentityusage, :wikisets]))
  end
  # Which metadata to get.
  #
  # Supported options and their settings:
  #
  #  * `:allmessages` (Return messages from this site.):
  #    * messages (Array<String>) Which messages to output. * (default) means all messages.
  #    * prop (Array<String>) Which properties to get. Allowed values: "default".
  #    * enableparser (true, false) Set to enable parser, will preprocess the wikitext of message (substitute magic words, handle templates, etc.).
  #    * nocontent (true, false) If set, do not include the content of the messages in the output.
  #    * includelocal (true, false) Also include local messages, i.e. messages that don't exist in the software but do exist as in the MediaWiki namespace. This lists all MediaWiki-namespace pages, so it will also list those that aren't really messages such as Common.js.
  #    * args (Array<String>) Arguments to be substituted into message.
  #    * filter (String) Return only messages with names that contain this string.
  #    * customised (String) Return only messages in this customisation state. One of "all", "modified", "unmodified".
  #    * lang (String) Return messages in this language.
  #    * from (String) Return messages starting at this message.
  #    * to (String) Return messages ending at this message.
  #    * title (String) Page name to use as context when parsing message (for amenableparser option).
  #    * prefix (String) Return messages with this prefix.
  #  * `:authmanagerinfo` (Retrieve information about the current authentication status.):
  #    * securitysensitiveoperation (String) Test whether the user's current authentication status is sufficient for the specified security-sensitive operation.
  #    * requestsfor (String) Fetch information about the authentication requests needed for the specified authentication action. One of "login", "login-continue", "create", "create-continue", "link", "link-continue", "change", "remove", "unlink".
  #    * mergerequestfields (true, false) Merge field information for all authentication requests into one array.
  #    * messageformat (String) Format to use for returning messages. One of "html", "wikitext", "raw", "none".
  #  * `:babel` (Get information about what languages the user knows):
  #    * user (String) User to get information about
  #  * `:featureusage` (Get a summary of logged API feature usages for a user agent.):
  #    * start (Time) Start of date range to query.
  #    * end (Time) End of date range to query.
  #    * agent (String) User agent to query. If not specified, the agent in the request will be queried.
  #    * features (Array<String>) If specified, return details on only these features.
  #  * `:filerepoinfo` (Return meta information about image repositories configured on the wiki.):
  #    * prop (Array<String>) Which repository properties to get (there may be more available on some wikis): Allowed values: "apiurl" (URL to the repository API - helpful for getting image info from the host), "name" (The key of the repository - used in e.g. $wgForeignFileRepos and imageinfo return values), "displayname" (The human-readable name of the repository wiki), "rooturl" (Root URL for image paths), "local" (Whether that repository is the local one or not).
  #  * `:globaluserinfo` (Show information about a global user.):
  #    * user (String) User to get information about. Defaults to the current user.
  #    * prop (Array<String>) Which properties to get: Allowed values: "groups" (Get a list of global groups this user belongs to), "rights" (Get a list of global rights this user has), "merged" (Get a list of merged accounts), "unattached" (Get a list of unattached accounts), "editcount" (Get the user's global edit count).
  #  * `:notifications` (Get notifications waiting for the current user.):
  #    * wikis (Array<String>) List of wikis to fetch notifications from (defaults to only current wiki). Allowed values: "aawiki", "aawikibooks", "aawiktionary", "abwiki", "abwiktionary", "acewiki", "advisorywiki", "adywiki", "afwiki", "afwikibooks", "afwikiquote", "afwiktionary", "akwiki", "akwikibooks", "akwiktionary", "alswiki", "alswikibooks", "alswikiquote", "alswiktionary", "amwiki", "amwikiquote", "amwiktionary", "angwiki", "angwikibooks", "angwikiquote", "angwikisource", "angwiktionary", "anwiki", "anwiktionary", "arbcom_cswiki", "arbcom_dewiki", "arbcom_enwiki", "arbcom_fiwiki", "arbcom_nlwiki", "arcwiki", "arwiki", "arwikibooks", "arwikimedia", "arwikinews", "arwikiquote", "arwikisource", "arwikiversity", "arwiktionary", "arzwiki", "astwiki", "astwikibooks", "astwikiquote", "astwiktionary", "aswiki", "aswikibooks", "aswikisource", "aswiktionary", "auditcomwiki", "avwiki", "avwiktionary", "aywiki", "aywikibooks", "aywiktionary", "azwiki", "azwikibooks", "azwikiquote", "azwikisource", "azwiktionary", "azbwiki", "barwiki", "bat_smgwiki", "bawiki", "bawikibooks", "bclwiki", "bdwikimedia", "be_x_oldwiki", "betawikiversity", "bewiki", "bewikibooks", "bewikimedia", "bewikiquote", "bewikisource", "bewiktionary", "bgwiki", "bgwikibooks", "bgwikinews", "bgwikiquote", "bgwikisource", "bgwiktionary", "bhwiki", "bhwiktionary", "biwiki", "biwikibooks", "biwiktionary", "bjnwiki", "bmwiki", "bmwikibooks", "bmwikiquote", "bmwiktionary", "bnwiki", "bnwikibooks", "bnwikisource", "bnwiktionary", "boardgovcomwiki", "boardwiki", "bowiki", "bowikibooks", "bowiktionary", "bpywiki", "brwiki", "brwikimedia", "brwikiquote", "brwikisource", "brwiktionary", "bswiki", "bswikibooks", "bswikinews", "bswikiquote", "bswikisource", "bswiktionary", "bugwiki", "bxrwiki", "cawiki", "cawikibooks", "cawikimedia", "cawikinews", "cawikiquote", "cawikisource", "cawiktionary", "cbk_zamwiki", "cdowiki", "cebwiki", "cewiki", "chairwiki", "chapcomwiki", "checkuserwiki", "chowiki", "chrwiki", "chrwiktionary", "chwiki", "chwikibooks", "chwiktionary", "chywiki", "ckbwiki", "cnwikimedia", "collabwiki", "commonswiki", "cowiki", "cowikibooks", "cowikimedia", "cowikiquote", "cowiktionary", "crhwiki", "crwiki", "crwikiquote", "crwiktionary", "csbwiki", "csbwiktionary", "cswiki", "cswikibooks", "cswikinews", "cswikiquote", "cswikisource", "cswikiversity", "cswiktionary", "cuwiki", "cvwiki", "cvwikibooks", "cywiki", "cywikibooks", "cywikiquote", "cywikisource", "cywiktionary", "dawiki", "dawikibooks", "dawikiquote", "dawikisource", "dawiktionary", "dewiki", "dewikibooks", "dewikinews", "dewikiquote", "dewikisource", "dewikiversity", "dewikivoyage", "dewiktionary", "diqwiki", "dkwikimedia", "donatewiki", "dsbwiki", "dvwiki", "dvwiktionary", "dzwiki", "dzwiktionary", "ecwikimedia", "eewiki", "elwiki", "elwikibooks", "elwikinews", "elwikiquote", "elwikisource", "elwikiversity", "elwikivoyage", "elwiktionary", "emlwiki", "enwiki", "enwikibooks", "enwikinews", "enwikiquote", "enwikisource", "enwikiversity", "enwikivoyage", "enwiktionary", "eowiki", "eowikibooks", "eowikinews", "eowikiquote", "eowikisource", "eowiktionary", "eswiki", "eswikibooks", "eswikinews", "eswikiquote", "eswikisource", "eswikiversity", "eswikivoyage", "eswiktionary", "etwiki", "etwikibooks", "etwikimedia", "etwikiquote", "etwikisource", "etwiktionary", "euwiki", "euwikibooks", "euwikiquote", "euwiktionary", "execwiki", "extwiki", "fawiki", "fawikibooks", "fawikinews", "fawikiquote", "fawikisource", "fawikivoyage", "fawiktionary", "fdcwiki", "ffwiki", "fiu_vrowiki", "fiwiki", "fiwikibooks", "fiwikimedia", "fiwikinews", "fiwikiquote", "fiwikisource", "fiwikiversity", "fiwikivoyage", "fiwiktionary", "fjwiki", "fjwiktionary", "foundationwiki", "fowiki", "fowikisource", "fowiktionary", "frpwiki", "frrwiki", "frwiki", "frwikibooks", "frwikinews", "frwikiquote", "frwikisource", "frwikiversity", "frwikivoyage", "frwiktionary", "furwiki", "fywiki", "fywikibooks", "fywiktionary", "gagwiki", "ganwiki", "gawiki", "gawikibooks", "gawikiquote", "gawiktionary", "gdwiki", "gdwiktionary", "glkwiki", "glwiki", "glwikibooks", "glwikiquote", "glwikisource", "glwiktionary", "gnwiki", "gnwikibooks", "gnwiktionary", "gomwiki", "gotwiki", "gotwikibooks", "grantswiki", "guwiki", "guwikibooks", "guwikiquote", "guwikisource", "guwiktionary", "gvwiki", "gvwiktionary", "hakwiki", "hawiki", "hawiktionary", "hawwiki", "hewiki", "hewikibooks", "hewikinews", "hewikiquote", "hewikisource", "hewikivoyage", "hewiktionary", "hifwiki", "hiwiki", "hiwikibooks", "hiwikiquote", "hiwiktionary", "howiki", "hrwiki", "hrwikibooks", "hrwikiquote", "hrwikisource", "hrwiktionary", "hsbwiki", "hsbwiktionary", "htwiki", "htwikisource", "huwiki", "huwikibooks", "huwikinews", "huwikiquote", "huwikisource", "huwiktionary", "hywiki", "hywikibooks", "hywikiquote", "hywikisource", "hywiktionary", "hzwiki", "iawiki", "iawikibooks", "iawiktionary", "idwiki", "idwikibooks", "idwikiquote", "idwikisource", "idwiktionary", "iegcomwiki", "iewiki", "iewikibooks", "iewiktionary", "igwiki", "iiwiki", "ikwiki", "ikwiktionary", "ilowiki", "ilwikimedia", "incubatorwiki", "internalwiki", "iowiki", "iowiktionary", "iswiki", "iswikibooks", "iswikiquote", "iswikisource", "iswiktionary", "itwiki", "itwikibooks", "itwikinews", "itwikiquote", "itwikisource", "itwikiversity", "itwikivoyage", "itwiktionary", "iuwiki", "iuwiktionary", "jamwiki", "jawiki", "jawikibooks", "jawikinews", "jawikiquote", "jawikisource", "jawikiversity", "jawiktionary", "jbowiki", "jbowiktionary", "jvwiki", "jvwiktionary", "kaawiki", "kabwiki", "kawiki", "kawikibooks", "kawikiquote", "kawiktionary", "kbdwiki", "kgwiki", "kiwiki", "kjwiki", "kkwiki", "kkwikibooks", "kkwikiquote", "kkwiktionary", "klwiki", "klwiktionary", "kmwiki", "kmwikibooks", "kmwiktionary", "knwiki", "knwikibooks", "knwikiquote", "knwikisource", "knwiktionary", "koiwiki", "kowiki", "kowikibooks", "kowikinews", "kowikiquote", "kowikisource", "kowikiversity", "kowiktionary", "krcwiki", "krwiki", "krwikiquote", "kshwiki", "kswiki", "kswikibooks", "kswikiquote", "kswiktionary", "kuwiki", "kuwikibooks", "kuwikiquote", "kuwiktionary", "kvwiki", "kwwiki", "kwwikiquote", "kwwiktionary", "kywiki", "kywikibooks", "kywikiquote", "kywiktionary", "labswiki", "labtestwiki", "ladwiki", "lawiki", "lawikibooks", "lawikiquote", "lawikisource", "lawiktionary", "lbewiki", "lbwiki", "lbwikibooks", "lbwikiquote", "lbwiktionary", "legalteamwiki", "lezwiki", "lgwiki", "lijwiki", "liwiki", "liwikibooks", "liwikiquote", "liwikisource", "liwiktionary", "lmowiki", "lnwiki", "lnwikibooks", "lnwiktionary", "loginwiki", "lowiki", "lowiktionary", "lrcwiki", "ltgwiki", "ltwiki", "ltwikibooks", "ltwikiquote", "ltwikisource", "ltwiktionary", "lvwiki", "lvwikibooks", "lvwiktionary", "maiwiki", "map_bmswiki", "mdfwiki", "mediawikiwiki", "metawiki", "mgwiki", "mgwikibooks", "mgwiktionary", "mhrwiki", "mhwiki", "mhwiktionary", "minwiki", "miwiki", "miwikibooks", "miwiktionary", "mkwiki", "mkwikibooks", "mkwikimedia", "mkwikisource", "mkwiktionary", "mlwiki", "mlwikibooks", "mlwikiquote", "mlwikisource", "mlwiktionary", "mnwiki", "mnwikibooks", "mnwiktionary", "movementroleswiki", "mowiki", "mowiktionary", "mrjwiki", "mrwiki", "mrwikibooks", "mrwikiquote", "mrwikisource", "mrwiktionary", "mswiki", "mswikibooks", "mswiktionary", "mtwiki", "mtwiktionary", "muswiki", "mwlwiki", "mxwikimedia", "myvwiki", "mywiki", "mywikibooks", "mywiktionary", "mznwiki", "nahwiki", "nahwikibooks", "nahwiktionary", "napwiki", "nawiki", "nawikibooks", "nawikiquote", "nawiktionary", "nds_nlwiki", "ndswiki", "ndswikibooks", "ndswikiquote", "ndswiktionary", "newiki", "newikibooks", "newiktionary", "newwiki", "ngwiki", "nlwiki", "nlwikibooks", "nlwikimedia", "nlwikinews", "nlwikiquote", "nlwikisource", "nlwikivoyage", "nlwiktionary", "nnwiki", "nnwikiquote", "nnwiktionary", "noboard_chapterswikimedia", "nostalgiawiki", "novwiki", "nowiki", "nowikibooks", "nowikimedia", "nowikinews", "nowikiquote", "nowikisource", "nowiktionary", "nrmwiki", "nsowiki", "nvwiki", "nycwikimedia", "nywiki", "nzwikimedia", "ocwiki", "ocwikibooks", "ocwiktionary", "officewiki", "olowiki", "ombudsmenwiki", "omwiki", "omwiktionary", "orwiki", "orwikisource", "orwiktionary", "oswiki", "otrs_wikiwiki", "outreachwiki", "pa_uswikimedia", "pagwiki", "pamwiki", "papwiki", "pawiki", "pawikibooks", "pawikisource", "pawiktionary", "pcdwiki", "pdcwiki", "pflwiki", "pihwiki", "piwiki", "piwiktionary", "plwiki", "plwikibooks", "plwikimedia", "plwikinews", "plwikiquote", "plwikisource", "plwikivoyage", "plwiktionary", "pmswiki", "pnbwiki", "pnbwiktionary", "pntwiki", "projectcomwiki", "pswiki", "pswikibooks", "pswiktionary", "ptwiki", "ptwikibooks", "ptwikinews", "ptwikiquote", "ptwikisource", "ptwikiversity", "ptwikivoyage", "ptwiktionary", "qualitywiki", "quwiki", "quwikibooks", "quwikiquote", "quwiktionary", "rmwiki", "rmwikibooks", "rmwiktionary", "rmywiki", "rnwiki", "rnwiktionary", "roa_rupwiki", "roa_rupwiktionary", "roa_tarawiki", "rowiki", "rowikibooks", "rowikinews", "rowikiquote", "rowikisource", "rowikivoyage", "rowiktionary", "rswikimedia", "ruewiki", "ruwiki", "ruwikibooks", "ruwikimedia", "ruwikinews", "ruwikiquote", "ruwikisource", "ruwikiversity", "ruwikivoyage", "ruwiktionary", "rwwiki", "rwwiktionary", "sahwiki", "sahwikisource", "sawiki", "sawikibooks", "sawikiquote", "sawikisource", "sawiktionary", "scnwiki", "scnwiktionary", "scowiki", "scwiki", "scwiktionary", "sdwiki", "sdwikinews", "sdwiktionary", "searchcomwiki", "sewiki", "sewikibooks", "sewikimedia", "sgwiki", "sgwiktionary", "shwiki", "shwiktionary", "simplewiki", "simplewikibooks", "simplewikiquote", "simplewiktionary", "siwiki", "siwikibooks", "siwiktionary", "skwiki", "skwikibooks", "skwikiquote", "skwikisource", "skwiktionary", "slwiki", "slwikibooks", "slwikiquote", "slwikisource", "slwikiversity", "slwiktionary", "smwiki", "smwiktionary", "snwiki", "snwiktionary", "sourceswiki", "sowiki", "sowiktionary", "spcomwiki", "specieswiki", "sqwiki", "sqwikibooks", "sqwikinews", "sqwikiquote", "sqwiktionary", "srnwiki", "srwiki", "srwikibooks", "srwikinews", "srwikiquote", "srwikisource", "srwiktionary", "sswiki", "sswiktionary", "stewardwiki", "stqwiki", "strategywiki", "stwiki", "stwiktionary", "suwiki", "suwikibooks", "suwikiquote", "suwiktionary", "svwiki", "svwikibooks", "svwikinews", "svwikiquote", "svwikisource", "svwikiversity", "svwikivoyage", "svwiktionary", "swwiki", "swwikibooks", "swwiktionary", "szlwiki", "tawiki", "tawikibooks", "tawikinews", "tawikiquote", "tawikisource", "tawiktionary", "tcywiki", "tenwiki", "test2wiki", "testwiki", "testwikidatawiki", "tetwiki", "tewiki", "tewikibooks", "tewikiquote", "tewikisource", "tewiktionary", "tgwiki", "tgwikibooks", "tgwiktionary", "thwiki", "thwikibooks", "thwikinews", "thwikiquote", "thwikisource", "thwiktionary", "tiwiki", "tiwiktionary", "tkwiki", "tkwikibooks", "tkwikiquote", "tkwiktionary", "tlwiki", "tlwikibooks", "tlwiktionary", "tnwiki", "tnwiktionary", "towiki", "towiktionary", "tpiwiki", "tpiwiktionary", "transitionteamwiki", "trwiki", "trwikibooks", "trwikimedia", "trwikinews", "trwikiquote", "trwikisource", "trwiktionary", "tswiki", "tswiktionary", "ttwiki", "ttwikibooks", "ttwikiquote", "ttwiktionary", "tumwiki", "twwiki", "twwiktionary", "tyvwiki", "tywiki", "uawikimedia", "udmwiki", "ugwiki", "ugwikibooks", "ugwikiquote", "ugwiktionary", "ukwiki", "ukwikibooks", "ukwikimedia", "ukwikinews", "ukwikiquote", "ukwikisource", "ukwikivoyage", "ukwiktionary", "urwiki", "urwikibooks", "urwikiquote", "urwiktionary", "usabilitywiki", "uzwiki", "uzwikibooks", "uzwikiquote", "uzwiktionary", "vecwiki", "vecwikisource", "vecwiktionary", "vepwiki", "vewiki", "viwiki", "viwikibooks", "viwikiquote", "viwikisource", "viwikivoyage", "viwiktionary", "vlswiki", "votewiki", "vowiki", "vowikibooks", "vowikiquote", "vowiktionary", "warwiki", "wawiki", "wawikibooks", "wawiktionary", "wbwikimedia", "wg_enwiki", "wikidatawiki", "wikimania2005wiki", "wikimania2006wiki", "wikimania2007wiki", "wikimania2008wiki", "wikimania2009wiki", "wikimania2010wiki", "wikimania2011wiki", "wikimania2012wiki", "wikimania2013wiki", "wikimania2014wiki", "wikimania2015wiki", "wikimania2016wiki", "wikimania2017wiki", "wikimaniateamwiki", "wowiki", "wowikiquote", "wowiktionary", "wuuwiki", "xalwiki", "xhwiki", "xhwikibooks", "xhwiktionary", "xmfwiki", "yiwiki", "yiwikisource", "yiwiktionary", "yowiki", "yowikibooks", "yowiktionary", "zawiki", "zawikibooks", "zawikiquote", "zawiktionary", "zeawiki", "zerowiki", "zh_classicalwiki", "zh_min_nanwiki", "zh_min_nanwikibooks", "zh_min_nanwikiquote", "zh_min_nanwikisource", "zh_min_nanwiktionary", "zh_yuewiki", "zhwiki", "zhwikibooks", "zhwikinews", "zhwikiquote", "zhwikisource", "zhwikivoyage", "zhwiktionary", "zuwiki", "zuwikibooks", "zuwiktionary", "*".
  #    * filter (Array<String>) Filter notifications returned. Allowed values: "read", "!read".
  #    * prop (Array<String>) Details to request. Allowed values: "list", "count", "seenTime".
  #    * sections (Array<String>) The notification sections to query (i.e. some combination of 'alert' and 'message'). Allowed values: "alert", "message".
  #    * groupbysection (true, false) Whether to group the result by section. Each section is fetched separately if set.
  #    * format (String) If specified, notifications will be returned formatted this way. One of "model" (Raw notification data), "special" (Formatted for Special:Notifications page (and only that!) Do not rely on the HTML as it may change at any given time), "flyout" (Deprecated. Use notformat=model for raw data), "html" (Deprecated. Use notformat=model for raw data).
  #    * limit (Integer, "max") The maximum number of notifications to return.
  #    * continue (String) When more results are available, use this to continue.
  #    * unreadfirst (true, false) Whether to show unread notifications first (only used if groupbysection is not set).
  #    * titles (Array<String>) Only return notifications for these pages. To get notifications not associated with any page, use [] as a title.
  #    * bundle (true, false) Whether to show bundle compatible unread notifications according to notification types bundling rules.
  #    * alertcontinue (String) When more alert results are available, use this to continue.
  #    * alertunreadfirst (true, false) Whether to show unread message notifications first (only used if groupbysection is set).
  #    * messagecontinue (String) When more message results are available, use this to continue.
  #    * messageunreadfirst (true, false) Whether to show unread alert notifications first (only used if groupbysection is set).
  #    * crosswikisummary (true, false) True to opt in to a summary notification of notifications on foreign wikis.
  #  * `:oath` (Check to see if two-factor authentication (OATH) is enabled for a user.):
  #    * user (String) User to get information about. Defaults to the current user.
  #  * `:ores` (Return ORES configuration and model data for this wiki.):
  #  * `:siteinfo` (Return general information about the site.):
  #    * prop (Array<String>) Which information to get: Allowed values: "general" (Overall system information), "namespaces" (List of registered namespaces and their canonical names), "namespacealiases" (List of registered namespace aliases), "specialpagealiases" (List of special page aliases), "magicwords" (List of magic words and their aliases), "interwikimap" (Returns interwiki map (optionally filtered, optionally localised by using siinlanguagecode)), "dbrepllag" (Returns database server with the highest replication lag), "statistics" (Returns site statistics), "usergroups" (Returns user groups and the associated permissions), "libraries" (Returns libraries installed on the wiki), "extensions" (Returns extensions installed on the wiki), "fileextensions" (Returns list of file extensions (file types) allowed to be uploaded), "rightsinfo" (Returns wiki rights (license) information if available), "restrictions" (Returns information on available restriction (protection) types), "languages" (Returns a list of languages MediaWiki supports (optionally localised by using siinlanguagecode)), "languagevariants" (Returns a list of language codes for which LanguageConverter is enabled, and the variants supported for each), "skins" (Returns a list of all enabled skins (optionally localised by using siinlanguagecode, otherwise in the content language)), "extensiontags" (Returns a list of parser extension tags), "functionhooks" (Returns a list of parser function hooks), "showhooks" (Returns a list of all subscribed hooks (contents of $wgHooks)), "variables" (Returns a list of variable IDs), "protocols" (Returns a list of protocols that are allowed in external links), "defaultoptions" (Returns the default values for user preferences), "uploaddialog" (Returns the upload dialog configuration).
  #    * filteriw (String) Return only local or only nonlocal entries of the interwiki map. One of "local", "!local".
  #    * showalldb (true, false) List all database servers, not just the one lagging the most.
  #    * numberingroup (true, false) Lists the number of users in user groups.
  #    * inlanguagecode (String) Language code for localised language names (best effort) and skin names.
  #  * `:siteviews` (Shows sitewide pageview data (daily pageview totals for each of the last pvisdays days). The result format is date (Ymd) => count.):
  #    * metric (String) The metric to use for counting views. Depending on what backend is used, not all metrics might be supported. You can use the siteinfo API (action=query&meta=siteinfo) to check, under pageviewservice-supported-metrics / <module name> One of "pageviews" (Plain pageviews), "uniques" (Unique visitors).
  #    * days (Integer) The number of days to show.
  #  * `:tokens` (Gets tokens for data-modifying actions.):
  #    * type (Array<String>) Types of token to request. Allowed values: "createaccount", "csrf", "deleteglobalaccount", "login", "patrol", "rollback", "setglobalaccountstatus", "userrights", "watch".
  #  * `:unreadnotificationpages` (Get pages for which there are unread notifications for the current user.):
  #    * wikis (Array<String>) List of wikis to fetch pages with unread notifications from (defaults to only current wiki). Allowed values: "aawiki", "aawikibooks", "aawiktionary", "abwiki", "abwiktionary", "acewiki", "advisorywiki", "adywiki", "afwiki", "afwikibooks", "afwikiquote", "afwiktionary", "akwiki", "akwikibooks", "akwiktionary", "alswiki", "alswikibooks", "alswikiquote", "alswiktionary", "amwiki", "amwikiquote", "amwiktionary", "angwiki", "angwikibooks", "angwikiquote", "angwikisource", "angwiktionary", "anwiki", "anwiktionary", "arbcom_cswiki", "arbcom_dewiki", "arbcom_enwiki", "arbcom_fiwiki", "arbcom_nlwiki", "arcwiki", "arwiki", "arwikibooks", "arwikimedia", "arwikinews", "arwikiquote", "arwikisource", "arwikiversity", "arwiktionary", "arzwiki", "astwiki", "astwikibooks", "astwikiquote", "astwiktionary", "aswiki", "aswikibooks", "aswikisource", "aswiktionary", "auditcomwiki", "avwiki", "avwiktionary", "aywiki", "aywikibooks", "aywiktionary", "azwiki", "azwikibooks", "azwikiquote", "azwikisource", "azwiktionary", "azbwiki", "barwiki", "bat_smgwiki", "bawiki", "bawikibooks", "bclwiki", "bdwikimedia", "be_x_oldwiki", "betawikiversity", "bewiki", "bewikibooks", "bewikimedia", "bewikiquote", "bewikisource", "bewiktionary", "bgwiki", "bgwikibooks", "bgwikinews", "bgwikiquote", "bgwikisource", "bgwiktionary", "bhwiki", "bhwiktionary", "biwiki", "biwikibooks", "biwiktionary", "bjnwiki", "bmwiki", "bmwikibooks", "bmwikiquote", "bmwiktionary", "bnwiki", "bnwikibooks", "bnwikisource", "bnwiktionary", "boardgovcomwiki", "boardwiki", "bowiki", "bowikibooks", "bowiktionary", "bpywiki", "brwiki", "brwikimedia", "brwikiquote", "brwikisource", "brwiktionary", "bswiki", "bswikibooks", "bswikinews", "bswikiquote", "bswikisource", "bswiktionary", "bugwiki", "bxrwiki", "cawiki", "cawikibooks", "cawikimedia", "cawikinews", "cawikiquote", "cawikisource", "cawiktionary", "cbk_zamwiki", "cdowiki", "cebwiki", "cewiki", "chairwiki", "chapcomwiki", "checkuserwiki", "chowiki", "chrwiki", "chrwiktionary", "chwiki", "chwikibooks", "chwiktionary", "chywiki", "ckbwiki", "cnwikimedia", "collabwiki", "commonswiki", "cowiki", "cowikibooks", "cowikimedia", "cowikiquote", "cowiktionary", "crhwiki", "crwiki", "crwikiquote", "crwiktionary", "csbwiki", "csbwiktionary", "cswiki", "cswikibooks", "cswikinews", "cswikiquote", "cswikisource", "cswikiversity", "cswiktionary", "cuwiki", "cvwiki", "cvwikibooks", "cywiki", "cywikibooks", "cywikiquote", "cywikisource", "cywiktionary", "dawiki", "dawikibooks", "dawikiquote", "dawikisource", "dawiktionary", "dewiki", "dewikibooks", "dewikinews", "dewikiquote", "dewikisource", "dewikiversity", "dewikivoyage", "dewiktionary", "diqwiki", "dkwikimedia", "donatewiki", "dsbwiki", "dvwiki", "dvwiktionary", "dzwiki", "dzwiktionary", "ecwikimedia", "eewiki", "elwiki", "elwikibooks", "elwikinews", "elwikiquote", "elwikisource", "elwikiversity", "elwikivoyage", "elwiktionary", "emlwiki", "enwiki", "enwikibooks", "enwikinews", "enwikiquote", "enwikisource", "enwikiversity", "enwikivoyage", "enwiktionary", "eowiki", "eowikibooks", "eowikinews", "eowikiquote", "eowikisource", "eowiktionary", "eswiki", "eswikibooks", "eswikinews", "eswikiquote", "eswikisource", "eswikiversity", "eswikivoyage", "eswiktionary", "etwiki", "etwikibooks", "etwikimedia", "etwikiquote", "etwikisource", "etwiktionary", "euwiki", "euwikibooks", "euwikiquote", "euwiktionary", "execwiki", "extwiki", "fawiki", "fawikibooks", "fawikinews", "fawikiquote", "fawikisource", "fawikivoyage", "fawiktionary", "fdcwiki", "ffwiki", "fiu_vrowiki", "fiwiki", "fiwikibooks", "fiwikimedia", "fiwikinews", "fiwikiquote", "fiwikisource", "fiwikiversity", "fiwikivoyage", "fiwiktionary", "fjwiki", "fjwiktionary", "foundationwiki", "fowiki", "fowikisource", "fowiktionary", "frpwiki", "frrwiki", "frwiki", "frwikibooks", "frwikinews", "frwikiquote", "frwikisource", "frwikiversity", "frwikivoyage", "frwiktionary", "furwiki", "fywiki", "fywikibooks", "fywiktionary", "gagwiki", "ganwiki", "gawiki", "gawikibooks", "gawikiquote", "gawiktionary", "gdwiki", "gdwiktionary", "glkwiki", "glwiki", "glwikibooks", "glwikiquote", "glwikisource", "glwiktionary", "gnwiki", "gnwikibooks", "gnwiktionary", "gomwiki", "gotwiki", "gotwikibooks", "grantswiki", "guwiki", "guwikibooks", "guwikiquote", "guwikisource", "guwiktionary", "gvwiki", "gvwiktionary", "hakwiki", "hawiki", "hawiktionary", "hawwiki", "hewiki", "hewikibooks", "hewikinews", "hewikiquote", "hewikisource", "hewikivoyage", "hewiktionary", "hifwiki", "hiwiki", "hiwikibooks", "hiwikiquote", "hiwiktionary", "howiki", "hrwiki", "hrwikibooks", "hrwikiquote", "hrwikisource", "hrwiktionary", "hsbwiki", "hsbwiktionary", "htwiki", "htwikisource", "huwiki", "huwikibooks", "huwikinews", "huwikiquote", "huwikisource", "huwiktionary", "hywiki", "hywikibooks", "hywikiquote", "hywikisource", "hywiktionary", "hzwiki", "iawiki", "iawikibooks", "iawiktionary", "idwiki", "idwikibooks", "idwikiquote", "idwikisource", "idwiktionary", "iegcomwiki", "iewiki", "iewikibooks", "iewiktionary", "igwiki", "iiwiki", "ikwiki", "ikwiktionary", "ilowiki", "ilwikimedia", "incubatorwiki", "internalwiki", "iowiki", "iowiktionary", "iswiki", "iswikibooks", "iswikiquote", "iswikisource", "iswiktionary", "itwiki", "itwikibooks", "itwikinews", "itwikiquote", "itwikisource", "itwikiversity", "itwikivoyage", "itwiktionary", "iuwiki", "iuwiktionary", "jamwiki", "jawiki", "jawikibooks", "jawikinews", "jawikiquote", "jawikisource", "jawikiversity", "jawiktionary", "jbowiki", "jbowiktionary", "jvwiki", "jvwiktionary", "kaawiki", "kabwiki", "kawiki", "kawikibooks", "kawikiquote", "kawiktionary", "kbdwiki", "kgwiki", "kiwiki", "kjwiki", "kkwiki", "kkwikibooks", "kkwikiquote", "kkwiktionary", "klwiki", "klwiktionary", "kmwiki", "kmwikibooks", "kmwiktionary", "knwiki", "knwikibooks", "knwikiquote", "knwikisource", "knwiktionary", "koiwiki", "kowiki", "kowikibooks", "kowikinews", "kowikiquote", "kowikisource", "kowikiversity", "kowiktionary", "krcwiki", "krwiki", "krwikiquote", "kshwiki", "kswiki", "kswikibooks", "kswikiquote", "kswiktionary", "kuwiki", "kuwikibooks", "kuwikiquote", "kuwiktionary", "kvwiki", "kwwiki", "kwwikiquote", "kwwiktionary", "kywiki", "kywikibooks", "kywikiquote", "kywiktionary", "labswiki", "labtestwiki", "ladwiki", "lawiki", "lawikibooks", "lawikiquote", "lawikisource", "lawiktionary", "lbewiki", "lbwiki", "lbwikibooks", "lbwikiquote", "lbwiktionary", "legalteamwiki", "lezwiki", "lgwiki", "lijwiki", "liwiki", "liwikibooks", "liwikiquote", "liwikisource", "liwiktionary", "lmowiki", "lnwiki", "lnwikibooks", "lnwiktionary", "loginwiki", "lowiki", "lowiktionary", "lrcwiki", "ltgwiki", "ltwiki", "ltwikibooks", "ltwikiquote", "ltwikisource", "ltwiktionary", "lvwiki", "lvwikibooks", "lvwiktionary", "maiwiki", "map_bmswiki", "mdfwiki", "mediawikiwiki", "metawiki", "mgwiki", "mgwikibooks", "mgwiktionary", "mhrwiki", "mhwiki", "mhwiktionary", "minwiki", "miwiki", "miwikibooks", "miwiktionary", "mkwiki", "mkwikibooks", "mkwikimedia", "mkwikisource", "mkwiktionary", "mlwiki", "mlwikibooks", "mlwikiquote", "mlwikisource", "mlwiktionary", "mnwiki", "mnwikibooks", "mnwiktionary", "movementroleswiki", "mowiki", "mowiktionary", "mrjwiki", "mrwiki", "mrwikibooks", "mrwikiquote", "mrwikisource", "mrwiktionary", "mswiki", "mswikibooks", "mswiktionary", "mtwiki", "mtwiktionary", "muswiki", "mwlwiki", "mxwikimedia", "myvwiki", "mywiki", "mywikibooks", "mywiktionary", "mznwiki", "nahwiki", "nahwikibooks", "nahwiktionary", "napwiki", "nawiki", "nawikibooks", "nawikiquote", "nawiktionary", "nds_nlwiki", "ndswiki", "ndswikibooks", "ndswikiquote", "ndswiktionary", "newiki", "newikibooks", "newiktionary", "newwiki", "ngwiki", "nlwiki", "nlwikibooks", "nlwikimedia", "nlwikinews", "nlwikiquote", "nlwikisource", "nlwikivoyage", "nlwiktionary", "nnwiki", "nnwikiquote", "nnwiktionary", "noboard_chapterswikimedia", "nostalgiawiki", "novwiki", "nowiki", "nowikibooks", "nowikimedia", "nowikinews", "nowikiquote", "nowikisource", "nowiktionary", "nrmwiki", "nsowiki", "nvwiki", "nycwikimedia", "nywiki", "nzwikimedia", "ocwiki", "ocwikibooks", "ocwiktionary", "officewiki", "olowiki", "ombudsmenwiki", "omwiki", "omwiktionary", "orwiki", "orwikisource", "orwiktionary", "oswiki", "otrs_wikiwiki", "outreachwiki", "pa_uswikimedia", "pagwiki", "pamwiki", "papwiki", "pawiki", "pawikibooks", "pawikisource", "pawiktionary", "pcdwiki", "pdcwiki", "pflwiki", "pihwiki", "piwiki", "piwiktionary", "plwiki", "plwikibooks", "plwikimedia", "plwikinews", "plwikiquote", "plwikisource", "plwikivoyage", "plwiktionary", "pmswiki", "pnbwiki", "pnbwiktionary", "pntwiki", "projectcomwiki", "pswiki", "pswikibooks", "pswiktionary", "ptwiki", "ptwikibooks", "ptwikinews", "ptwikiquote", "ptwikisource", "ptwikiversity", "ptwikivoyage", "ptwiktionary", "qualitywiki", "quwiki", "quwikibooks", "quwikiquote", "quwiktionary", "rmwiki", "rmwikibooks", "rmwiktionary", "rmywiki", "rnwiki", "rnwiktionary", "roa_rupwiki", "roa_rupwiktionary", "roa_tarawiki", "rowiki", "rowikibooks", "rowikinews", "rowikiquote", "rowikisource", "rowikivoyage", "rowiktionary", "rswikimedia", "ruewiki", "ruwiki", "ruwikibooks", "ruwikimedia", "ruwikinews", "ruwikiquote", "ruwikisource", "ruwikiversity", "ruwikivoyage", "ruwiktionary", "rwwiki", "rwwiktionary", "sahwiki", "sahwikisource", "sawiki", "sawikibooks", "sawikiquote", "sawikisource", "sawiktionary", "scnwiki", "scnwiktionary", "scowiki", "scwiki", "scwiktionary", "sdwiki", "sdwikinews", "sdwiktionary", "searchcomwiki", "sewiki", "sewikibooks", "sewikimedia", "sgwiki", "sgwiktionary", "shwiki", "shwiktionary", "simplewiki", "simplewikibooks", "simplewikiquote", "simplewiktionary", "siwiki", "siwikibooks", "siwiktionary", "skwiki", "skwikibooks", "skwikiquote", "skwikisource", "skwiktionary", "slwiki", "slwikibooks", "slwikiquote", "slwikisource", "slwikiversity", "slwiktionary", "smwiki", "smwiktionary", "snwiki", "snwiktionary", "sourceswiki", "sowiki", "sowiktionary", "spcomwiki", "specieswiki", "sqwiki", "sqwikibooks", "sqwikinews", "sqwikiquote", "sqwiktionary", "srnwiki", "srwiki", "srwikibooks", "srwikinews", "srwikiquote", "srwikisource", "srwiktionary", "sswiki", "sswiktionary", "stewardwiki", "stqwiki", "strategywiki", "stwiki", "stwiktionary", "suwiki", "suwikibooks", "suwikiquote", "suwiktionary", "svwiki", "svwikibooks", "svwikinews", "svwikiquote", "svwikisource", "svwikiversity", "svwikivoyage", "svwiktionary", "swwiki", "swwikibooks", "swwiktionary", "szlwiki", "tawiki", "tawikibooks", "tawikinews", "tawikiquote", "tawikisource", "tawiktionary", "tcywiki", "tenwiki", "test2wiki", "testwiki", "testwikidatawiki", "tetwiki", "tewiki", "tewikibooks", "tewikiquote", "tewikisource", "tewiktionary", "tgwiki", "tgwikibooks", "tgwiktionary", "thwiki", "thwikibooks", "thwikinews", "thwikiquote", "thwikisource", "thwiktionary", "tiwiki", "tiwiktionary", "tkwiki", "tkwikibooks", "tkwikiquote", "tkwiktionary", "tlwiki", "tlwikibooks", "tlwiktionary", "tnwiki", "tnwiktionary", "towiki", "towiktionary", "tpiwiki", "tpiwiktionary", "transitionteamwiki", "trwiki", "trwikibooks", "trwikimedia", "trwikinews", "trwikiquote", "trwikisource", "trwiktionary", "tswiki", "tswiktionary", "ttwiki", "ttwikibooks", "ttwikiquote", "ttwiktionary", "tumwiki", "twwiki", "twwiktionary", "tyvwiki", "tywiki", "uawikimedia", "udmwiki", "ugwiki", "ugwikibooks", "ugwikiquote", "ugwiktionary", "ukwiki", "ukwikibooks", "ukwikimedia", "ukwikinews", "ukwikiquote", "ukwikisource", "ukwikivoyage", "ukwiktionary", "urwiki", "urwikibooks", "urwikiquote", "urwiktionary", "usabilitywiki", "uzwiki", "uzwikibooks", "uzwikiquote", "uzwiktionary", "vecwiki", "vecwikisource", "vecwiktionary", "vepwiki", "vewiki", "viwiki", "viwikibooks", "viwikiquote", "viwikisource", "viwikivoyage", "viwiktionary", "vlswiki", "votewiki", "vowiki", "vowikibooks", "vowikiquote", "vowiktionary", "warwiki", "wawiki", "wawikibooks", "wawiktionary", "wbwikimedia", "wg_enwiki", "wikidatawiki", "wikimania2005wiki", "wikimania2006wiki", "wikimania2007wiki", "wikimania2008wiki", "wikimania2009wiki", "wikimania2010wiki", "wikimania2011wiki", "wikimania2012wiki", "wikimania2013wiki", "wikimania2014wiki", "wikimania2015wiki", "wikimania2016wiki", "wikimania2017wiki", "wikimaniateamwiki", "wowiki", "wowikiquote", "wowiktionary", "wuuwiki", "xalwiki", "xhwiki", "xhwikibooks", "xhwiktionary", "xmfwiki", "yiwiki", "yiwikisource", "yiwiktionary", "yowiki", "yowikibooks", "yowiktionary", "zawiki", "zawikibooks", "zawikiquote", "zawiktionary", "zeawiki", "zerowiki", "zh_classicalwiki", "zh_min_nanwiki", "zh_min_nanwikibooks", "zh_min_nanwikiquote", "zh_min_nanwikisource", "zh_min_nanwiktionary", "zh_yuewiki", "zhwiki", "zhwikibooks", "zhwikinews", "zhwikiquote", "zhwikisource", "zhwikivoyage", "zhwiktionary", "zuwiki", "zuwikibooks", "zuwiktionary", "*".
  #    * grouppages (true, false) Group talk pages together with their subject page, and group notifications not associated with a page together with the current user's user page.
  #    * limit (Integer, "max") The maximum number of pages to return.
  #  * `:userinfo` (Get information about the current user.):
  #    * prop (Array<String>) Which pieces of information to include: Allowed values: "blockinfo" (Tags if the current user is blocked, by whom, and for what reason), "hasmsg" (Adds a tag messages if the current user has pending messages), "groups" (Lists all the groups the current user belongs to), "groupmemberships" (Lists groups that the current user has been explicitly assigned to, including the expiry date of each group membership), "implicitgroups" (Lists all the groups the current user is automatically a member of), "rights" (Lists all the rights the current user has), "changeablegroups" (Lists the groups the current user can add to and remove from), "options" (Lists all preferences the current user has set), "preferencestoken" (Deprecated. Get a token to change current user's preferences), "editcount" (Adds the current user's edit count), "ratelimits" (Lists all rate limits applying to the current user), "email" (Adds the user's email address and email authentication date), "realname" (Adds the user's real name), "acceptlang" (Echoes the Accept-Language header sent by the client in a structured format), "registrationdate" (Adds the user's registration date), "unreadcount" (Adds the count of unread pages on the user's watchlist (maximum 999; returns 1000+ if more)), "centralids" (Adds the central IDs and attachment status for the user).
  #    * attachedwiki (String) With uiprop=centralids, indicate whether the user is attached with the wiki identified by this ID.
  #  * `:wikibase` (Get information about the Wikibase client and the associated Wikibase repository.):
  #    * prop (Array<String>) Which properties to get: Allowed values: "url" ( Base URL, script path and article path of the Wikibase repository), "siteid" ( The siteid of this site).
  #
  # @param values [Array<Symbol, Hash>] Any number of options (either symbol, or `{symbol: settings}` Hash).
  # @return [self]
  def meta(*values)
    merge(meta: modules_to_hash(values, [:allmessages, :authmanagerinfo, :babel, :featureusage, :filerepoinfo, :globaluserinfo, :notifications, :oath, :ores, :siteinfo, :siteviews, :tokens, :unreadnotificationpages, :userinfo, :wikibase]))
  end
  # Include an additional pageids section listing all returned page IDs.
  #
  # @param value [true, false]
  # @return [self]
  def indexpageids(value = true)
    merge(indexpageids: 'true') if value
  end
  # Export the current revisions of all given or generated pages.
  #
  # @param value [true, false]
  # @return [self]
  def export(value = true)
    merge(export: 'true') if value
  end
  # Return the export XML without wrapping it in an XML result (same format as Special:Export). Can only be used with export.
  #
  # @param value [true, false]
  # @return [self]
  def exportnowrap(value = true)
    merge(exportnowrap: 'true') if value
  end
  # Whether to get the full URL if the title is an interwiki link.
  #
  # @param value [true, false]
  # @return [self]
  def iwurl(value = true)
    merge(iwurl: 'true') if value
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
  # @param value [true, false]
  # @return [self]
  def rawcontinue(value = true)
    merge(rawcontinue: 'true') if value
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
  # Note: Generator parameter names must be prefixed with a "g", see examples.
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
  #    * user (String) Only list revisions by this user. Note: Due to miser mode, using adruser and adrnamespace together may result in fewer than adrlimit results returned before continuing; in extreme cases, zero results may be returned.
  #    * namespace (Array<String>) Only list pages in this namespace. Note: Due to miser mode, using adruser and adrnamespace together may result in fewer than adrlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
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
  #    * unique (true, false) Only show distinct file titles. Cannot be used with afprop=ids. When used as a generator, yields target pages instead of source pages.
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
  #    * unique (true, false) Only show distinct linked titles. Cannot be used with alprop=ids. When used as a generator, yields target pages instead of source pages.
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
  #    * filterredir (String) Which pages to list. Note: Due to miser mode, using this may result in fewer than aplimit results returned before continuing; in extreme cases, zero results may be returned. One of "all", "redirects", "nonredirects".
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
  #    * unique (true, false) Only show distinct target pages. Cannot be used with arprop=ids|fragment|interwiki. When used as a generator, yields target pages instead of source pages.
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
  #    * namespace (Array<String>) Only list pages in this namespace. Note: Due to miser mode, using this may result in fewer than arvlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
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
  #    * unique (true, false) Only show distinct transcluded titles. Cannot be used with atprop=ids. When used as a generator, yields target pages instead of source pages.
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
  #    * namespace (Array<String>) Only include pages in these namespaces. Note that cmtype=subcat or cmtype=file may be used instead of cmnamespace=14 or 6. Note: Due to miser mode, using this may result in fewer than cmlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
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
  #  * `:deletedrevisions` (Get deleted revision information. May be used in several ways:):
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
  #    * namespace (Array<String>) The page namespaces to enumerate. Note: Due to miser mode, using this may result in fewer than eulimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * limit (Integer, "max") How many pages to return.
  #    * expandurl (true, false) Expand protocol-relative URLs with the canonical protocol.
  #  * `:fileusage` (Find all pages that use the given files.):
  #    * prop (Array<String>) Which properties to get: Allowed values: "pageid" (Page ID of each page), "title" (Title of each page), "redirect" (Flag if the page is a redirect).
  #    * namespace (Array<String>) Only include pages in these namespaces. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * show (Array<String>) Show only items that meet these criteria: Allowed values: "redirect" (Only show redirects), "!redirect" (Only show non-redirects).
  #    * limit (Integer, "max") How many to return.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:geosearch` (Returns pages having coordinates that are located in a certain area.):
  #    * coord (String) Coordinate around which to search. Format: Latitude and longitude separated by pipe ("|").
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
  #  * `:iwbacklinks` (Find all pages that link to the given interwiki link. Can be used to find all links with a prefix, or all links to a title (with a given prefix). Using neither parameter is effectively "all interwiki links".):
  #    * prefix (String) Prefix for the interwiki.
  #    * title (String) Interwiki link to search for. Must be used with iwblblprefix.
  #    * continue (String) When more results are available, use this to continue.
  #    * limit (Integer, "max") How many total pages to return.
  #    * prop (Array<String>) Which properties to get: Allowed values: "iwprefix" (Adds the prefix of the interwiki), "iwtitle" (Adds the title of the interwiki).
  #    * dir (String) The direction in which to list. One of "ascending", "descending".
  #  * `:langbacklinks` (Find all pages that link to the given language link. Can be used to find all links with a language code, or all links to a title (with a given language). Using neither parameter is effectively "all language links". Note that this may not consider language links added by extensions.):
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
  #  * `:prefixsearch` (Perform a prefix search for page titles. Despite the similarity in names, this module is not intended to be equivalent to Special:PrefixIndex; for that, see action=query&list=allpages with the apprefix parameter. The purpose of this module is similar to action=opensearch: to take user input and provide the best-matching titles. Depending on the search engine backend, this might include typo correction, redirect avoidance, or other heuristics.):
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
  #  * `:random` (Get a set of random pages. Pages are listed in a fixed sequence, only the starting point is random. This means that if, for example, Main Page is the first random page in the list, List of fictional monkeys will always be second, List of people on stamps of Vanuatu third, etc.):
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
  #    * namespace (Array<String>) Only include pages in these namespaces. Note: Due to miser mode, using this may result in fewer than rdlimit results returned before continuing; in extreme cases, zero results may be returned. Allowed values: "0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "446", "447", "710", "711", "828", "829", "2300", "2301", "2302", "2303".
  #    * show (Array<String>) Show only items that meet these criteria: Allowed values: "fragment" (Only show redirects with a fragment), "!fragment" (Only show redirects without a fragment).
  #    * limit (Integer, "max") How many redirects to return.
  #    * continue (String) When more results are available, use this to continue.
  #  * `:revisions` (Get revision information. May be used in several ways:):
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
