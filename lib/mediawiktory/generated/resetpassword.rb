module MediaWiktory
  class Resetpassword < Action
    symbol :resetpassword
    post!
    param :user, Params::String
    param :email, Params::String
    param :token, Params::String
  end
end