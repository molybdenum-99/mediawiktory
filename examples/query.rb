$:.unshift 'lib'
require 'mediawiktory'
include MediaWiktory

require 'pp'

c = Client.new('https://en.wikipedia.org/w/api.php')
a = Query.new(c).
  titles('Argentina', 'Chile').
  prop(:categories => {limit: 50, continue: "18951905|Articles_including_recorded_pronunciations"})

pp a.perform
