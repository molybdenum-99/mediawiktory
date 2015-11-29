$:.unshift 'lib'
require 'mediawiktory'
include MediaWiktory

require 'pp'

c = Client.new('https://en.wikipedia.org/w/api.php')
res = c.query.
  prop(revisions: {prop: ['content']}).
  generator(gcategorymembers: {title: 'Category:Countries_in_South_America', limit: 50}).
  perform

res.continue! while res.continue?

pp res.pages.map(&:title)
