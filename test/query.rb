$:.unshift 'lib'

require 'mediawiktory'
require 'pp'

api = MediaWiktory::Wikipedia::Api

#puts MediaWiktory::Wikipedia::Api.new.query.titles('Argentina').perform
#pp JSON.parse( MediaWiktory::Wikipedia::Api.new.query.titles('Argentina').prop(:revisions).limit('max').format(:json).perform )


#pp JSON.parse( MediaWiktory::Wikipedia::Api.new.query.generator(:geosearch).page('London').format(:json).perform )
# pp JSON.parse( MediaWiktory::Wikipedia::Api.new('https://ru.wikipedia.org/w/api.php').query.generator(:geosearch).limit(100).page('').format(:json).perform )

#pp JSON.parse( MediaWiktory::Wikipedia::Api.new.query.meta(:tokens).format(:json).perform )

#pp api.new.query.titles('Argentina').prop(:revisions).meta(:siteinfo).response

#pp api.new.compare.fromtitle('Argentina').totitle('Ukraine').query.titles('Argentina').prop(:revisions).response.keys

#pp api.new.query.generator(:categorymembers).title('Category:DOS_games').limit('max').response

#puts api.new.query.generator(:categorymembers).title('Categor:Argentina').limit('max').format(:json).perform

#r1 = api.new.query.generator(:categorymembers).title('Category:DOS_games').response
#pp r1, r1.to_h
#r2 = r1.continue
#pp r2, r2.to_h


#action = api.new.query.titles('Argentina').prop(:revisions).prop(:content).meta(:siteinfo)
#p action

#p action.to_url


#response = action.response
#p response

#puts response['pages'].values.first['revisions'].first['*'].split("\n").first(3)
#p response.dig('general', 'sitename')
# => "Wikipedia"

#pp api.new.query.generator(:categorymembers).title('Category:It is not a category').limit('max').response.raw
#pp api.new.query.generator(:prefixsearch).search('Ukrainian hr').limit('max').to_url
pp api.new.query.titles('Argentina').prop(:revisions).prop(:content, :timestamp).prop(:info).prop(:url).response
