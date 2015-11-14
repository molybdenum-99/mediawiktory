require 'addressable/uri'
require 'faraday'

module MediaWiktory
  %w[client mw_module].each do |mod|
    require_relative "mediawiktory/#{mod}"
  end
end
