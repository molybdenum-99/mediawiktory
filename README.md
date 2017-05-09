# MediaWiktory, The MediaWiki Client

**MediaWiktory** is MediaWiki (think Wikipedia, Wiktionary and others) API client that doesn't suck.
No, seriously.

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

MediaWiktory, to the contrary is:

* **thin** wrapper...
* around **all** MediaWiki API features...
* making access to them available through idiomatic Ruby code, easy to use and clearly documented.

## Examples

**Example 1.** Fetching page's text and metadata:

```ruby
api = MediaWiktory::Wikipedia::Api.new
response = api.query.
  titles('Argentina').
  prop(:info, :revisions).
  prop(:url, :content).
  response

page = response['pages'].values.first
puts page['title']
# Prints:
#  Argentina
puts page['fullurl']
# Prints:
#  https://en.wikipedia.org/wiki/Argentina
puts page['revisions'].first['*'].slice(0..200)
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
experience might make you expect something like `api.pages('Argentina').text`, in fact you should
use the `query` action, request page title 'Argentina', its `:revisions` property, its `:content`
subproperty—and voila, you have a _1-element list of revisions_ for the page and last revisions `'*'`
key has page's text.

The good news is all methods are documented at [rubydoc.info](#TODO), most of the time documentation
has enough details, so you don't need to refer to MediaWiki official docs.

**Example 2:** Editing the page (we are editing [Sandbox](https://en.wikipedia.org/wiki/Wikipedia:Sandbox)
here, which is safe, but be careful while experimenting, this code is **really** replaces page's text!):

```ruby
token = api.query.meta(:tokens).response.dig('tokens', 'csrftoken')
response = api.edit.title('Wikipedia:Sandbox').text("Test '''me''', MediaWiktory!").token(token).response
response.to_h
# => {"result"=>"Success", "pageid"=>16283969, "title"=>"Wikipedia:Sandbox", "contentmodel"=>"wikitext", "oldrevid"=>779502714, "newrevid"=>779502729, "newtimestamp"=>"2017-05-09T08:24:26Z"}

# This, without token, will raise:
pp api.edit.title('Wikipedia:Sandbox').text("Test '''me''', MediaWiktory without token!").response
# Throws: The "token" parameter must be set. (MediaWiktory::Wikipedia::Response::Error)

```

**Example 3:** Fetching all "main" page images for the pages of category:

```ruby
response = api.query.
  generator(:categorymembers).title('Category:1960s_automobiles').
  prop(:pageimages).prop(:thumbnail, :name).
  limit('max').response

# You can fetch ALL of them with, it will be a lot:
# response = response.continue while response.continue?

response.to_h['pages'].values.each do |page|
  puts "#{page['title']}: #{page.dig('thumbnail', 'source')}"
end
#  AC Cobra: https://upload.wikimedia.org/wikipedia/commons/thumb/e/e8/Shelby_AC_427_Cobra_vl_blue.jpg/50px-Shelby_AC_427_Cobra_vl_blue.jpg
#  Acadian (automobile):
#  Alfa Romeo 33 Stradale: https://upload.wikimedia.org/wikipedia/commons/thumb/e/eb/1968_Alfa_Romeo_Tipo_33_Stradale.jpg/50px-1968_Alfa_Romeo_Tipo_33_Stradale.jpg
#  Alfa Romeo 105/115 Series Coupés: https://upload.wikimedia.org/wikipedia/commons/thumb/8/81/Alfa_Romeo_GT_1300_Junior.jpg/50px-Alfa_Romeo_GT_1300_Junior.jpg
#  Alfa Romeo 1750 Berlina: https://upload.wikimedia.org/wikipedia/commons/thumb/2/20/Alfa_Romeo_1750_berlina_grey-front.JPG/50px-Alfa_Romeo_1750_berlina_grey-front.JPG
#  Alfa Romeo 2000: https://upload.wikimedia.org/wikipedia/commons/thumb/f/f6/Alfa_2000_touring_spider.JPG/50px-Alfa_2000_touring_spider.JPG
#  Alfa Romeo 2600: https://upload.wikimedia.org/wikipedia/commons/thumb/6/6b/Alfa-Romeo_2600-Spider-Touring.JPG/50px-Alfa-Romeo_2600-Spider-Touring.JPG
```

## Usage

There are a lot of popular installations of MediaWiki besides Wikipedia. All of them are having
different versions installed
