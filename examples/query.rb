$:.unshift 'lib'
require 'mediawiktory'
include MediaWiktory

c = Client.new('https://en.wikipedia.org/w/api.php')
a = Query.new(c).
  titles('Argentine', 'Chile').
  prop(:categories)

puts a.perform.body
