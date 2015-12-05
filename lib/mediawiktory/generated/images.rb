module MediaWiktory
  class Images < MWModule
    symbol :images
    prefix "im"
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
    param :images, Params::List[Params::String]
    param :dir, Params::Enum[:ascending, :descending]
  end
end