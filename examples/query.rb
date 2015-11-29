$:.unshift 'lib'
require 'mediawiktory'
include MediaWiktory

require 'pp'

c = Client.new('https://en.wikipedia.org/w/api.php')
res = c.query.
  titles('Argentina', 'Chile').
  prop(:categories).
  perform

res.continue! while res.continue?

pp res.pages.map(&:to_h)
