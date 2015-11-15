module MediaWiktory
  class Allcategories < MWModule
    symbol :allcategories
    prefix "ac"
    param :from, Params::String
    param :continue, Params::String
    param :to, Params::String
    param :prefix, Params::String
    param :dir, Params::Enum["ascending", "descending"]
    param :min, Params::Integer
    param :max, Params::Integer
    param :limit, Params::IntegerOrMax
    param :prop, Params::List[Params::Enum["size", "hidden"]]
  end
end