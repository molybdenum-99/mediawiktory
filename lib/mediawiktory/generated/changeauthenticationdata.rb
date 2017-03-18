module MediaWiktory
  class Changeauthenticationdata < Action
    symbol :changeauthenticationdata
    prefix "changeauth"
    post!
    param :request, Params::String
    param :token, Params::String
    param :*, Params::String
  end
end