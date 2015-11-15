module MediaWiktory
  class Gadgets < MWModule
    symbol :gadgets
    prefix "ga"
    param :prop, Params::List[Params::Enum["id", "metadata", "desc"]]
    param :categories, Params::List[Params::String]
    param :ids, Params::List[Params::String]
    param :allowedonly, Params::Boolean
    param :enabledonly, Params::Boolean
  end
end