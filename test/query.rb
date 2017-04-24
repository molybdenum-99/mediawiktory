$:.unshift 'lib'

require 'mediawiktory'
require 'pp'

#puts MediaWiktory::Wikipedia::Api.new.query.titles('Argentina').perform
pp JSON.parse( MediaWiktory::Wikipedia::Api.new.query.titles('Argentina').prop(:revisions).limit('max').format(:json).perform )
