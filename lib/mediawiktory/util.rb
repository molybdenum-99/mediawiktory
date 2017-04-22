module MediaWiktory
  # @private
  module Util
    module_function

    def stringify_hash(hash, recursive: false)
      hash.map { |k, v|
        [k.to_s, v.is_a?(Hash) && recursive ? stringify_hash(v) : v.to_s]
      }.to_h
    end
  end
end
