require 'nokogiri' # FIXME: catch if unavailable
require 'nokogiri/more'
require 'pp'

module MediaWiktory
  module ApiParser
  end
end

require_relative 'api_parser/api'
require_relative 'api_parser/module'
require_relative 'api_parser/param'
