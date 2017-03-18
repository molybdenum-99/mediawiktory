module MediaWiktory
  class Mergehistory < Action
    symbol :mergehistory
    post!
    param :from, Params::String
    param :fromid, Params::Integer
    param :to, Params::String
    param :toid, Params::Integer
    param :timestamp, Params::Timestamp
    param :reason, Params::String
    param :token, Params::String
  end
end