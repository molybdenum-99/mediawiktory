require 'addressable/uri'
require 'faraday'
require 'faraday_middleware'

module MediaWiktory
  %w[version client action util].each do |mod|
    require_relative "mediawiktory/#{mod}"
  end

  #Dir[File.expand_path('../mediawiktory/generated/*.rb', __FILE__)].each do |gen|
    #require gen
  #end

  #%w[query].each do |mod|
    #require_relative "mediawiktory/#{mod}"
  #end
end
