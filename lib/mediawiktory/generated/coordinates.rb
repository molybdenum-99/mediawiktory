module MediaWiktory
  class Coordinates < MWModule
    symbol :coordinates
    prefix: "co"
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
    param :prop, Params::List[Params::Enum["type", "name", "dim", "country", "region", "globe"]]
    param :primary, Params::Enum["primary", "secondary", "all"]
    param :distancefrompoint, Params::String
    param :distancefrompage, Params::String
  end
end