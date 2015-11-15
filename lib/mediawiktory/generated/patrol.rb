module MediaWiktory
  class Patrol < MWModule
    symbol :patrol
    post!
    param :rcid, Params::Integer
    param :revid, Params::Integer
    param :token, Params::String
  end
end