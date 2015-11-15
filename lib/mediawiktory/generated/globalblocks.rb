module MediaWiktory
  class Globalblocks < MWModule
    symbol :globalblocks
    prefix: "bg"
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :dir, Params::Enum["newer", "older"]
    param :ids, Params::List[Params::Integer]
    param :addresses, Params::List[Params::String]
    param :ip, Params::String
    param :limit, Params::IntegerOrMax
    param :prop, Params::List[Params::Enum["id", "address", "by", "timestamp", "expiry", "reason", "range"]]
  end
end