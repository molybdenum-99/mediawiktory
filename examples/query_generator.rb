$:.unshift 'lib'
require 'mediawiktory'
include MediaWiktory

require 'pp'

c = Client.new('https://en.wikipedia.org/w/api.php')
res = c.query.
  generator(categorymembers: {title: 'Category:Countries_in_South_America', limit: 50}).
  prop(revisions: {prop: ['content']}).
  perform

res.continue! while res.continue?

pp res.pages.map(&:title)
