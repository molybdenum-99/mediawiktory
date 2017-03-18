module MediaWiktory
  class Oathvalidate < Action
    symbol :oathvalidate
    post!
    param :user, Params::String
    param :totp, Params::String
    param :token, Params::String
  end
end