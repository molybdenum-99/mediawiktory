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

**Warning: Above is IDEAL state of the library. Current state, at
version 0.0.1 is far less impressive (yet already useful).**

## Structure and usage

MediaWiktory tries to resemble original API structure, but make its calls
more Ruby-ish. So, [Arel](https://github.com/rails/arel)-alike "chainable
query" approach is implemented.

Fast example:

**Goal**: fetch content for first 30 pages from category "Countries in
South America".

**Raw request** (split in lines for readability):

```
https://en.wikipedia.org/w/api.php?
  action=query&
  generator=categorymembers&
  gcmtitle=Category:Countries_in_South_America&
  gcmlimit=30&
  prop=revisions&
  rvprop=content
```

**MediaWiktory request**—almost the same, but structured and validated
on-the-fly, and without `gcm` and `rv` prefixes black magic:

```ruby
client = MediaWiktory::Client.new('https://en.wikipedia.org/w/api.php')

response = client.
  query.
  generator(categorymembers: {title: 'Category:Countries_in_South_America', limit: 30}).
  prop(revisions: {prop: :content}).
  perform

# MediaWiktory handles "next page fetching" for you, if you want
response.continue! while response.can_continue?

# MediaWiktory parses response and provides smart shortcuts
p response.pages.map(&:title)
```

The same approach works for ANY `action` described in [docs](https://en.wikipedia.org/w/api.php),
and all of its "modules" and "submodules".

**NB**: its 0.0.1, ok? Domain is complex and is still investigated. For
example, above statement definitely **wants** to look like

```ruby
response = client.
  query.
  generator(categorymembers: 'Category:Countries_in_South_America').
  limit(30).
  prop(revisions: :content).
  perform
```

...but it should be done without flexibility loss.

## Author

[Victor Shepelev](http://zverok.github.io)

## License

MIT.
