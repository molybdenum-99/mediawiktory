module MediaWiktory
  class Abusefilters < MWModule
    symbol :abusefilters
    prefix "abf"
    param :startid, Params::Integer
    param :endid, Params::Integer
    param :dir, Params::Enum["newer", "older"]
    param :show, Params::List[Params::Enum["enabled", "!enabled", "deleted", "!deleted", "private", "!private"]]
    param :limit, Params::IntegerOrMax
    param :prop, Params::List[Params::Enum["id", "description", "pattern", "actions", "hits", "comments", "lasteditor", "lastedittime", "status", "private"]]
  end
end