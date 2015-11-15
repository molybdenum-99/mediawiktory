module MediaWiktory
  class Editmassmessagelist < MWModule
    symbol :editmassmessagelist
    post!
    param :spamlist, Params::String
    param :add, Params::List[Params::String]
    param :remove, Params::List[Params::String]
    param :token, Params::String
  end
end