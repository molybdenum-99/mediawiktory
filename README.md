https://www.mediawiki.org/wiki/API:Client_code#Ruby

**MediaWiktory** is MediaWiki API client that doesn't suck. No, seriously.

[MediaWiki API](https://www.mediawiki.org/wiki/API:Main_page)
currently is very powerful and full-featured (thought not very easy to use).
Things like "fetch first 50 pages from that category alongside with their
revision history and interwiki links and mediafile stats" are typically done
with one carefully constructed request and return lots of useful information.

Yes, there already are [several](https://www.mediawiki.org/wiki/API:Client_code#Ruby)
API clients for Ruby, including ["official" one](https://github.com/wikimedia/mediawiki-ruby-api).
Typical approach for all of them is thick wrapper around some functionality
(like "login and edit pages" or "search and analyze pages"), and leave
all the other cool things for generic `query` method (at best), or
without any coverage at all.

MediaWiktory, on the contrary, does this:
* wraps all the functionality of all the modules of modern MediaWiki,
  as per [this documentation](https://en.wikipedia.org/w/api.php?action=help&modules=main);
  * and, for the record, provides sparse documentation for all modules
    and possibilities;
* makes the wrapper reasonably thin, so you can always inspect raw responses
  and raw request MediaWiktory will provide to the API;
* makes the wrapper reasonably smart, so things like "fetch next page for
  this request" or "login with a token" are done with ease (but without
  unnecessary "auto-magic", like fetching 500 pages of data without any
  chance to control this);
* validates requests and simplifies parameters passing, while still
  preserving abilitity to use any existing parameter and feature;
* it manages cookies and tokens for you, but can expose underlying
  Faraday web client so the middleware can be added (like caching).

## Structure and usage

MediaWiktory tries to resemble original API structure. So, each of
original `action`s represented as one of client's methods. All actions
params are represented as nested hashes.

Example: fetch pages from category

```ruby
client.query(
  revisions: :content, # what to fetch for each page
  generator: {categorymembers: {title: 'Countries', limit: 10}}
)
```

The same thing works for entire API.

[Here](#TODO) is cheatsheet for common and interesting operations,
alongside with some comments on how to do more.

### Response

### Request continuing
