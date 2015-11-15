module MediaWiktory
  class Thank < Action
    symbol :thank
    post!
    param :rev, Params::Integer
    param :token, Params::String
    param :source, Params::String
  end
end