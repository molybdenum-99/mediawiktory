module MediaWiktory
  class Validatepassword < Action
    symbol :validatepassword
    post!
    param :password, Params::String
    param :user, Params::String
    param :email, Params::String
    param :realname, Params::String
  end
end