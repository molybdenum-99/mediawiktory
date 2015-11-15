#!/usr/bin/env ruby

require 'pp'

require 'bundler/setup'
require 'faraday'
require 'nokogiri'
require 'hashie'
require 'yaml'

$:.unshift 'lib'
require 'faraday/naive_cache'
require 'nokogiri/more'

require_relative 'lib/api'

main = ApiParser::Module.from_url('/w/api.php?action=help&module=query')
File.write 'script/data/api.yaml', main.to_yaml
main.write('lib/mediawiktory/generated')
