module ApiParser
  class << self
    def client
      @client ||= Faraday.new('https://en.wikipedia.org') do |builder|
        builder.use Faraday::NaiveCache
        builder.adapter Faraday.default_adapter
      end
    end
  end

  %w[module parameter].each do |mod|
    require_relative mod
  end
end
