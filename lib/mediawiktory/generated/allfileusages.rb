module MediaWiktory
  class Allfileusages < MWModule
    symbol :allfileusages
    prefix: "af"
    param :continue, Params::String
    param :from, Params::String
    param :to, Params::String
    param :prefix, Params::String
    param :unique, Params::Boolean
    param :prop, Params::List[Params::Enum["ids", "title"]]
    param :limit, Params::IntegerOrMax
    param :dir, Params::Enum["ascending", "descending"]
  end
end