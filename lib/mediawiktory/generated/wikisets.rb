module MediaWiktory
  class Wikisets < MWModule
    symbol :wikisets
    prefix: "ws"
    param :from, Params::String
    param :prop, Params::List[Params::Enum["type", "wikisincluded", "wikisnotincluded"]]
    param :limit, Params::IntegerOrMax
    param :orderbyname, Params::Boolean
  end
end