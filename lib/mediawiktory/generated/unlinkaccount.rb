module MediaWiktory
  class Unlinkaccount < Action
    symbol :unlinkaccount
    post!
    param :request, Params::String
    param :token, Params::String
  end
end