require 'addressable/uri'
require 'faraday'

module MediaWiktory
  %w[client mw_module action page].each do |mod|
    require_relative "mediawiktory/#{mod}"
  end

  Dir[File.expand_path('../mediawiktory/generated/*.rb', __FILE__)].each do |gen|
    require gen
  end

  %w[query].each do |mod|
    require_relative "mediawiktory/#{mod}"
  end
end
