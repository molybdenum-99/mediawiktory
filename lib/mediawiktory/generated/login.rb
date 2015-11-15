module MediaWiktory
  class Login < MWModule
    symbol :login
    prefix: "lg"
    post!
    param :name, Params::String
    param :password, Params::String
    param :domain, Params::String
    param :token, Params::String
  end
end