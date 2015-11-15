module MediaWiktory
  class Tags < MWModule
    symbol :tags
    prefix: "tg"
    param :continue, Params::String
    param :limit, Params::IntegerOrMax
    param :prop, Params::List[Params::Enum["name", "displayname", "description", "hitcount", "defined", "source", "active"]]
  end
end