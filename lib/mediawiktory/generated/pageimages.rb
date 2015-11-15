module MediaWiktory
  class Pageimages < MWModule
    symbol :pageimages
    prefix: "pi"
    param :prop, Params::List[Params::Enum["thumbnail", "name"]]
    param :thumbsize, Params::Integer
    param :limit, Params::IntegerOrMax
    param :continue, Params::Integer
  end
end