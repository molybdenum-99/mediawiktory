module MediaWiktory
  # @private
  module Util
    module_function

    def stringify_hash(hash)
      hash.map { |k, v| [k.to_s, v.to_s] }.to_h
    end
  end
end
