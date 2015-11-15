module MediaWiktory
  class Watchlistraw < MWModule
    symbol :watchlistraw
    prefix: "wr"
    param :continue, Params::String
    param :namespace, Params::List[Params::Enum["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "2300", "2301", "2302", "2303", "710", "711", "446", "447", "2600", "828", "829"]]
    param :limit, Params::IntegerOrMax
    param :prop, Params::List[Params::Enum["changed"]]
    param :show, Params::List[Params::Enum["changed", "!changed"]]
    param :owner, Params::String
    param :token, Params::String
    param :dir, Params::Enum["newer", "older"]
    param :fromtitle, Params::String
    param :totitle, Params::String
  end
end