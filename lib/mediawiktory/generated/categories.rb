module MediaWiktory
  class Categories < MWModule
    symbol :categories
    prefix "cl"
    param :prop, Params::List[Params::Enum[:sortkey, :timestamp, :hidden]]
    param :show, Params::List[Params::Enum[:hidden, :"!hidden"]]
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
    param :categories, Params::List[Params::String]
    param :dir, Params::Enum[:ascending, :descending]
  end
end