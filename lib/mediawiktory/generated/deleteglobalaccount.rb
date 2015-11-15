module MediaWiktory
  class Deleteglobalaccount < MWModule
    symbol :deleteglobalaccount
    post!
    param :user, Params::String
    param :reason, Params::String
    param :token, Params::String
  end
end