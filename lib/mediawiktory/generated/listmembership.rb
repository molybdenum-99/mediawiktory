module MediaWiktory
  class Listmembership < MWModule
    symbol :listmembership
    prefix "lsm"
    param :id, Params::Integer
    param :owner, Params::String
    param :token, Params::String
    param :continue, Params::String
  end
end