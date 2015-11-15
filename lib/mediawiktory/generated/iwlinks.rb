module MediaWiktory
  class Iwlinks < MWModule
    symbol :iwlinks
    prefix: "iw"
    param :prop, Params::List[Params::Enum["url"]]
    param :prefix, Params::String
    param :title, Params::String
    param :dir, Params::Enum["ascending", "descending"]
    param :limit, Params::IntegerOrMax
    param :continue, Params::String
    param :url, Params::Boolean
  end
end