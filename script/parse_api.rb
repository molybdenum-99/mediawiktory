require 'pp'

require 'bundler/setup'
require 'faraday'
require 'nokogiri'

$:.unshift 'lib'
require 'faraday/naive_cache'
require 'nokogiri/more'

require 'hashie'

start = '/w/api.php?action=help'

require 'yaml'

#start = '/w/api.php?action=help'
#File.write 'tmp/api.yaml', Api::Module.new('/w/api.php?action=help').to_hash.to_yaml
#File.write 'tmp/api.yaml', Api::Module.new('/w/api.php?action=help&modules=query').to_hash.to_yaml
#pp Api::Module.new("/w/api.php?action=help&modules=query%2Bextlinks").to_hash

require_relative 'lib/api'

main = ApiParser::Module.from_url('/w/api.php?action=help')
puts main.to_yaml

__END__

TODO:
  generators — отдельная штука, их надо обрабатывать
  separate with, max values → признак того, что это список!
