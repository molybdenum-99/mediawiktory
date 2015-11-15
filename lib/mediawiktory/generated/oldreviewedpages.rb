module MediaWiktory
  class Oldreviewedpages < MWModule
    symbol :oldreviewedpages
    prefix "or"
    param :start, Params::Timestamp
    param :end, Params::Timestamp
    param :dir, Params::Enum["newer", "older"]
    param :maxsize, Params::Integer
    param :filterwatched, Params::Enum["watched", "all"]
    param :namespace, Params::List[Params::Enum["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "2300", "2301", "2302", "2303", "710", "711", "446", "447", "2600", "828", "829"]]
    param :category, Params::String
    param :filterredir, Params::Enum["redirects", "nonredirects", "all"]
    param :limit, Params::IntegerOrMax
  end
end