module MediaWiktory
  class Patrol < Action
    symbol :patrol
    post!
    param :rcid, Params::Integer
    param :revid, Params::Integer
    param :token, Params::String
  end
end