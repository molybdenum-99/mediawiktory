module MediaWiktory
  class Thank < MWModule
    symbol :thank
    post!
    param :rev, Params::Integer
    param :token, Params::String
    param :source, Params::String
  end
end