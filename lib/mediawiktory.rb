require 'addressable/uri'
require 'faraday'
require 'faraday_middleware'

module MediaWiktory
  %w[version client action util].each do |mod|
    require_relative "mediawiktory/#{mod}"
  end
end
