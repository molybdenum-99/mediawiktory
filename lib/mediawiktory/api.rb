# frozen_string_literal: true

module MediaWiktory
  class Api
    attr_reader :client

    def initialize(url, **options)
      @client = Client.new(url, **options)
    end
  end
end
