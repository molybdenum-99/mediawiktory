module MediaWiktory
  class Cxtoken < Action
    symbol :cxtoken
    post!
    param :token, Params::String
  end
end