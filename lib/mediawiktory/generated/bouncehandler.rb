module MediaWiktory
  class Bouncehandler < MWModule
    symbol :bouncehandler
    post!
    param :email, Params::String
  end
end