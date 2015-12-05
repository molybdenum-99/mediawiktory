module MediaWiktory
  class Page
    attr_reader :id, :title, :raw

    def initialize(raw)
      @raw = raw
      @title = raw.title
      @id = raw.pageid
    end

    def content
      revisions.first['*']
    end

    def missing?
      !!raw.missing
    end

    def invalid?
      !!raw.invalid
    end

    def exists?
      !missing? && !invalid?
    end

    def merge!(other)
      id == other.id or
        fail(ArgumentError, "Trying to merge different pageids: #{id}/#{other.id}")
        
      other.raw.each do |key, value|
        raw.key?(key) or fail(ArgumentError, "Unknown key in continued page: #{key}")
        next unless raw[key].is_a?(Array)
        raw[key].concat(value)
      end
    end

    def method_missing(sym, *args)
      super unless args.empty?
      exists? or
        fail("Page #{title} is missing, can't access #{sym}")
        
      raw.fetch(sym)
    end
  end
end
