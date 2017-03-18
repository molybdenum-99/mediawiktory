module MediaWiktory
  class References < MWModule
    symbol :references
    prefix "rf"
    param :continue, Params::String
  end
end