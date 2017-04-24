# frozen_string_literal: true

require 'addressable/uri'
require 'faraday'
require 'faraday_middleware'

module MediaWiktory
  %w[version client action util api].each do |mod|
    require_relative "mediawiktory/#{mod}"
  end

  require_relative 'mediawiktory/wikipedia'
end
