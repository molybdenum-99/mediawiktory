require 'bundler/setup'
require 'faraday'
$:.unshift 'lib'
require 'faraday/naive_cache'

c = Faraday.new do |builder|
  builder.use Faraday::NaiveCache

  builder.adapter Faraday.default_adapter
end

require 'pp'

resp = c.get('https://github.com')
pp resp.status
