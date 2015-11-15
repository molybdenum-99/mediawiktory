module MediaWiktory
  class Unblock < MWModule
    symbol :unblock
    post!
    param :id, Params::Integer
    param :user, Params::String
    param :reason, Params::String
    param :token, Params::String
  end
end