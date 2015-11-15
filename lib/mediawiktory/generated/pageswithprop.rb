module MediaWiktory
  class Pageswithprop < MWModule
    symbol :pageswithprop
    prefix "pwp"
    param :propname, Params::String
    param :prop, Params::List[Params::Enum["ids", "title", "value"]]
    param :continue, Params::String
    param :limit, Params::IntegerOrMax
    param :dir, Params::Enum["ascending", "descending"]
  end
end