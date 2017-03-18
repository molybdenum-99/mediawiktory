module MediaWiktory
  class Removeauthenticationdata < Action
    symbol :removeauthenticationdata
    post!
    param :request, Params::String
    param :token, Params::String
  end
end