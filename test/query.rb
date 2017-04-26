$:.unshift 'lib'

require 'mediawiktory'
require 'pp'

#puts MediaWiktory::Wikipedia::Api.new.query.titles('Argentina').perform
#pp JSON.parse( MediaWiktory::Wikipedia::Api.new.query.titles('Argentina').prop(:revisions).limit('max').format(:json).perform )


pp JSON.parse( MediaWiktory::Wikipedia::Api.new.query.generator(:geosearch).page('London').format(:json).perform )
# pp JSON.parse( MediaWiktory::Wikipedia::Api.new('https://ru.wikipedia.org/w/api.php').query.generator(:geosearch).limit(100).page('').format(:json).perform )
