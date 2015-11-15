module MediaWiktory
  class Abuselog < MWModule
    symbol :abuselog
    prefix "afl"
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :dir, Params::Enum["newer", "older"]
    param :user, Params::String
    param :title, Params::String
    param :filter, Params::List[Params::String]
    param :limit, Params::IntegerOrMax
    param :prop, Params::List[Params::Enum["ids", "filter", "user", "ip", "title", "action", "details", "result", "timestamp", "hidden", "revid"]]
  end
end