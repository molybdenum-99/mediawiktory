$:.unshift 'lib'
require 'mediawiktory'
include MediaWiktory

require 'pp'

c = Client.new('https://en.wikipedia.org/w/api.php')
a = Query.new(c).
  titles('Argentina', 'Chile').
  prop(:categories)

res = a.perform
res.continue! while res.continue?

pp res.pages.map(&:to_h)
