module MediaWiktory
  class Compare < Action
    symbol :compare
    param :fromtitle, Params::String
    param :fromid, Params::Integer
    param :fromrev, Params::Integer
    param :totitle, Params::String
    param :toid, Params::Integer
    param :torev, Params::Integer
  end
end