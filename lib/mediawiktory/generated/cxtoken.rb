module MediaWiktory
  class Cxtoken < MWModule
    symbol :cxtoken
    post!
    param :token, Params::String
  end
end