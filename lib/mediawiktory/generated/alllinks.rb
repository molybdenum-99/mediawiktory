module MediaWiktory
  class Alllinks < MWModule
    symbol :alllinks
    prefix "al"
    param :continue, Params::String
    param :from, Params::String
    param :to, Params::String
    param :prefix, Params::String
    param :unique, Params::Boolean
    param :prop, Params::List[Params::Enum["ids", "title"]]
    param :namespace, Params::Enum["0", "1", "2", "3", "4", "5", "6", "7", "8", "9", "10", "11", "12", "13", "14", "15", "100", "101", "108", "109", "118", "119", "2300", "2301", "2302", "2303", "710", "711", "446", "447", "2600", "828", "829"]
    param :limit, Params::IntegerOrMax
    param :dir, Params::Enum["ascending", "descending"]
  end
end