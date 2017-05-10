# MediaWiktory, The MediaWiki Client

[![Gem Version](https://badge.fury.io/rb/mediawiktory.svg)](http://badge.fury.io/rb/mediawiktory)
[![Build Status](https://travis-ci.org/molybdenum-99/mediawiktory.svg?branch=master)](https://travis-ci.org/molybdenum-99/mediawiktory)

**MediaWiktory** is a MediaWiki (think Wikipedia, Wiktionary and others) API client. It is the only
client that allows (almost) full access to MediaWiki API powers without loosing of Ruby powers.

No, seriously.

[MediaWiki API](https://www.mediawiki.org/wiki/API:Main_page) currently is very powerful and
full-featured (thought not very easy to use). Things like "fetch first 50 pages from that category
alongside with their revision history and interwiki links and mediafile stats" are typically done
with one carefully constructed request and return lots of useful information.

Yes, there already are [several](https://www.mediawiki.org/wiki/API:Client_code#Ruby)
API clients for Ruby, including ["official" one](https://github.com/wikimedia/mediawiki-ruby-api).
Typical approach for all of them is thick wrapper around some functionality (like "login and edit
pages" or "search and analyze pages"), and leave all the other cool things for generic `action` method
(at best), or without any coverage at all.

MediaWiktory, to the contrary is:

* **thin** wrapper...
* around **all** MediaWiki API features...
* making access to them available through idiomatic Ruby code, easy to use and clearly documented.

## Examples

**Example 1.** Fetching page's text and metadata:

```ruby
api = MediaWiktory::Wikipedia::Api.new
response = api.query.       # "query" action is a basis for all pages/categories/meta receiving
  titles('Argentina').      # query page titles: Argentina
  prop(:info, :revisions).  # query page properties: info, revisions
  prop(:url, :content).     # query those properties subproperties: full URL (from info) and content (from revisions)
  response                  # perform query and parse it!

page = response['pages'].values.first
puts page['title']
# Prints:
#  Argentina
puts page['fullurl']
# Prints:
#  https://en.wikipedia.org/wiki/Argentina
puts page['revisions'].first['*'].slice(0..200) # first 200 chars of page contents
# Prints:
#  {{other uses}}
#  {{pp-semi|small=yes}}
#  {{Use dmy dates|date=March 2017}}
#  {{Coord|34|S|64|W|display=title}}
#  {{Infobox country
#  |coordinates = {{Coord|34|36|S|58|23|W|type:city}}
#  |conventional_long_name = A
```

Note, that for using MediaWiktory API wrapper you need to understand the underlying API. While previous
experience might make you expect something like `api.page('Argentina').text`, in fact you should
use the `query` action, request page title 'Argentina', its `:revisions` property, its `:content`
subproperty—and voila, you have a _1-element list of revisions_ for the page and last revisions `'*'`
key has page's text.

The good news is all methods are documented at [RubyDoc.info](http://www.rubydoc.info/gems/mediawiktory).
Most of the time, the documentation has enough details, so you don't need to refer to MediaWiki
official docs.

**Example 2:** Editing the page (we are editing [Sandbox](https://en.wikipedia.org/wiki/Wikipedia:Sandbox)
here, which is safe, but be careful while experimenting, this code **really** replaces page's text!):

```ruby
token = api.query.meta(:tokens).response.dig('tokens', 'csrftoken')
response = api.edit.title('Wikipedia:Sandbox').text("Test '''me''', MediaWiktory!").token(token).response
response.to_h
# => {"result"=>"Success", "pageid"=>16283969, "title"=>"Wikipedia:Sandbox", "contentmodel"=>"wikitext", "oldrevid"=>779502714, "newrevid"=>779502729, "newtimestamp"=>"2017-05-09T08:24:26Z"}

# This, without token, will raise:
api.edit.title('Wikipedia:Sandbox').text("Test '''me''', MediaWiktory without token!").response
# MediaWiktory::Wikipedia::Response::Error: The "token" parameter must be set.
```

**Example 3:** Fetching all "main" page images for the pages of category:

```ruby
response = api.query.                   # "query" action again
  generator(:categorymembers).          # instead of listing titles, we use "page list generator": all members of a category
  title('Category:1960s_automobiles').  # ...of this category
  prop(:pageimages).prop(:thumbnail).   # and fetch "pageimages" property, its "thumbnail" sub-property
  limit('max').                         # limit to maximum number of pages available in one response
  response

# You can fetch ALL of them with, it will be a lot:
# response = response.continue while response.continue?

response.to_h['pages'].values.each do |page|
  puts "#{page['title']}: #{page.dig('thumbnail', 'source')}"
end
# AC Cobra: https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Shelby_AC_427_Cobra_vl_blue.jpg/50px-Shelby_AC_427_Cobra_vl_blue.jpg
# Acadian (automobile):
# Alfa Romeo 33 Stradale: https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/1968_Alfa_Romeo_Tipo_33_Stradale.jpg/50px-1968_Alfa_Romeo_Tipo_33_Stradale.jpg
# Alfa Romeo 105/115 Series Coupés: https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Alfa_Romeo_GT_1300_Junior.jpg/50px-Alfa_Romeo_GT_1300_Junior.jpg
# Alfa Romeo 1750 Berlina: https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Alfa_Romeo_1750_berlina_grey-front.JPG/50px-Alfa_Romeo_1750_berlina_grey-front.JPG
# Alfa Romeo 2000: https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Alfa_2000_touring_spider.JPG/50px-Alfa_2000_touring_spider.JPG
# Alfa Romeo 2600: https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Alfa-Romeo_2600-Spider-Touring.JPG/50px-Alfa-Romeo_2600-Spider-Touring.JPG
# ...
```

## Usage

```
gem install mediawiktory
```

There are a lot of popular installations of MediaWiki besides Wikipedia. All of them are having
different versions installed with different features enabled and custom extensions turned on.

To catch with this multitude of features, MediaWiktory provides two ways of usage.

### 1. Use default wrapper, generated from English Wikipedia:

```ruby
require 'mediawiktory'
api = MediaWiktory::Wikipedia::Api.new # => English Wikipedia
# or
api = MediaWiktory::Wikipedia::Api.new('http://some.site/w/api.php') # => any other MediaWiki
```

...and wonder through docs of [MediaWiktory::Wikipedia::Api](http://www.rubydoc.info/gems/mediawiktory/MediaWiktory/Wikipedia/Api)
class to understand what you can do.

### 2. Custom wrapper generation.
```
mediawiktory-gen -u http://some.site/w/api.php --path lib/path/to/wrapper --namespace My::Wrapper
```
This will generate `My::Wrapper::Api` class and a lot of other classes wrapping all actions and
modules of target APIs. The generated code is **independent** of MediaWiktory (so you can exclude it
from your runtime), and depends only on `addressable`, `faraday` and `faraday_middleware` gems.

The usage of custom wrapper is basically the same:

```ruby
require 'path/to/wrapper/api'
api = My::Wrapper::Api.new
api.query # .and.so.on
```

You need custom wrapper if:

* you want to have the exact list of features your site has: for example, with Wikia sites, most of
  generic functionality (like query and edit) will work, but most of fancy modern Wikipedia actions
  will fail with "unknown action";
* your target site has some custom actions and modules: for example, most informative Wikidata actions
  are custom ones, like [wbgetentities](https://www.wikidata.org/w/api.php?action=help&modules=wbgetentities),
  they are not present in default wrapper;
* you want to catch up with some edge Wikipedia features; Wikipedia wrapper is generated on gem
  release, but Wikipedia's API changes everyday with new small and large exerimental features.

**Generator limitations:** Wrapper is generated from [HTML docs of API](en.wikipedia.org/w/api.php),
but currently generator can't process old MediaWiki versions ASCII docs format, which, unfortunately,
is stil in use on [Wikia](https://marvel.wikia.com/api.php), for example. It is subject to further
development, as some "old" installations of MediaWiki provide pretty useful content and a lot of
custom modules.

If you integrate wrapper generated by MediaWiktory into some other library, you should note that:

* All generated code is documented in YARD format, Markdown markup flavour;
* If you use Rubocop, you will find some "good code" practices broken in generated code, because it
  is hard to follow them in large code generation.

## Roadmap

* Expose underlying Faraday client for fine-tuning;
* Handle cookies automatically (for logging in);
* Handle file uploads (should be done as multipart, use appropriate Faraday middleware);
* Add parser for outdated ASCII docs.

## Authors

* [Victor Shepelev](https://zverok.github.io) [@zverok](https://github.com/zverok);
* Serhiy Mostovyi [@smostovoy](https://github.com/smostovoy).

## License

[MIT](https://github.com/molybdenum-99/mediawiktory/blob/master/LICENSE.txt)
