module MediaWiktory
  class Bouncehandler < Action
    symbol :bouncehandler
    post!
    param :email, Params::String
  end
end