module MediaWiktory
  class Login < Action
    symbol :login
    prefix "lg"
    post!
    param :name, Params::String
    param :password, Params::String
    param :domain, Params::String
    param :token, Params::String
  end
end