module MediaWiktory
  # FIXME: maybe, its a wrongdoing
  # But for now, I cant invent wiser structure for MediaWiki's
  # {'numericpageid' => {page}} hash
  #
  # Having it as a hash complicates code (most time you just need a list
  # of pages), dropping keys completely and using only values seem to
  # have its own drawbacks.
  #
  class ArrayWithKeys < Array
    def self.from_hash(hash)
      new(hash.values, hash.keys)
    end

    attr_reader :keys
    
    def initialize(values, keys)
      super(values)
      @keys = keys
    end

    def [](key)
      case key
      when Fixnum
        super
      else
        idx = @keys.index(key)
        idx && super(idx)
      end
    end

    def to_h
      keys.zip(self).to_h
    end
  end
end
